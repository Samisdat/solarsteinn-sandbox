#!/usr/bin/env bash
# Refill the pool of review PRs: one open PR per scenario, untouched PRs stay, used-up ones are replaced.
#
#   scripts/reconcile.sh            # needs gh auth (GH_TOKEN) and push rights
#   DRY_RUN=1 scripts/reconcile.sh  # print what would change, mutate nothing
#   BUILD_ONLY=1 scripts/reconcile.sh  # build seed + scenario commits locally, no network
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

DRY_RUN="${DRY_RUN:-}"
BUILD_ONLY="${BUILD_ONLY:-}"
REPO="${GITHUB_REPOSITORY:-}"
if [[ -z "$BUILD_ONLY" && -z "$REPO" ]]; then
  REPO="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
fi

# Fixed identity and dates: identical input gives identical commit hashes.
export GIT_AUTHOR_NAME="github-actions[bot]" GIT_COMMITTER_NAME="github-actions[bot]"
export GIT_AUTHOR_EMAIL="41898282+github-actions[bot]@users.noreply.github.com"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
export GIT_AUTHOR_DATE="2026-01-01T00:00:00Z" GIT_COMMITTER_DATE="2026-01-01T00:00:00Z"
GIT=(git -c commit.gpgsign=false -c core.autocrlf=false -c core.safecrlf=false -c core.hooksPath=/dev/null)

log() { printf '%s\n' "$*" >&2; }
run() { if [[ -n "$DRY_RUN" || -n "$BUILD_ONLY" ]]; then log "  [dry] $*"; else "$@"; fi; }

TMP="$(mktemp -d)"
trap 'git worktree prune; rm -rf "$TMP"' EXIT

# --- seed commit: the tree of seed/ as one parentless commit -------------------------------
INDEX="$TMP/index"
(cd seed && GIT_DIR="$ROOT/.git" GIT_WORK_TREE="$PWD" GIT_INDEX_FILE="$INDEX" "${GIT[@]}" add -A .)
SEED_TREE="$(GIT_INDEX_FILE="$INDEX" git write-tree)"
SEED_SHA="$("${GIT[@]}" commit-tree "$SEED_TREE" -m "chore: seed the sandbox")"
log "seed commit $SEED_SHA"

# --- main: rebuilt from the seed only when it differs --------------------------------------
if [[ -z "$BUILD_ONLY" ]]; then
  REMOTE_MAIN="$(git ls-remote origin refs/heads/main | cut -f1)"
  if [[ "$REMOTE_MAIN" != "$SEED_SHA" ]]; then
    log "main is ${REMOTE_MAIN:-missing}, resetting to the seed"
    run git push --force origin "$SEED_SHA:refs/heads/main"
  else
    log "main already at the seed"
  fi
  OPEN_PRS="$(gh pr list --repo "$REPO" --state open --base main --limit 200 \
    --json number,headRefName,headRefOid,body)"
fi

# --- helpers --------------------------------------------------------------------------------
# human_activity PR: number of comments/reviews written by anyone but a bot
human_activity() {
  local n="$1" total=0 c
  for path in "issues/$n/comments" "pulls/$n/comments" "pulls/$n/reviews"; do
    c="$(gh api "repos/$REPO/$path" --paginate --jq '[.[] | select(.user.type != "Bot")] | length' | awk '{s+=$1} END {print s+0}')"
    total=$((total + c))
  done
  echo "$total"
}

# header KEY FILE: value of the first "key: value" line in the pr.md header block
header() { awk -v k="$1" 'NF==0{exit} index($0, k ": ")==1 {print substr($0, length(k)+3); exit}' "$2"; }
body() { awk 'seen{print} NF==0 && !seen{seen=1}' "$1"; }

ensure_label() { run gh label create "$1" --repo "$REPO" --force --color "5319e7" >/dev/null; }

