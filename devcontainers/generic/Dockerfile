# Stage 1: Base
FROM artbashkirev/base:latest as builder
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

# Install noVNC (VNC client)
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.zip -P /tmp && \
    unzip /tmp/v1.4.0.zip -d /tmp && \
    mv /tmp/noVNC-1.4.0 /opt/noVNC && \
    rm -rf /tmp/noVNC-1.4.0 /tmp/v1.4.0.zip && \
    chown -R code:code /opt/noVNC

# Stage 2: Final
FROM artbashkirev/base:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

# Copy files from builder
COPY --from=builder /opt/noVNC /opt/noVNC

# set virtual display
ENV DISPLAY=":0"

RUN apt update && apt install --no-install-recommends --yes \
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
        x11vnc && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


# Install Python packages
RUN pip3 install --upgrade --no-cache-dir \
    black \
    numpy \
    matplotlib \
    pytz \
    setuptools \
    ipykernel ipywidgets jupyter

RUN mkdir /workspaces/ && chown -R code:code /workspaces

# Set user
USER code

# Oh-my-Zsh setup
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

COPY .zshrc /home/code/.zshrc
RUN sudo chsh -s $(which zsh) $(whoami)
RUN export PATH=$PATH:/home/code/.local/bin
