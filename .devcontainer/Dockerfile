FROM debian:trixie

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    ca-certificates \
    wget \
    vim \
    cc65

# Create non-root user
RUN useradd -m -s /bin/bash vscode

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER vscode
