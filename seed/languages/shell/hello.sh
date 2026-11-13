#!/usr/bin/env bash
# Hello world, shell edition: a tour of the syntax.
set -euo pipefail

readonly NAME="${1:-world}"
declare -a LANGS=(en de fr)
declare -A GREETINGS=([en]="hello" [de]="hallo" [fr]="bonjour")

usage() {
  cat <<USAGE
usage: ${0##*/} [name]
  prints a greeting for NAME (default: world)
USAGE
}

log() {
  printf '[%s] %s\n' "$(date +%H:%M:%S)" "$*" >&2
}

greet() {
  local lang="$1" name="$2"
  echo "${GREETINGS[$lang]^}, ${name}!"
}

if [[ "${NAME}" == "-h" || "${NAME}" == "--help" ]]; then
  usage
  exit 0
fi

for lang in "${LANGS[@]}"; do
  case "${lang}" in
    en | de) greet "${lang}" "${NAME}" ;;
    *) log "skipping ${lang}" ;;
  esac
done

count=0
while IFS= read -r line; do
  ((count++)) || true
  echo "line ${count}: ${line}"
done < <(grep -v '^#' "$0" | head -n 3)

result=$(echo 'single quoted $NOT_EXPANDED' | tr '[:lower:]' '[:upper:]')
echo "${result}" | sed -e 's/HELLO/hi/g' > /dev/null
trap 'log "bye"' EXIT
