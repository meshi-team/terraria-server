# Terraria Server 🍕

A Docker-based Terraria server setup that lets you quickly deploy and manage a Terraria multiplayer server. This repository provides a fully containerized Terraria server that's easy to configure and run on any system that supports Docker. It uses the official Terraria server application, wrapped in a Docker container for consistency and portability.

The server:

- Runs Terraria version 1.4.4.9
- Supports customizable world generation
- Allows adjustable difficulty settings
- Includes password protection options
- Preserves world data between container restarts

## Index

- [Index](#index)
- [Requirements](#requirements)
- [How to Run](#how-to-run)
  - [Quick Start](#quick-start)
  - [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
  - [Init Settings](#init-settings)
  - [World Settings](#world-settings)
  - [Game Settings](#game-settings)
  - [Journey Mode Power Permissions](#journey-mode-power-permissions)
  - [Connecting to Your Server](#connecting-to-your-server)
  - [Common Issues](#common-issues)
- [Server Management](#server-management)
  - [Accessing the Console](#accessing-the-console)
  - [Common Commands](#common-commands)
- [For Developers](#for-developers)
  - [Development Environment Setup](#development-environment-setup)
    - [Using VS Code DevContainer (Recommended)](#using-vs-code-devcontainer-recommended)
  - [Project Structure](#project-structure)
  - [Contributing](#contributing)
  - [Workflow Tools](#workflow-tools)

---

## Requirements

- **Docker**: [Installation guide](https://docs.docker.com/get-docker/)
- **Docker Compose**: Usually bundled with Docker Desktop
- Minimum 2GB RAM and 1GB storage space
- Open port 7777/TCP on your network (for external connections)

## How to Run

### Quick Start

1. **Clone this repository**:

   ```bash
   git clone https://github.com/your-org/terraria-server.git
   cd terraria-server
   ```

2. **Start the server**:

   ```bash
   docker-compose up -d
   ```

3. **View server logs**:

   ```bash
   docker-compose logs -f
   ```

4. **Stop the server**:

   ```bash
   docker-compose down
   ```

### Configuration

Edit the docker-compose.yml file to customize your server:

```yaml
environment:
  - WORLD_NAME=world # Name of your Terraria world
  - WORLD_SIZE=2 # World size: 1=small, 2=medium, 3=large
  - MAX_PLAYERS=8 # Maximum number of players allowed
  - PASSWORD= # Server password (leave blank for no password)
  - DIFFICULTY=0 # 0=normal, 1=expert, 2=master, 3=journey
  - SEED= # World seed (leave blank for random)
```

After changing configuration, restart the server:

```bash
docker-compose down
docker-compose up -d
```

### Environment Variables

The server can be customized using the following environment variables:

### Init Settings

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

### Journey Mode Power Permissions

Permission values: 0: Locked for everyone, 1: Can only be changed by host, 2: Can be changed by everyone

| Variable                                    | Default Value |
| ------------------------------------------- | ------------- |
| JOURNEY_PERMISSION_TIME_SET_FROZEN          | 1             |
| JOURNEY_PERMISSION_TIME_SET_DAWN            | 1             |
| JOURNEY_PERMISSION_TIME_SET_NOON            | 1             |
| JOURNEY_PERMISSION_TIME_SET_DUSK            | 1             |
| JOURNEY_PERMISSION_TIME_SET_MIDNIGHT        | 1             |
| JOURNEY_PERMISSION_GODMODE                  | 1             |
| JOURNEY_PERMISSION_WIND_SET_STRENGTH        | 1             |
| JOURNEY_PERMISSION_RAIN_SET_STRENGTH        | 1             |
| JOURNEY_PERMISSION_TIME_SET_SPEED           | 1             |
| JOURNEY_PERMISSION_RAIN_SET_FROZEN          | 1             |
| JOURNEY_PERMISSION_WIND_SET_FROZEN          | 1             |
| JOURNEY_PERMISSION_INCREASE_PLACEMENT_RANGE | 1             |
| JOURNEY_PERMISSION_SET_DIFFICULTY           | 1             |
| JOURNEY_PERMISSION_BIOMESPREAD_SET_FROZEN   | 1             |
| JOURNEY_PERMISSION_SET_SPAWN_RATE           | 1             |

### Connecting to Your Server

1. Open Terraria on your device
2. Select "Multiplayer"
3. Select "Join via IP"
4. Enter your server's IP address (or `localhost` if running locally)
5. Enter port `7777` (default)
6. Enter password (if configured)

### Common Issues

- **Can't connect remotely**: Check firewall settings and port forwarding
- **Server crashes**: Check logs with `docker-compose logs -f`
- **World data persistence**: Data is stored in Docker volumes, don't remove them if you want to keep your world

## Server Management

### Accessing the Console

Connect to the running server console using:

```bash
docker attach terraria
```

To detach without stopping the server: press `Ctrl+P` followed by `Ctrl+Q`

### Common Commands

- `help` - List all commands
- `exit` - Save and shutdown the server
- `playing` - Show connected players
- `kick <player>` - Remove a player
- `ban <player>` - Ban a player
- `save` - Force world save

For a complete list of commands, refer to the [Official Terraria Wiki](https://terraria.fandom.com/wiki/Server#Server_Commands).

## For Developers

### Development Environment Setup

#### Using VS Code DevContainer (Recommended)

1. Install [VS Code](https://code.visualstudio.com/) and [Docker](https://www.docker.com/products/docker-desktop)
2. Install the VS Code "Remote - Containers" extension
3. Clone this repository
4. Open the repository in VS Code
5. When prompted, click "Reopen in Container" or run the "Remote-Containers: Reopen in Container" command

The DevContainer includes all necessary development tools:

- Various linters and formatters (yamllint, shellcheck, hadolint, etc.)
- Git configuration
- Shell utilities

### Project Structure

```bash
.
├── .config/               # Configuration for linting and formatting
├── .devcontainer/         # VS Code DevContainer configuration
├── .github/               # GitHub Actions workflows
├── config/                # Terraria server configuration
│   ├── config-template.cfg  # Server configuration template
├── infrastructure/        # Project infrastructure
├── node_modules/          # Node.js dependencies (ignored by Git)
├── scripts/               # Server management scripts
├── server/                # Terraria server files
│   └── vanilla/1.4.4.9/   # Dockerfile for the specific server version
│       └── Dockerfile
├── docker-compose.yml     # Docker Compose configuration for the server
└── README.md              # Project documentation
```

### Contributing

1. Fork the repository
2. Create a feature branch with a descriptive name
3. Make your changes following the code style guidelines
4. Run linting and formatting checks before committing
5. Submit a pull request with a conventional commit title:
   - Format: `<type>(<scope>): <subject>`
   - Valid types: `feat`, `fix`, `refactor`, `revert`, `chore`, `ci`, `docs`
6. Ensure all CI checks pass

### Workflow Tools

- **Linting**:

  ```bash
  npm run lint            # Run ESLint
  npm run lint-fix        # Fix auto-fixable ESLint issues
  ```

- **Formatting**:

  ```bash
  npm run format          # Format code with Prettier
  ```

---

si, pongan boff.
