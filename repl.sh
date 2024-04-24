#!/bin/bash

SERVICE_NAME="$1"

case $SERVICE_NAME in 

    ext | conf)
    docker compose exec -it "$SERVICE_NAME" psql -U wg postgres    

    redis)
    docker compose exec redis -it redis-cli

esac

