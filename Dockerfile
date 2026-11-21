FROM node:22-bookworm-slim
WORKDIR /app
COPY . .
RUN npm ci --omit=dev
CMD node src/server.js
