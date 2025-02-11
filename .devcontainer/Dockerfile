################################################################################
# Base image
# https://github.com/devcontainers/images/tree/main/src/base-debian
################################################################################
FROM mcr.microsoft.com/devcontainers/base:1-bookworm

ARG DEVCONTAINER_USER=vscode
ARG DEVCONTAINER_USER_HOME="/home/${DEVCONTAINER_USER}"

ENV CONTAINER_WORKSPACE_FOLDER="${CONTAINER_WORKSPACE_FOLDER:-/workspaces/terraria-meshi-team}"

# Set the pipefail option to ensure correct exit codes for piped commands.
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add aliases for ls
RUN \
  echo "alias ls='ls --color=auto'" >> "${DEVCONTAINER_USER_HOME}/.bash_aliases" \
  && echo "alias ll='ls -alF'" >> "${DEVCONTAINER_USER_HOME}/.bash_aliases" \
  && echo "alias la='ls -A'" >> "${DEVCONTAINER_USER_HOME}/.bash_aliases" \
  && echo "alias l='ls -CF'" >> "${DEVCONTAINER_USER_HOME}/.bash_aliases"

# Add alias for cd
RUN \
  echo "alias cd='HOME=${CONTAINER_WORKSPACE_FOLDER} cd'" \
  >> "${DEVCONTAINER_USER_HOME}/.bash_aliases"

# Change the ownership of the mounted volumes to the non-root user
# Node modules
RUN \
  mkdir -p "${CONTAINER_WORKSPACE_FOLDER}/node_modules" \
  && chown -R "${DEVCONTAINER_USER}:${DEVCONTAINER_USER}" "${CONTAINER_WORKSPACE_FOLDER}/node_modules"
