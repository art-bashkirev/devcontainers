FROM artbashkirev/codespace:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

# Install noVNC (VNC client)
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.zip -P /tmp && \
    unzip /tmp/v1.4.0.zip -d /tmp && \
    mv /tmp/noVNC-1.4.0 /opt/noVNC && \
    rm -rf /tmp/noVNC-1.4.0 /tmp/v1.4.0.zip && \
    chown -R code:code /opt/noVNC

# set virtual display
ENV DISPLAY=":0"

RUN apt update && \
    apt upgrade --no-install-recommends --yes && \
    apt install --no-install-recommends --yes \
        openbox \
        xvfb \
        x11vnc \
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
