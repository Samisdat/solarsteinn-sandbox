#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/python/hello.py 'LIMIT = 1_000' 'LIMIT = 5_000'
replace languages/python/hello.py 'return f"{self.text.upper()}! ({self.lang!r})"' 'return f"{self.text.upper()}!! ({self.lang!r})"'
