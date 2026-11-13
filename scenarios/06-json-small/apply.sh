#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/json/hello.json '"version": "1.0.0"' '"version": "1.1.0"'
replace languages/json/hello.json '"fr": "Bonjour, le monde !",' '"fr": "Bonjour, le monde !",
    "es": "¡Hola, mundo!",'
