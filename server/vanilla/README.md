# Terraria Server Vanilla

[![GitHub Container Registry](https://img.shields.io/badge/GitHub%20Container%20Registry-available-green)](https://github.com/meshi-team/terraria-server/pkgs/container/terraria-server-vanilla)
![Platform Support](https://img.shields.io/badge/platform-linux%2Famd64%20%7C%20linux%2Farm64%20%7C%20linux%2Farm%2Fv7-blue)

This container image provides a ready-to-use Terraria dedicated server with persistent world storage and customizable configuration.

## Features

- Multi-architecture support: runs on `linux/amd64`, `linux/arm64`, and `linux/arm/v7`
- Configurable server properties through environment variables
- Persistent world storage via Docker volumes
- Based on the official Terraria server binaries
- Minimal dependencies for optimal performance

## Quick Start

```bash
docker run -d \
  --name terraria-server \
  -p 7777:7777 \
  -e WORLD_NAME=myworld \
  -e WORLD_SIZE=2 \
  -e DIFFICULTY=0 \
  -e MAX_PLAYERS=8 \
  -v terraria-worlds:/terraria-server/worlds \
  ghcr.io/meshi-team/terraria-server-vanilla
```

## Docker Compose Setup

Create a `docker-compose.yml` file with the following contents:

```yaml
version: "3"

services:
  vanilla-server:
    image: ghcr.io/meshi-team/terraria-server-vanilla
    container_name: vanilla-server
    ports:
      - 7777:7777 # Default Terraria server port
    environment:
      - WORLD_NAME=world
      - WORLD_SIZE=2 # 1=small, 2=medium, 3=large
      - WORLD_SEED=
      - PASSWORD=
      - DIFFICULTY=0 # 0=normal, 1=expert, 2=master, 3=journey
      - MAX_PLAYERS=8
    volumes:
      - vanilla-worlds:/terraria-server/worlds
    restart: unless-stopped
    tty: true
    stdin_open: true

volumes:
  vanilla-worlds:
    driver: local
```

Then run:

```bash
docker compose up -d
```

## Environment Variables

| Variable        | Default Value            | Description                   |
| --------------- | ------------------------ | ----------------------------- |
| SERVER_FOLDER   | /terraria-server         | Main server directory         |
| SERVER_BIN      | TerrariaServer           | Server binary name            |
| CONFIG_FOLDER   | /terraria-server/config  | Configuration directory       |
| CONFIG_FILE     | server-config.txt        | Server configuration filename |
| CONFIG_TEMPLATE | config-template.cfg      | Template configuration file   |
| SCRIPTS_FOLDER  | /terraria-server/scripts | Scripts directory             |
| LOGS_FOLDER     | /terraria-server/logs    | Logs directory                |
| LOGS_FILE       | terraria-server.log      | Log filename                  |

### World Settings

| Variable                | Default Value | Description                                |
| ----------------------- | ------------- | ------------------------------------------ |
| WORLD_NAME              | world         | World name                                 |
| WORLD_SIZE              | 1             | World size (1: small, 2: medium, 3: large) |
| WORLD_ROLLBACKS_TO_KEEP | 2             | Number of world backups to maintain        |
| WORLD_SEED              | ""            | World generation seed                      |

### Game Settings

| Variable     | Default Value                | Description                                                    |
| ------------ | ---------------------------- | -------------------------------------------------------------- |
| DIFFICULTY   | 0                            | Game difficulty (0: classic, 1: expert, 2: master, 3: journey) |
| MAX_PLAYERS  | 8                            | Maximum number of players allowed                              |
| PORT         | 7777                         | Server port                                                    |
| PASSWORD     | password                     | Server password                                                |
| MOTD         | "Welcome to my server!"      | Message of the day                                             |
| BANLIST_FILE | /terraria-server/banlist.txt | Path to banlist file                                           |
| SECURE       | 1                            | Enable secure mode (1: on, 0: off)                             |
| LANGUAGE     | en-US                        | Server language                                                |
| UPNP         | 1                            | Enable UPnP (1: on, 0: off)                                    |
| NPC_STREAM   | 60                           | NPC stream range                                               |
| PRIORITY     | 1                            | Process priority                                               |
| SLOW_LIQUIDS | 1                            | Enable slow liquids (1: on, 0: off)                            |
| ENABLE_STEAM | 0                            | Enable Steam integration (1: on, 0: off)                       |

## Volume Management

The server uses a persistent volume at `/terraria-server/worlds` to store all world data. This ensures your world files persist even if the container is removed or recreated.

To backup your worlds, you can copy files from the Docker volume:

```bash
# List volume contents
docker run --rm -v vanilla-worlds:/data -w /data busybox ls -la

# Copy worlds to host system
docker run --rm -v vanilla-worlds:/data -v $(pwd)/backups:/backup busybox cp -r /data/* /backup
```

## Server Management

### Accessing the Console

To access the running server console:

```bash
docker attach vanilla-server
```

Press `Ctrl+P` followed by `Ctrl+Q` to detach without stopping the server.

### Server Commands

While attached to the console, you can use these commands:

- `help` - Shows available commands
- `exit` - Saves and exits
- `save` - Saves the world
- `kick <player>` - Kicks a player
- `ban <player>` - Bans a player
- `playing` - Shows connected players
- `version` - Shows server version

### Stopping the Server

To properly stop the server, either:

1. Attach to the console and enter the `exit` command
2. Use `docker stop vanilla-server` (the container will attempt a graceful shutdown)

## Troubleshooting

### Container Exits Immediately

Check the logs for errors:

```bash
docker logs vanilla-server
```

### World Not Loading

Ensure the `WORLD_NAME` matches an existing world in your volume, or set `AUTOCREATE` to generate a new world.

### Connection Issues

Make sure port 7777 is properly exposed and not blocked by firewalls.

## License

This container image is available under the MIT License. Terraria itself is owned by Re-Logic.
