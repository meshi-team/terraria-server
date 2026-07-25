FROM mono:slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build-time arguments for dynamic labels
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
ARG DOCS

# New labels following OCI Image Spec
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.version=${VERSION}
LABEL org.opencontainers.image.revision=${VCS_REF}
LABEL org.opencontainers.image.title="Terraria Server Vanilla"
LABEL org.opencontainers.image.url="https://github.com/meshi-team/terraria-server"
LABEL org.opencontainers.image.documentation="https://github.com/meshi-team/terraria-server/$DOCS"
LABEL org.opencontainers.image.vendor="Meshi Team"

# Additional helpful labels
LABEL com.terraria.version="${VERSION}"
LABEL io.github.meshi-team.terraria-server.maintainer="Meshi Team"
LABEL io.github.meshi-team.terraria-server.is-production="true"

LABEL org.opencontainers.image.description="Terraria dedicated server (v$VERSION) container image with persistent world storage and customizable configuration."
LABEL org.opencontainers.image.source="https://github.com/meshi-team/terraria-server"
LABEL org.opencontainers.image.licenses="MIT"

# Install dependencies.
# mono:slim is based on Debian Buster, which reached end-of-life: its
# packages are now only served from archive.debian.org, whose Release
# files are frozen (hence the disabled Check-Valid-Until).
RUN printf 'deb http://archive.debian.org/debian buster main\ndeb http://archive.debian.org/debian-security buster/updates main\n' > /etc/apt/sources.list \
  && apt-get -o Acquire::Check-Valid-Until=false update \
  && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y curl \
  && apt-get install --no-install-recommends -y nuget \
  && apt-get install --no-install-recommends -y vim \
  && apt-get install --no-install-recommends -y zip \
  && apt-get install --no-install-recommends -y unzip \
  && apt-get install --no-install-recommends -y gettext \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Create a directory for the server
RUN mkdir /terraria-server

# Define persistent volume for Terraria world data
# Note: If modifying this path, also update ./scripts/load-env.sh
# This ensures world files persist across container restarts
VOLUME /terraria-server/worlds

# Download and extract the server.
# TERRARIA_FILE_VERSION is the release number as it appears in the official
# download filename (e.g. 1456 for 1.4.5.6). When empty, the latest release
# is resolved from the terraria.org versions endpoint (second entry = Mobile).
# Note: the resolved version is frozen in the Docker layer cache; pass an
# explicit TERRARIA_FILE_VERSION or build with --no-cache to force a refresh.
ARG TERRARIA_FILE_VERSION=""

RUN RELEASE="${TERRARIA_FILE_VERSION}" \
  && if [[ -z "${RELEASE}" ]]; then \
    RELEASE=$(curl -fsSL https://terraria.org/api/get/dedicated-servers-names \
      | grep -oE 'terraria-server-[0-9]+\.zip' \
      | sed -n '2p' \
      | tr -dc '0-9'); \
  fi \
  && curl -fL "https://terraria.org/api/download/mobile-dedicated-server/terraria-server-${RELEASE}.zip" \
    -o terraria-server.zip \
  && unzip terraria-server.zip -d /tmp-downloads \
  && rm terraria-server.zip

WORKDIR /terraria-server

COPY ./scripts ./scripts
COPY ./config ./config

ENV ENV_SCRIPT=/terraria-server/scripts/load-env.sh

# Remove unnecessary files
RUN mv /tmp-downloads/*/Linux/* /terraria-server \
  && rm -r /tmp-downloads \
  && chmod +x ./TerrariaServer.bin.x86_64 \
  && chmod +x ./TerrariaServer \
  && chmod +x -R ./scripts

ENTRYPOINT [ "/bin/bash", "./scripts/entrypoint.sh" ]
CMD []
