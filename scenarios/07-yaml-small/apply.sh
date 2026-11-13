#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/yaml/hello.yaml 'image: nginx:1.27' 'image: nginx:1.28'
replace languages/yaml/hello.yaml 'retries: 3' 'retries: 5'
