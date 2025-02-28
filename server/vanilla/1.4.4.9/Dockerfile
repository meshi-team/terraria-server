FROM mono:slim

# Install dependencies
RUN apt-get update \
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

# Download and extract the server
ENV DOWNLOAD_LINK=https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip

RUN curl -L $DOWNLOAD_LINK -o terraria-server.zip \
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
