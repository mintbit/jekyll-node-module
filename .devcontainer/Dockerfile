# Pinned to devcontainers/base version 2.1.9 on Debian 13 (Trixie)
FROM mcr.microsoft.com/devcontainers/base:2.1.13@sha256:025b74bb5f7ac53edd77e01aa7188c359aab100e23a2f6220bde50bbb9fd31dd

# Disable lifecycle scripts to reduce supply chain risk
ENV NPM_CONFIG_IGNORE_SCRIPTS=true \
    YARN_ENABLE_SCRIPTS=false \
    YARN_IGNORE_SCRIPTS=true

# Locale + noninteractive apt
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Bind to all interfaces so the server is reachable from outside the container
ENV BINDING="0.0.0.0"

# Switch to root user
USER root

# Install apt dependencies
RUN --mount=type=bind,source=Aptfile,target=/tmp/Aptfile \
    apt-get update -qq && \
    apt-get install -yq --no-install-recommends $(grep -Ev '^\s*#' /tmp/Aptfile | xargs) && \
    rm -rf /var/lib/apt/lists/*

# Pre-create node_modules with correct ownership
RUN mkdir -p /workspace/node_modules && \
    chown vscode:vscode /workspace/node_modules

# Switch back to vscode
USER vscode

# Install mise-en-place
RUN curl https://mise.run | sh

# Activate mise in interactive shells
RUN echo 'eval "$(~/.local/bin/mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'eval "$(~/.local/bin/mise activate zsh)"' >> /home/vscode/.zshrc
