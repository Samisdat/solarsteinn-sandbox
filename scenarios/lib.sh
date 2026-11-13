# Helpers for scenario apply.sh files. Source it; the working directory is a checkout of the seed.
# Everything here must stay deterministic: no clocks, no randomness.

# replace FILE OLD NEW: replace the first literal occurrence, fail when OLD is missing.
replace() {
  python3 - "$@" <<'PY'
import sys
path, old, new = sys.argv[1:4]
s = open(path, encoding="utf-8", newline="").read()
if old not in s:
    sys.exit(f"replace: {old!r} not found in {path}")
open(path, "w", encoding="utf-8", newline="").write(s.replace(old, new, 1))
PY
}

# replace_all FILE OLD NEW: replace every literal occurrence, fail when OLD is missing.
replace_all() {
  python3 - "$@" <<'PY'
import sys
path, old, new = sys.argv[1:4]
s = open(path, encoding="utf-8", newline="").read()
if old not in s:
    sys.exit(f"replace_all: {old!r} not found in {path}")
open(path, "w", encoding="utf-8", newline="").write(s.replace(old, new))
PY
}
