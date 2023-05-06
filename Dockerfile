FROM rust:1.69-slim-bullseye

ARG USERNAME=developer
ARG GROUPNAME=developer
ARG UID=1000
ARG GID=1000
ARG PASSWORD=password

# Add user for develop
# If you  don't need, please comment out
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME 

# Tauri dependencies
# See https://tauri.app/v1/guides/getting-started/prerequisites#setting-up-linux
RUN apt-get update  && \
    apt-get install -y \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev

# Install Node.js
# See https://github.com/nodesource/distributions
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
    apt-get install -y nodejs

# Add user for develop
# If you  don't need, please comment out
USER $USERNAME
