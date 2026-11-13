#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
python3 - <<'PY'
p = 'languages/yaml/hello.yaml'
s = open(p, encoding='utf-8', newline='').read().rstrip('\n')
s = s.replace('greetings:\n', 'greetings:\n  ja: こんにちは世界\n  ar: مرحبا بالعالم\n  hi: नमस्ते दुनिया\n  emoji: "👋🌍 e\u0301"\n', 1)
open(p, 'w', encoding='utf-8', newline='').write(s)
PY
