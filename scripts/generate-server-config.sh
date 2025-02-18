#!/bin/bash

# This script generates the server configuration file based on the
# environment variables defined in the .env file.
#
# Usage: ./scripts/generate-server-config.sh

set -euo pipefail

TEMPLATE_FILE="$CONFIG_FOLDER/$CONFIG_TEMPLATE"

if [ ! -r "$TEMPLATE_FILE" ]; then
  echo "Error: Template file '$TEMPLATE_FILE' not found or not readable." >&2
  exit 1
fi

# Set the default world seed if not provided
if [ -z "${WORLD_SEED}" ]; then
  WORLD_SEED=$((RANDOM * 10000000 + RANDOM))
  export WORLD_SEED
  echo "WORLD_SEED is not set, generating a random seed: $WORLD_SEED"
fi

if ! envsubst < "$TEMPLATE_FILE" > "$CONFIG_FOLDER/$CONFIG_FILE"; then
  echo "Error: Failed to generate server configuration file." >&2
  exit 1
fi

echo "Server configuration file generated: $CONFIG_FOLDER/$CONFIG_FILE"
