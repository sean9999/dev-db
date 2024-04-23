#!/bin/bash

THIS_DIR="$(dirname "$(readlink -f "$0")")"
source $THIS_DIR/vars.sh

#   You must pass in this arg and it must be of the form: 
#   postgres://username:password@my_postgres_server:5432/databasename
CONNECTION_STRING="$1"

docker exec $DOCKER_CONTAINER_NAME /scripts/pull_down.sh "$CONNECTION_STRING"
