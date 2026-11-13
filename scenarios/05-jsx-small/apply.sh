#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/jsx/Hello.jsx 'No items yet.' 'Nothing here yet.'
replace languages/jsx/Hello.jsx 'setNow(new Date()), 1000)' 'setNow(new Date()), 500)'
