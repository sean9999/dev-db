#!/bin/bash

#   @warning: this is SQL injection. Please be responsible

QUERY="$1"

echo $QUERY | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres