FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
    wget \
    openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neovim

# Install Golang
RUN wget https://golang.org/dl/go1.22.5.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.22.5.linux-arm64.tar.gz && \
    rm go1.22.5.linux-arm64.tar.gz

# Set up Golang environment
ENV PATH="/usr/local/go/bin:${PATH}"

RUN echo 'parse_git_branch() { git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"; }' >> /root/.bashrc && \
    echo 'export PS1="\[\033[01;32m\]@\u\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[\033[01;36m\]$(parse_git_branch)\[\033[00m\]\n|> "' \
        >> /root/.bashrc

WORKDIR /app
