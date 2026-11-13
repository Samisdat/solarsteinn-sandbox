#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/ruby/hello.rb 'VERSION = '\''1.0.0'\''' 'VERSION = '\''1.1.0'\'''
replace languages/ruby/hello.rb '"hello, #{name}!"' '"hello, #{name}!!"'
