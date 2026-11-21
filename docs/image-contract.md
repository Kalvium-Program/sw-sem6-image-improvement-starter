# Image improvement contract

Keep the existing Node 22 full server and dependency versions. Work in /app. Test only /health on container port 3000; expected HTTP 200 with {"status":"ok"}. PostgreSQL-backed routes are outside this exercise.

1. Exclude Git metadata, host node_modules, .env and .env.* (retain .env.example), logs, coverage and dist from the context.
2. Copy package.json and package-lock.json, run npm ci --omit=dev, then copy only src. Do not use broad COPY . . in the application recipe.
3. Use the base image's existing node user. Place USER node after build-time install/copy steps and before JSON-form CMD. This server does not write to /app, so no ownership rewrite is required.
4. Keep the supplied lint script and policy unchanged. Repair the prepared Dockerfile finding, not the lint threshold or ignore list.
5. A source-only comment must invalidate the source COPY while reusing the npm ci layer on the immediate rebuild. No --no-cache or cache deletion.

Diagnostic Context.Dockerfile copies the full *filtered* context into a scratch image for a file-list audit. It is not the application image and is not linted by the supplied application check. Its default image user is irrelevant to the runtime-user task.
