#!/bin/bash

THIS_DIR="$( dirname -- "$( readlink -f -- "$0"; )"; )"
source $THIS_DIR/vars.sh

docker run -p 5432:5432 \
    --name=$DOCKER_CONTAINER_NAME \
    --rm \
    -v $PWD/docker-entrypoint-initdb.d/:/mnt/ \
    -e POSTGRES_USER=wg \
    -e POSTGRES_PASSWORD=wg \
    -e POSTGRES_DB=wg \
    $DOCKER_IMAGE:latest
