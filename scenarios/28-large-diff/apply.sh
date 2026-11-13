#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace_all languages/rust/big.rs Shape Figure
replace_all languages/javascript/big.js compute calc
replace edge/long-lines.js 'console.log(veryLongLine.length);' 'console.log(veryLongLine.length, "changed");'
replace edge/long-lines.js '"item-0200"' '"ITEM-0200"'
