#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
git rm -q languages/scss/hello.scss
