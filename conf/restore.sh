#!/bin/bash

#   run all /scripts/*.sql files through psql 

docker exec $DOCKER_CONTAINER_NAME /scripts/restore.sh
