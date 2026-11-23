#!/usr/bin/env bash
# Creates fake local files so you can test your .dockerignore rules.
# None of these contain real secrets. Do not commit them.
set -eu
cd "$(dirname "$0")/.."
for p in .env .env.local logs/app.log coverage/report.txt dist/bundle.txt node_modules/local-only.txt; do
  if [ -e "$p" ]; then echo "Refusing to overwrite $p" >&2; exit 1; fi
done
mkdir -p logs coverage dist node_modules
printf 'DUMMY_API_KEY=not-a-real-secret\n' > .env
printf 'DUMMY_LOCAL_KEY=not-a-real-secret\n' > .env.local
for p in logs/app.log coverage/report.txt dist/bundle.txt node_modules/local-only.txt; do printf 'Fake local file for the context test\n' > "$p"; done
printf 'Created fake local files: .env, .env.local, logs/, coverage/, dist/, node_modules/. Do not commit them.\n'
