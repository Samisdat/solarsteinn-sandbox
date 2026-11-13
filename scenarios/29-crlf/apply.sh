#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
python3 - <<'PY'
p = 'languages/css/hello.css'
s = open(p, newline='').read().replace('#663399', '#0a7d5a')
open(p, 'w', newline='').write(s.replace('\r\n', '\n').replace('\n', '\r\n'))
PY
