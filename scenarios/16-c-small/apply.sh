#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/c/hello.c '#define MAX_NAME 64' '#define MAX_NAME 128'
replace languages/c/hello.c 'puts("hello");' 'puts("hello, quietly");'
