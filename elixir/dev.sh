#!/bin/bash
# Script for start developping from within a container ready to edit files and access GitHub

NAME=${1:-elixir-env}
NETWORK=${2:-postgres}

if [ "$(docker ps -aq -f name=$NAME)" ]; then
    echo "Container with the same name detected before this script run. Consider stopping and removing the container..."
else
    ./auth-doppler.sh
    ./build-image.sh $NAME
    doppler run --command="./run_container.sh $NAME $NAME $NETWORK"
fi

