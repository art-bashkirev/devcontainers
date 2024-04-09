FROM artbashkirev/codespace:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

RUN apt update && \
    apt upgrade --no-install-recommends --yes && \
    apt install --no-install-recommends --yes \
        git unzip gzip xz-utils && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY ./requirements.txt /requirements.txt

RUN pip3 install --upgrade --no-cache-dir -r /requirements.txt

# Set user back
USER code

# Install Proto manager
RUN zsh -c "curl -fsSL https://moonrepo.dev/install/proto.sh | zsh -s -- --yes"
