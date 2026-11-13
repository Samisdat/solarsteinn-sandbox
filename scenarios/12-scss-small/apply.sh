#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/scss/hello.scss '$gap: 1rem;' '$gap: 1.5rem;'
replace languages/scss/hello.scss '&--loud { text-transform: uppercase; }' '&--loud { text-transform: uppercase; letter-spacing: 0.05em; }'
