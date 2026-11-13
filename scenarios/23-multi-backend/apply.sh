#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/go/hello.go 'Max     = 1 << 10' 'Max     = 1 << 12'
replace languages/go/hello.go '"greet: %w"' '"greet failed: %w"'
replace languages/python/hello.py 'LIMIT = 1_000' 'LIMIT = 5_000'
replace languages/python/hello.py 'return f"{self.text.upper()}! ({self.lang!r})"' 'return f"{self.text.upper()}!! ({self.lang!r})"'
replace languages/sql/hello.sql 'CHECK (times >= 0),' 'CHECK (times >= 0 AND times < 1000),'
replace languages/sql/hello.sql 'LIMIT 10 OFFSET 0;' 'LIMIT 20 OFFSET 0;'
