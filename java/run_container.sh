#!/bin/bash

CONTAINER_NAME=$1
BASE_IMAGE=$2
HOST_PORT=$3
CONTAINER_PORT=$4
NETWORK=$5

docker run -it --network $NETWORK -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $BASE_IMAGE bash -c "

  # Create the .ssh directory if it doesn't exist
  mkdir -p ~/.ssh

  # Add the provided public SSH keys to files
  echo \"$ID_RSA_PUB_GITHUB\" > ~/.ssh/id_rsa.pub
  echo \"$ID_RSA_GITHUB\" > ~/.ssh/id_rsa

  # Set the appropriate permissions for the SSH key files
  chmod 644 ~/.ssh/id_rsa.pub
  chmod 600 ~/.ssh/id_rsa

  # Add GitHub's SSH keys to the known_hosts file
  ssh-keyscan github.com >> ~/.ssh/known_hosts

  # Configure Git with the provided username and email
  git config --global user.name \"$GITHUB_NAME\"
  git config --global user.email \"$GITHUB_EMAIL\"

  # Start an interactive bash shell
  echo 'Hello, your container is ready.'

  bash
"
