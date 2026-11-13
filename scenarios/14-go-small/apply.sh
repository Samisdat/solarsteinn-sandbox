#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/go/hello.go 'Max     = 1 << 10' 'Max     = 1 << 12'
replace languages/go/hello.go '"greet: %w"' '"greet failed: %w"'
