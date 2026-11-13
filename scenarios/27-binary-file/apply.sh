#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
mkdir -p languages/markdown
printf '%s' 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGP4z8DwHwAFAAH/q842iQAAAABJRU5ErkJggg==' | base64 -d > languages/markdown/logo.png
replace languages/markdown/hello.md '![alt text](https://example.com/logo.png)' '![alt text](logo.png)'
