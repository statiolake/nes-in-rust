FROM debian:trixie

# Install build tools & cc65
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    curl \
    git \
    ca-certificates \
    wget \
    vim \
    sudo \
    unzip \
    cc65

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# # Compile & Install mrustc
# COPY mrustc/mrustc-master.zip /tmp
# RUN <<EOF
# unzip /tmp/mrustc-master.zip -d /opt/mrustc
# cd /opt/mrustc/mrustc-master
# make -f minicargo.mk LIBS
# ln -s /opt/mrustc/mrustc-master/bin/mrustc /usr/local/bin/mrustc
# EOF

# Set working directory
WORKDIR /workspace
