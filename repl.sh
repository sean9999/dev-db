#!/bin/bash

SERVICE_NAME="$1"

case $SERVICE_NAME in 

    ext | conf)
        docker compose exec -it "$SERVICE_NAME" psql -U wg postgres    
    ;;
    redis)
        docker compose exec redis -it redis-cli
    ;;
    *)
        >&2 echo "There is not repl configured for $SERVICE_NAME"
        exit 1
    ;;

esac
