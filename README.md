# Improve and Lint Your Dockerfile

This is a working Campus Events image with three weak spots. It builds, it runs, and `/health` returns 200. Your job is to improve how it is built and run without changing what the app does.

## What you need

- Docker Desktop (or Docker Engine) running
- Git, Bash and curl
- On Windows, use Git Bash or WSL

You do not need Node.js, npm or a database on your laptop.

## Start here

1. Read `docs/image-contract.md`. It lists what you must improve.
2. Read `Dockerfile`, `.dockerignore` and `.hadolint.yaml`.
3. Follow the lesson for the three tasks and the screenshots.

## Supplied scripts

| Script | What it does |
| --- | --- |
| `scripts/lint-dockerfile.sh` | Checks the Dockerfile with Hadolint v2.12.0. Run `echo "lint_exit=$?"` straight after it. |
| `scripts/make-context-fixtures.sh` | Creates fake local files (`.env`, `logs/` and others) to test your ignore rules |
| `scripts/audit-context.sh` | Shows which files Docker can see when it builds, and checks them |

Do not edit these scripts, `.hadolint.yaml` or `Context.Dockerfile`. Do not change the app code, `package.json` or `package-lock.json`.
