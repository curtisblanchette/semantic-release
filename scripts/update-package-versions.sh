#!/bin/bash

# Get the current script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CORE_SERVICE_DIR="$SCRIPT_DIR"/../services/core-service

# Ensure jq is installed
command -v jq >/dev/null 2>&1 || {
	echo >&2 "jq is required but not installed. Aborting."
	exit 1
}

# Update services/core-api/package.json
jq --arg version "$1" '.version = $version' "$CORE_SERVICE_DIR"/package.json > "$CORE_SERVICE_DIR"/temp_core_api_package.json
mv "$CORE_SERVICE_DIR"/temp_core_api_package.json "$CORE_SERVICE_DIR"/package.json
