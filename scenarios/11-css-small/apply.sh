#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/css/hello.css '--accent: #663399;' '--accent: #0a7d5a;'
replace languages/css/hello.css 'transition: color 150ms ease-in-out;' 'transition: color 250ms ease-out;'
