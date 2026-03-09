#!/bin/bash
set -e
source .env
export DATACONTRACT_DATABRICKS_TOKEN DATACONTRACT_DATABRICKS_SERVER_HOSTNAME DATACONTRACT_DATABRICKS_HTTP_PATH

for f in solutions/*.odcs.yaml; do
  echo "=== Testing $f ==="
  datacontract test "$f"
  echo ""
done
