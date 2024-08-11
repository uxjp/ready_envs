#!/bin/bash
NAME=${1:-env-ubuntu}

docker build -t $NAME .
