#!/usr/bin/env bash
set -euo pipefail

# ---- determine repo root ----
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# ---- config ----
EE_NAME="ansible-ee-base"
EE_DIR="${REPO_ROOT}/execution-environments/base"
IMAGE_TAG="latest"
CONTAINER_RUNTIME="docker"

# ---- build ----
echo "Building Execution Environment: ${EE_NAME}:${IMAGE_TAG}"
cd "${EE_DIR}"

ansible-builder build \
  --container-runtime "${CONTAINER_RUNTIME}" \
  -t "${EE_NAME}:${IMAGE_TAG}"
