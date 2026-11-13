#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/sql/hello.sql 'CHECK (times >= 0),' 'CHECK (times >= 0 AND times < 1000),'
replace languages/sql/hello.sql 'LIMIT 10 OFFSET 0;' 'LIMIT 20 OFFSET 0;'
