FROM alpine:latest

# Unset user
USER root

# Install packages
RUN apk add --upgrade --no-cache apk-tools && \
        apk upgrade --no-cache --available && \
        apk add --upgrade --no-cache \
                sudo \
                shadow \
                zsh \
                make \
                curl \
                git \
                g++ \
                gcc \
                python3 \
                python3-dev \
                py3-pip \
                py3-psutil && \
        apk cache clean

# Add user
RUN adduser -D code -G wheel \
            --home "/home/code" \
            --disabled-password && \
    echo "code ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/code && \
    chmod 0440 /etc/sudoers.d/code

# Install Python packages
RUN pip install --upgrade --no-cache-dir --break-system-packages \
            pip \
            black \
            numpy \
            matplotlib \
            setuptools \
            ipykernel \
            pandas

# Install Competition.st
RUN cd /tmp && \
    git clone --depth 1 https://github.com/art-bashkirev/Competition.st.git && \
    cd Competition.st && \
    make && \
    make install && \
    cd .. && \
    rm -f -r Competition.st

# Shell to Zsh
RUN echo "auth  sufficient  pam_shells.so" > /etc/pam.d/chsh && \
    chsh -s $(which zsh) code

RUN mkdir /workspaces/ && chown -R code /workspaces

# Set user back
USER code

# Oh-my-Zsh setup
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
COPY .zshrc /home/code/.zshrc
