#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
OUT=$(mktemp -d "${TMPDIR:-/tmp}/lu27-context.XXXXXX")
docker build --file Context.Dockerfile --output "type=local,dest=$OUT" .
for p in .git node_modules .env .env.local logs coverage dist; do
  if [ -e "$OUT/context/$p" ]; then
    printf 'FAIL: context includes %s\nAudit saved at %s\n' "$p" "$OUT"
    exit 1
  fi
  printf 'PASS: excluded %s\n' "$p"
done
for p in package.json package-lock.json src/server.js .env.example; do
  test -f "$OUT/context/$p" || { printf 'FAIL: required context file missing: %s\n' "$p"; exit 1; }
  printf 'PASS: retained %s\n' "$p"
done
printf 'Context audit passed. Files saved outside repository at %s\n' "$OUT"
