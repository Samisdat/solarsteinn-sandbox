#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/rust/hello.rs 'const MAX: u64 = 1_000_000;' 'const MAX: u64 = 2_000_000;'
replace languages/rust/hello.rs '"greeting too long: {n} bytes"' '"greeting too long: {n} bytes (limit 255)"'
