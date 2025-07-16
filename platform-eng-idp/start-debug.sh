#!/bin/bash
set -a
source .env
set +a

echo "Environment variables loaded:"
echo "AUTH_GITHUB_CLIENT_ID: ${AUTH_GITHUB_CLIENT_ID}"
echo "AUTH_GITHUB_CLIENT_SECRET: ${AUTH_GITHUB_CLIENT_SECRET:0:10}..."
echo "GITHUB_TOKEN: ${GITHUB_TOKEN:0:10}..."

export AUTH_GITHUB_CLIENT_ID
export AUTH_GITHUB_CLIENT_SECRET  
export GITHUB_TOKEN

yarn start