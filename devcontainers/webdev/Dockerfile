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
        snapd \
        git \
        ninja-build \
        pkg-config \
        libgtk-3-dev \
        liblzma-dev libstdc++-12-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


# Install Python packages
RUN pip3 install --upgrade --no-cache-dir \
    black \
    numpy \
    matplotlib \
    pytz \
    setuptools \
    django django-cors-headers djangorestframework argon2-cffi bcrypt \
    flask

RUN systemctl enable snapd.service && systemctl start snapd.service

# Install Snap packages
RUN snap install core && \
    snap install flutter --classic

# Set user back
USER code
