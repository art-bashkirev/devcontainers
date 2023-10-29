# Stage 1: Base
FROM artbashkirev/base:latest as builder
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

# Install Lua
RUN wget http://www.lua.org/ftp/lua-5.4.6.tar.gz -P /tmp && \
    cd /tmp && \
    tar zxf lua-5.4.6.tar.gz && \
    cd lua-5.4.6 && \
    make all test install && \
    cd /tmp && \
    rm -rf /tmp/lua-5.4.6*

# Install noVNC (VNC client)
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.zip -P /tmp && \
    unzip /tmp/v1.4.0.zip -d /tmp && \
    mv /tmp/noVNC-1.4.0 /opt/noVNC && \
    rm -rf /tmp/noVNC-1.4.0 /tmp/v1.4.0.zip && \
    chown -R code:code /opt/noVNC


# Stage 2: Final
FROM artbashkirev/base:latest
ARG DEBIAN_FRONTEND=noninteractive

# Install Powerline Fonts
RUN git clone https://github.com/powerline/fonts.git --depth=1 && \
    cd fonts && \
    ./install.sh && \
    cd .. && \
    rm -rf fonts

# Unset user
USER root

# Copy files from builder
COPY --from=builder /opt/noVNC /opt/noVNC

# set virtual display
ENV DISPLAY=":0"

RUN apt update && apt install --no-install-recommends --yes \
        zsh \
        clang-format \
        dwarfdump \
        jq \
        manpages-dev \
        openbox \
        xvfb \
        x11vnc && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


# Oh-my-Zsh setup
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Python packages
RUN pip3 install --upgrade --no-cache-dir \
    numpy \
    matplotlib \
    pytz \
    setuptools

# Copy files to image
# COPY ./etc /etc
# COPY ./opt /opt


# Set user
USER code

COPY .zshrc /home/code/.zshrc
RUN sudo chsh -s $(which zsh) $(whoami)

