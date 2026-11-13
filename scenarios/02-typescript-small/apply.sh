#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/typescript/hello.ts 'text: "hello" }' 'text: "hello there" }'
replace languages/typescript/hello.ts 'Loud.#count++;' 'Loud.#count += 1;'
