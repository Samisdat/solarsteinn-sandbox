#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/shell/hello.sh 'echo "${GREETINGS[$lang]^}, ${name}!"' 'echo "${GREETINGS[$lang]^}, ${name}!!"'
replace languages/shell/hello.sh 'head -n 3' 'head -n 5'
