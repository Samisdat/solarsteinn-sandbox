#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/../lib.sh"
replace languages/dockerfile/Dockerfile 'ARG NODE_VERSION=22' 'ARG NODE_VERSION=24'
replace languages/dockerfile/Dockerfile 'EXPOSE 8080' 'EXPOSE 8080 8443'
