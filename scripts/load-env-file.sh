#!/bin/bash

# This script loads the environment variables from the .env file
# into the current shell sessions. This should be run before starting
# your terraria server. Make sure to fill out the .env file with the
# desired values.

# Usage: source ./scripts/load-env-file.sh

# Check if .env file exists
if [ ! -f $ENV_FILE ]; then
  echo "Error: .env file not found."
  exit 1
fi

# Set -o allexport to export all variables defined in .env
set -o allexport

# Source the .env file to load variables into the environment
source $ENV_FILE

# Unset -o allexport to avoid unintended exporting of future variables
set +o allexport

echo "Environment variables loaded from .env"
