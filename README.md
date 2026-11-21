# Improve and Lint Your Dockerfile

Self-learning practice for Semester 6 LU 2.7. Start with a working but inefficient root-run image and a prepared lint warning. Improve it without changing application behaviour. This is a supplied revision of the LU 2.6 server, not a request to undo your previous working solution.

## Requirements

Docker Engine/Desktop running; Bash, Git and curl. No host Node/npm, database or paid service needed. Windows: use a Docker-integrated Bash environment; native PowerShell command syntax is not supplied. The base and pinned lint image support ARM64 and AMD64. Downloads and npm registry access are required before offline reuse is possible.

## Begin

Read docs/image-contract.md, Dockerfile, .dockerignore and .hadolint.yaml. Use the lesson for the three tasks and evidence labels. Create only dummy fixtures with `bash scripts/make-context-fixtures.sh`. This script refuses to overwrite existing named files.

## Lint

Run `bash scripts/lint-dockerfile.sh`, then immediately `echo "lint_exit=$?"`. The digest-pinned Hadolint v2.12.0 multi-platform image is supplied. The policy fails warnings and errors; DL3016 is explicitly excluded because dependency versions are governed by npm ci and the lockfile. Do not change this policy to hide the prepared warning.

## Build and verify

```bash
docker build --progress=plain -t campus-events:lu27 .
docker run -d --name lu27-student -p 127.0.0.1:8084:3000 campus-events:lu27
docker exec lu27-student id
docker exec lu27-student sh -c 'grep -E "^(Name|Uid):" /proc/1/status'
curl --noproxy '*' -i http://127.0.0.1:8084/health
```

Health proves liveness only. Save evidence, then stop/remove only lu27-student. Never prune shared caches for this exercise. Use another available host port if needed and update the request URL.

## What changes

Task 1: ignore rules, dependency-before-source order and one harmless source comment. Task 2: supplied non-root pattern and runtime verification. Task 3: diagnose and fix DL3025 without editing lint policy. No application logic or dependency updates required. Detailed commands and screenshot requirements are in the lesson.
