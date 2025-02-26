#!/bin/bash

# This script loads environment variables from a .env file,
# providing default values if they are not already set.
# It should be called at container startup to ensure the server
# is properly configured.

# Usage: source ./scripts/load-env-file.sh

# --- Init settings ---
export SERVER_FOLDER="${SERVER_FOLDER:-/terraria-server}"
export SERVER_BIN="${SERVER_BIN:-TerrariaServer}"
export CONFIG_FOLDER="${CONFIG_FOLDER:-/terraria-server/config}"
export CONFIG_FILE="${CONFIG_FILE:-server-config.txt}"
export CONFIG_TEMPLATE="${CONFIG_TEMPLATE:-config-template.cfg}"
export SCRIPTS_FOLDER="${SCRIPTS_FOLDER:-/terraria-server/scripts}"
export LOGS_FOLDER="${LOGS_FOLDER:-/terraria-server/logs}"
export LOGS_FILE="${LOGS_FILE:-terraria-server.log}"

# --- World settings ---
export WORLD_NAME="${WORLD_NAME:-world}"
export WORLD_SIZE="${WORLD_SIZE:-1}"
export WORLD_ROLLBACKS_TO_KEEP="${WORLD_ROLLBACKS_TO_KEEP:-2}"
export WORLDS_FOLDER="${WORLDS_FOLDER:-/terraria-server/worlds}"
export WORLD_SEED="${WORLD_SEED:-""}"

# --- Game settings ---
export DIFFICULTY="${DIFFICULTY:-0}" # 0: (classic) # 1: (expert) # 2: (master) # 3: (journey)
export MAX_PLAYERS="${MAX_PLAYERS:-8}"
export PORT="${PORT:-7777}"
export PASSWORD="${PASSWORD:-password}"
export MOTD="${MOTD:-"Welcome to my server!"}"
export BANLIST_FILE="${BANLIST_FILE:-/terraria-server/banlist.txt}"
export SECURE="${SECURE:-1}"
export LANGUAGE="${LANGUAGE:-en-US}"
export UPNP="${UPNP:-1}"
export NPC_STREAM="${NPC_STREAM:-60}"
export PRIORITY="${PRIORITY:-1}"
export SLOW_LIQUIDS="${SLOW_LIQUIDS:-1}"
export ENABLE_STEAM="${ENABLE_STEAM:-0}"

# --- Journey mode power permissions ---
# 0: Locked for everyone
# 1: Can only be changed by host
# 2: Can be changed by everyone
export JOURNEY_PERMISSION_TIME_SET_FROZEN="${JOURNEY_PERMISSION_TIME_SET_FROZEN:-1}"
export JOURNEY_PERMISSION_TIME_SET_DAWN="${JOURNEY_PERMISSION_TIME_SET_DAWN:-1}"
export JOURNEY_PERMISSION_TIME_SET_NOON="${JOURNEY_PERMISSION_TIME_SET_NOON:-1}"
export JOURNEY_PERMISSION_TIME_SET_DUSK="${JOURNEY_PERMISSION_TIME_SET_DUSK:-1}"
export JOURNEY_PERMISSION_TIME_SET_MIDNIGHT="${JOURNEY_PERMISSION_TIME_SET_MIDNIGHT:-1}"
export JOURNEY_PERMISSION_GODMODE="${JOURNEY_PERMISSION_GODMODE:-1}"
export JOURNEY_PERMISSION_WIND_SET_STRENGTH="${JOURNEY_PERMISSION_WIND_SET_STRENGTH:-1}"
export JOURNEY_PERMISSION_RAIN_SET_STRENGTH="${JOURNEY_PERMISSION_RAIN_SET_STRENGTH:-1}"
export JOURNEY_PERMISSION_TIME_SET_SPEED="${JOURNEY_PERMISSION_TIME_SET_SPEED:-1}"
export JOURNEY_PERMISSION_RAIN_SET_FROZEN="${JOURNEY_PERMISSION_RAIN_SET_FROZEN:-1}"
export JOURNEY_PERMISSION_WIND_SET_FROZEN="${JOURNEY_PERMISSION_WIND_SET_FROZEN:-1}"
export JOURNEY_PERMISSION_INCREASE_PLACEMENT_RANGE="${JOURNEY_PERMISSION_INCREASE_PLACEMENT_RANGE:-1}"
export JOURNEY_PERMISSION_SET_DIFFICULTY="${JOURNEY_PERMISSION_SET_DIFFICULTY:-1}"
export JOURNEY_PERMISSION_BIOMESPREAD_SET_FROZEN="${JOURNEY_PERMISSION_BIOMESPREAD_SET_FROZEN:-1}"
export JOURNEY_PERMISSION_SET_SPAWN_RATE="${JOURNEY_PERMISSION_SET_SPAWN_RATE:-1}"

echo "Environment variables loaded with default values if not already set."