# --- scenarios ------------------------------------------------------------------------------
created=0 kept=0 replaced=0
for dir in scenarios/*/; do
  name="$(basename "$dir")"
  [[ -f "$dir/apply.sh" ]] || continue
  branch="scenario/$name"
  spec="$ROOT/scenarios/$name/pr.md"
  title="$(header title "$spec")"

  wt="$TMP/wt-$name"
  git worktree add --detach -q "$wt" "$SEED_SHA"
  (cd "$wt" && bash "$ROOT/scenarios/$name/apply.sh")
  "${GIT[@]}" -C "$wt" add -A
  if "${GIT[@]}" -C "$wt" diff --cached --quiet; then
    log "$name: apply.sh changed nothing"; exit 1
  fi
  "${GIT[@]}" -C "$wt" commit -q -m "$title"
  head="$(git -C "$wt" rev-parse HEAD)"

  if [[ -n "$BUILD_ONLY" ]]; then
    log "$name: $head ($(git -C "$wt" diff --shortstat "$SEED_SHA" HEAD))"
    git worktree remove --force "$wt"
    continue
  fi

  pr="$(jq -c --arg b "$branch" '[.[] | select(.headRefName == $b)] | first // empty' <<<"$OPEN_PRS")"
  reason=""
  if [[ -z "$pr" ]]; then
    reason="no open PR"
  else
    num="$(jq -r .number <<<"$pr")"
    marker="$(jq -r .body <<<"$pr" | sed -n 's/.*<!-- sandbox head=\([0-9a-f]*\) -->.*/\1/p')"
    if [[ "$marker" != "$head" ]]; then
      reason="scenario or seed changed"
    elif [[ "$(jq -r .headRefOid <<<"$pr")" != "$head" ]]; then
      reason="branch was pushed to"
    elif [[ "$(human_activity "$num")" != "0" ]]; then
      reason="has review activity"
    fi
  fi

  if [[ -z "$reason" ]]; then
    kept=$((kept + 1))
    git worktree remove --force "$wt"
    continue
  fi

  log "$name: $reason"
  if [[ -n "$pr" ]]; then
    run gh pr close "$num" --repo "$REPO" --delete-branch \
      --comment "Used up ($reason); replaced by a fresh copy of the scenario."
    replaced=$((replaced + 1))
  else
    created=$((created + 1))
  fi
  run git push --force origin "$head:refs/heads/$branch"

  labels="scenario,$(header labels "$spec")"
  IFS=',' read -ra label_list <<<"$labels"
  label_args=()
  for l in "${label_list[@]}"; do ensure_label "$l"; label_args+=(--label "$l"); done

  body_file="$TMP/body-$name.md"
  { body "$spec"; printf '\n<!-- sandbox head=%s -->\n' "$head"; } >"$body_file"
  url="$(run gh pr create --repo "$REPO" --base main --head "$branch" --title "$title" \
    --body-file "$body_file" "${label_args[@]}")"
  num="${url##*/}"

  # seed comments: "comment: <path> :: <anchor text> :: <body>" and "note: <text>"
  while IFS= read -r line; do
    IFS='|' read -r kind rest <<<"${line/: /|}"
    case "$kind" in
      note) run gh pr comment "$num" --repo "$REPO" --body "$rest" >/dev/null ;;
      comment)
        path="${rest%% :: *}"; rest="${rest#* :: }"; anchor="${rest%% :: *}"; text="${rest#* :: }"
        lineno="$(grep -nF -- "$anchor" "$wt/$path" | head -1 | cut -d: -f1 || true)"
        if [[ -n "$lineno" ]]; then
          run gh api "repos/$REPO/pulls/$num/comments" -f body="$text" -f commit_id="$head" \
            -f path="$path" -F line="$lineno" -f side=RIGHT >/dev/null \
            || log "  warning: seed comment on $path:$lineno failed"
        else
          log "  warning: anchor not found in $path: $anchor"
        fi ;;
    esac
  done < <(awk 'NF==0{exit} /^(comment|note): /' "$spec")

  git worktree remove --force "$wt"
done

log "done: kept $kept, created $created, replaced $replaced"
