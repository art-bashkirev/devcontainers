FROM alpine:latest

# Unset user
USER root

RUN apk add --no-cache \
        doas \
        shadow \
        zsh \
        make \
        curl \
        git \
        g++ \
        python3 \
        python3-dev \
        py3-pip

# Install Python packages
RUN pip install --upgrade --no-cache-dir \
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
    rm -f -r Competition.st

RUN adduser code -G wheel \
    --home "/home/code"


RUN echo "auth  sufficient  pam_shells.so" > /etc/pam.d/chsh && \
    chsh -s $(which zsh) code

RUN mkdir /workspaces/ && chown -R code /workspaces

# Set user back
USER code

# Oh-my-Zsh setup
COPY .zshrc /home/code/.zshrc
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
