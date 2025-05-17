#!/bin/bash

# This script starts the Terraria server after validating the environment
# variables for enabling/disabling multiple configuration options.
#
# usage: ./scripts/start-server.sh

# Starts the Terraria server
SERVER_EXEC="${SERVER_FOLDER:?}/${SERVER_BIN:?}"
CONFIG_FLAG="-config ${CONFIG_FOLDER:?}/${CONFIG_FILE:?}"
LOG_PATH_FLAG="-logpath ${LOGS_FOLDER:?}/${LOGS_FOLDER:?}"

COMMAND="${SERVER_EXEC} ${CONFIG_FLAG} ${LOG_PATH_FLAG}"
if [[ "${ENABLE_STEAM:?}" -eq 0 ]]; then
  COMMAND="${COMMAND} -steam"
fi

exec ${COMMAND}
