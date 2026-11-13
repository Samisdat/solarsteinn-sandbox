#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/markdown/hello.md '- three

1.' '- three
- four

1.'
replace languages/markdown/hello.md '| German   | Hallo    |' '| German   | Hallo    |
| Spanish  | Hola     |'
