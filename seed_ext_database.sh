#!/bin/bash

#   must look like this:
#   postgres://me:mypassword@something.wgames.io:5432/postgres
CONNECTION_STRING="$1"

docker compose exec ext /scripts/pull_down.sh "$CONNECTION_STRING"
