FROM artbashkirev/base:latest
ARG DEBIAN_FRONTEND=noninteractive

# Unset user
USER root

RUN apt update && apt install --no-install-recommends --yes \
        zsh \
        clang \
        llvm \
        lld \
        clang-format \
        dwarfdump \
        jq \
        manpages-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*


# Install Python packages
RUN pip install --upgrade --no-cache-dir \
    pip \
    black \
    numpy \
    matplotlib \
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
