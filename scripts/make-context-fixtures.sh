#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
for p in .env .env.local logs/lu27.log coverage/lu27.txt dist/lu27.txt node_modules/lu27-dummy.txt; do
  if [ -e "$p" ]; then echo "Refusing to overwrite $p" >&2; exit 1; fi
done
mkdir -p logs coverage dist node_modules
printf 'LU27_DUMMY_KEY=not-a-real-secret\n' > .env
printf 'LU27_DUMMY_LOCAL=not-a-real-secret\n' > .env.local
for p in logs/lu27.log coverage/lu27.txt dist/lu27.txt node_modules/lu27-dummy.txt; do printf 'Dummy context fixture only\n' > "$p"; done
printf 'Created dummy-only local fixtures. Do not commit them.\n'
