#!/bin/bash
# Script for start developping from within a container ready to edit files and access GitHub

NAME=java-ready-env
HOST_PORT=8080
CONTAINER_PORT=8080  #default value for Spring-Boot apps

./auth-doppler.sh
./build-image.sh $NAME

if [ "$(docker ps -aq -f name=$NAME)" ]; then
    echo "Container with the same name detected before this script run. Stopping and removing the container..."
    docker stop $NAME
    docker rm $NAME
fi

doppler run --command="./run_container.sh $NAME $NAME $HOST_PORT $CONTAINER_PORT"
