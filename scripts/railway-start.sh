#!/usr/bin/env bash

set -euo pipefail

service_name="${RAILWAY_SERVICE_NAME:-}"

ensure_web_build() {
  if [[ ! -f "apps/web/.next/BUILD_ID" ]]; then
    echo "Web production build not found. Running npm run build:web before startup..."
    npm run build:web
  fi
}

ensure_api_build() {
  if [[ ! -f "apps/api/dist/index.js" ]]; then
    echo "API build output not found. Running npm run build:api before startup..."
    npm run build:api
  fi
}

ensure_bridge_build() {
  if [[ ! -f "services/agent-bridge/dist/index.js" ]]; then
    echo "Agent bridge build output not found. Running npm run build:bridge before startup..."
    npm run build:bridge
  fi
}

ensure_jobs_build() {
  if [[ ! -f "services/jobs/dist/index.js" ]]; then
    echo "Jobs build output not found. Running npm run build:jobs before startup..."
    npm run build:jobs
  fi
}

if [[ -z "${service_name}" ]]; then
  echo "RAILWAY_SERVICE_NAME is not set. Cannot determine which workspace to start."
  exit 1
fi

case "${service_name}" in
  web)
    ensure_web_build
    npm run start:web
    ;;
  api)
    ensure_api_build
    npm run start:api
    ;;
  agent-bridge)
    ensure_bridge_build
    npm run start:bridge
    ;;
  jobs)
    ensure_jobs_build
    npm run start:jobs
    ;;
  *)
    echo "Unsupported Railway service name: ${service_name}"
    exit 1
    ;;
esac
