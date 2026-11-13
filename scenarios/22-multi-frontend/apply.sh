#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/typescript/hello.ts 'text: "hello" }' 'text: "hello there" }'
replace languages/typescript/hello.ts 'Loud.#count++;' 'Loud.#count += 1;'
replace languages/tsx/Hello.tsx '"rebeccapurple"' '"darkorange"'
replace languages/tsx/Hello.tsx 'Switch language &rarr;' 'Next language &rarr;'
replace languages/css/hello.css '--accent: #663399;' '--accent: #0a7d5a;'
replace languages/css/hello.css 'transition: color 150ms ease-in-out;' 'transition: color 250ms ease-out;'
replace languages/html/hello.html '<title>Hello, world</title>' '<title>Hello, brave new world</title>'
replace languages/html/hello.html '<li>Two</li>' '<li>Two</li>
        <li>Three</li>'
