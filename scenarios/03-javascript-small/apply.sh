#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/javascript/hello.js 'return `hello, ${name}!`;' 'return `hello, ${name}!!`;'
replace languages/javascript/hello.js '    this.#count++;' '    this.#count += 1;'
