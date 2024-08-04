#!/bin/bash

TARGET_NETWORK_NAME=${1:-postgres}
if docker network ls --format '{{.Name}}' | grep -wp "$TARGET_NETWORK_NAME"; then
  echo "Network exists"
else
  docker network create --driver bridge $TARGET_NETWORK_NAME
  echo "New Docker Network - $TARGET_NETWORK_NAME - created using driver bridge"
fi
