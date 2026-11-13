# solarsteinn-sandbox

A throwaway test bed for [solarsteinn](https://github.com/Samisdat/solarsteinn): a repo full of
"hello world" code in the languages solarsteinn highlights, plus a pool of **30 open pull requests**
to review. Nothing here is real.

```sh
git clone https://github.com/Samisdat/solarsteinn-sandbox && cd solarsteinn-sandbox
solarsteinn review --log ~/.solarsteinn/sandbox.jsonl   # pick one of the open PRs
```

`solarsteinn review` works on the repository you are in, through `gh`. Use a separate, disposable log:
PR numbers change when the pool is refilled.

## How it works

| Branch | Role |
|---|---|
| `control` (default) | Tooling: `scripts/reconcile.sh`, `.github/workflows/reconcile.yml`, `seed/`, `scenarios/`. Never reset. |
| `main` | The review target. One parentless commit built from `seed/` with a fixed author and date, so its hash is stable. |
| `scenario/NN-name` | One branch per scenario, one open PR each, based on `main`. |

`scripts/reconcile.sh` runs nightly (03:00 UTC), on `workflow_dispatch` and when `seed/`, `scenarios/` or
`scripts/` change on `control`. It tops the pool up to 30:

- A PR is **used up** when it is merged or closed, someone commented or reviewed, or the branch was pushed to.
  Used-up PRs are closed, their branch deleted, and a fresh PR is created for the same scenario.
- A PR is **stale** when its scenario or the seed changed on `control`. It is replaced the same way.
- Untouched PRs stay. On a day nobody reviewed anything, nothing happens.
- `main` is force-pushed back to the seed commit when it differs (for example after a merge).

Comments by bots (the seed comments) do not count as activity.

## Scenarios

`scenarios/NN-name/` holds `apply.sh` (runs in a checkout of the seed, may source `../lib.sh`) and
`pr.md`: a header of `key: value` lines (`title`, `labels`, `comment: <path> :: <anchor> :: <text>`,
`note: <text>`), a blank line, then the PR description. Scripts must be deterministic: no clocks, no randomness.

## Local use

```sh
BUILD_ONLY=1 scripts/reconcile.sh   # build seed and all scenario commits, touch nothing
DRY_RUN=1 scripts/reconcile.sh      # also compare with GitHub, print the plan
scripts/reconcile.sh                # for real (needs gh auth with push rights)
```

Requires `git`, `gh`, `jq`, `python3`.
