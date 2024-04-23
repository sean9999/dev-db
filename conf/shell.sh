#!/bin/bash

#   open a shell in dev-db-conf

set -euo pipefail
IFS=$'\n\t'

THIS_DIR="$( dirname -- "$( readlink -f -- "$0"; )"; )"
source $THIS_DIR/vars.sh

docker exec -it \
    -e POSTGRES_USER \
    -e POSTGRES_PASSWORD \
    -e POSTGRES_DB $DOCKER_CONTAINER_NAME /bin/bash

