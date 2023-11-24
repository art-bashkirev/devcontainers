FROM artbashkirev/codespace:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

RUN apt update && \
    apt upgrade --no-install-recommends --yes && \
    apt install --no-install-recommends --yes \
        zsh \
        clang \
        llvm \
        lld \
        clang-format \
        dwarfdump \
        jq \
        manpages-dev \
        build-essential \
        cmake \
        wget \
        curl \
        git \
        ninja-build \
        pkg-config \
        liblzma-dev libstdc++-12-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --upgrade --no-cache-dir \
    pip \
    black \
    numpy \
    matplotlib \
    setuptools

# Install Competition.st
RUN cd /tmp && \
    git clone --depth 1 https://github.com/art-bashkirev/Competition.st.git && \
    cd Competition.st && \
    make && \
    make install && \
    cd .. && \
    rm --recursive --force Competition.st


# Set user back
USER code
