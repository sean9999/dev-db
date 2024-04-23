#!/bin/bash

#   open a shell in dev-db-ext

set -euo pipefail
IFS=$'\n\t'

THIS_DIR="$( dirname -- "$( readlink -f -- "$0"; )"; )"
source $THIS_DIR/vars.sh

docker run -it \
    -v $PWD/scripts/:/scripts \
    -e POSTGRES_USER \
    -e POSTGRES_PASSWORD \
    -e POSTGRES_DB $DOCKER_IMAGE /bin/bash
