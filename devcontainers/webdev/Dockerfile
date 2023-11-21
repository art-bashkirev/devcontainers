FROM artbashkirev/codespace:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

# set virtual display
ENV DISPLAY=":0"

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
        openbox \
        xvfb \
        x11vnc \
        build-essential \
        cmake \
        wget \
        curl \
        git \
        ninja-build \
        pkg-config \
        libgtk-3-dev \
        liblzma-dev libstdc++-12-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY ./requirements.txt /requirements.txt

RUN pip3 install --upgrade --no-cache-dir \
    black \
    numpy \
    matplotlib \
    setuptools && \
    pip3 install --upgrade --no-cache-dir -r /requirements.txt


# Set user back
USER code
