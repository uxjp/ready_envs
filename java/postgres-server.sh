#!/bin/bash

CONTAINER_NAME=${1:-postgres-db}
NETWORK=${2:-postgres}

container_exists() {
  docker ps -a --format '{{.Names}}' | grep -wq "$CONTAINER_NAME"
}

container_running() {
    docker ps --format '{{.Names}}' | grep -wq "$CONTAINER_NAME"
}

if ! container_exists; then
  echo "Creating new container > $CONTAINER_NAME < in network > $NETWORK <"
  docker run -d --name $CONTAINER_NAME --network $NETWORK -e POSTGRES_PASSWORD=mysecretpassword postgres
elif container_running; then
  echo "Container named $CONTAINER_NAME already running."
elif container_exists && ! container_running; then
  echo "Container running but stop. Now starting the container..."
  docker start $CONTAINER_NAME
else
  echo "The database container need some special attetion and requires manual tunning..."
  exit 1
fi
