#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/cpp/hello.cpp 'constexpr int kMax = 1'\''000;' 'constexpr int kMax = 10'\''000;'
replace languages/cpp/hello.cpp 'make_unique<hello::Loud>("hello, ")' 'make_unique<hello::Loud>("hello there, ")'
