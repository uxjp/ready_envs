FROM ubuntu:24.04

COPY iex_postgres app/iex_postgres

RUN apt-get update && apt-get install -y \
    git \
    curl \
    openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    elixir \
    neovim


RUN echo 'parse_git_branch() { git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"; }' >> /root/.bashrc && \
    echo 'export PS1="\[\033[01;32m\]@\u\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[\033[01;36m\]$(parse_git_branch)\[\033[00m\]\n|> "' \
        >> /root/.bashrc

WORKDIR /app
