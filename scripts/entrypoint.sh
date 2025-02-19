#!/bin/bash

# This script initializes the Terraria server by loading environment variables
# and generating the server configuration file.

# 1. Load environment variables from the .env file
# 2. Generate the server configuration file based on the environment variables
# 3. Start the Terraria server with the generated configuration

# Usage: ./scripts/entrypoint.sh

ENV_SCRIPT="/terraria-server/scripts/load-env-file.sh"
CONFIG_SCRIPT="/terraria-server/scripts/generate-server-config.sh"

# Source the environment loading script
if [ -f "$ENV_SCRIPT" ]; then
  source "$ENV_SCRIPT"
else
  echo "Error: $ENV_SCRIPT not found."
  exit 1
fi

# Execute the server config generation script
if [ -f "$CONFIG_SCRIPT" ]; then
  "$CONFIG_SCRIPT"
else
  echo "Error: $CONFIG_SCRIPT not found."
  exit 1
fi

# Create necessary directories
mkdir -p $WORLDS_FOLDER
mkdir -p $LOGS_FOLDER

touch $LOGS_FILE
touch $BANLIST_FILE

# Start the Terraria server
$SERVER_FOLDER/$SERVER_BIN \
  -config $CONFIG_FOLDER/$CONFIG_FILE \
  -logpath $LOGS_FOLDER/$LOGS_FOLDER
