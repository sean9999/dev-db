#!/bin/bash

#   Pull down lots of databases from pgsql-ext.stg.wgames.io
#   import them into local
#   @warning: this is a destructive operation! It drops local databases before recreating them

#   You must pass in this arg and it must be of the form: postgres://username:password@my_postgres_server:5432/databasename

UPSTREAM_CONNECTION_STRING="$1"

DATABASES=(
    "collections"
    "facebook"
    "geofence"
    "giveaways"
    "inbox"
    "location_lists"
    "missions"
    "postgres"
    "profile"
    "profile_data"
    "rewards"
    "segments"
    "shop"
    "trophies"
    "wdollar_portal"
)

for DB in ${DATABASES[@]}; do

    #  create database
    echo "DROP DATABASE IF EXISTS $DB;" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres
    echo "CREATE DATABASE $DB WITH ENCODING = 'UTF8';" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres
    echo "GRANT ALL PRIVILEGES ON DATABASE $DB TO $POSTGRES_USER;" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres
    
    #  dump upstream database
    pg_dump --clean --create --no-owner --no-privileges --no-acl --no-security-labels \
        -d "$UPSTREAM_CONNECTION_STRING" \
        -f /tmp/$DB.upstream.dump.sql
    
    #  import into local
    PGPASSWORD=$POSTGRES_PASSWORD psql -h 127.0.0.1 -U $POSTGRES_USER $DB -f /tmp/$DB.upstream.dump.sql

done
