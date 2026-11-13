#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
git mv languages/python/hello.py languages/python/greeter.py
replace languages/python/greeter.py 'LIMIT = 1_000' 'LIMIT = 5_000'
replace languages/python/greeter.py 'return f"{self.text.upper()}! ({self.lang!r})"' 'return f"{self.text.upper()}!! ({self.lang!r})"'
