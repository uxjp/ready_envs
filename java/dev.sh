#!/bin/bash
# Script for start developping from within a container ready to edit files and access GitHub

NAME=java-ready-env
HOST_PORT=8080
CONTAINER_PORT=8080  #default value for Spring-Boot apps
NETWORK=postgres
DB_CONTAINER_NAME=postgres-db

./auth-doppler.sh
./build-image.sh $NAME
./postgres-server.sh $DB_CONTAINER_NAME $NETWORK

if [ "$(docker ps -aq -f name=$NAME)" ]; then
    echo "Container with the same name detected before this script run. Stopping and removing the container..."
    docker stop $NAME
# TODO
# [  ] Rethink the most used branch for the flow while developing this repo.
# Deleteing the container every time is to harsh.
# docker rm $NAME
fi

doppler run --command="./run_container.sh $NAME $NAME $HOST_PORT $CONTAINER_PORT $NETWORK"
