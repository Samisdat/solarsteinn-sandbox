#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/html/hello.html '<title>Hello, world</title>' '<title>Hello, brave new world</title>'
replace languages/html/hello.html '<li>Two</li>' '<li>Two</li>
        <li>Three</li>'
