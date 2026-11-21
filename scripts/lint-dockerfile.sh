#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
TOOL='hadolint/hadolint:v2.12.0-alpine@sha256:3c206a451cec6d486367e758645269fd7d696c5ccb6ff59d8b03b0e45268a199'
docker run --rm -i -v "$PWD/.hadolint.yaml:/config/hadolint.yaml:ro" "$TOOL" hadolint --config /config/hadolint.yaml - < Dockerfile
