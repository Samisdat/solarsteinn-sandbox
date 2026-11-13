#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/java/Hello.java 'MAX = 1_000;' 'MAX = 10_000;'
replace languages/java/Hello.java '"hello, " + n + "!"' '"hello, " + n + "!!"'
