#!/bin/bash

THIS_DIR="$( dirname -- "$( readlink -f -- "$0"; )"; )"
source $THIS_DIR/vars.sh

docker build --tag=$DOCKER_IMAGE .
