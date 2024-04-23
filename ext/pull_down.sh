#!/bin/bash

THIS_DIR="$(dirname "$(readlink -f "$0")")"
source $THIS_DIR/vars.sh

#   must look like this:
#   postgres://me:mypassword@something.wgames.io:5432/postgres
CONNECTION_STRING="$1"

docker exec $DOCKER_CONTAINER_NAME /scripts/pull_down.sh "$CONNECTION_STRING"
