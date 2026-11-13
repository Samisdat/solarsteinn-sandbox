#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/toml/hello.toml 'title = "Hello, world"' 'title = "Hello, brave new world"'
replace languages/toml/hello.toml 'role = "backend"' 'role = "backend-v2"'
