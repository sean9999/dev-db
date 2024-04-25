#!/bin/bash

#   must look like this:
#   postgres://me:mypassword@something.wgames.io:5432/postgres
CONNECTION_STRING="$1"

if [ -z "$CONNECTION_STRING" ]
then
    logger -s "you must pass in a connection string"
    exit 1
fi

docker compose exec ext /scripts/pull_down.sh "$CONNECTION_STRING"
