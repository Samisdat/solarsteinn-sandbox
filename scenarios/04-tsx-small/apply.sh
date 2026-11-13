#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/tsx/Hello.tsx '"rebeccapurple"' '"darkorange"'
replace languages/tsx/Hello.tsx 'Switch language &rarr;' 'Next language &rarr;'
