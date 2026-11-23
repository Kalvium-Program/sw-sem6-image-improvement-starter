# Image contract

Keep the app and its dependency versions as they are. The image must still work like this:

| Item | Value |
| --- | --- |
| Base image | `node:22-bookworm-slim` |
| Folder inside the image | `/app` |
| Container port | `3000` |
| Health check | `GET /health` returns HTTP 200 and `{"status":"ok"}` |

`/health` does not need the database. Routes that use PostgreSQL are not part of this exercise.

## What to improve

1. **Build context.** Keep these out of what Docker can see: `.git`, `node_modules`, `.env`, every `.env.*` file except `.env.example`, `logs`, `coverage` and `dist`.
2. **Layer order.** Copy `package.json` and `package-lock.json`, run `npm ci --omit=dev`, then copy only `src`. Do not use `COPY . .`.
3. **Runtime user.** Use the `node` user that the base image already has. Put `USER node` after the install and copy steps, and before `CMD`. The app only reads its files, so you do not need to change file ownership.
4. **Lint.** Fix the Dockerfile so the supplied lint check passes. Do not change the lint script or `.hadolint.yaml`.

## About Context.Dockerfile

`Context.Dockerfile` is only used by `scripts/audit-context.sh` to list the files Docker can see. It is not the app image. Do not edit it.
