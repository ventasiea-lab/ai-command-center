#!/usr/bin/env bash

set -euo pipefail

service_name="${RAILWAY_SERVICE_NAME:-}"

if [[ -z "${service_name}" ]]; then
  echo "RAILWAY_SERVICE_NAME is not set. Cannot determine which workspace to start."
  exit 1
fi

case "${service_name}" in
  web)
    npm run start:web
    ;;
  api)
    npm run start:api
    ;;
  agent-bridge)
    npm run start:bridge
    ;;
  jobs)
    npm run start:jobs
    ;;
  *)
    echo "Unsupported Railway service name: ${service_name}"
    exit 1
    ;;
esac
