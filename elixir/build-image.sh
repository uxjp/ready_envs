#!/bin/bash
NAME=${1:-elixir-env}

docker build -t $NAME .
