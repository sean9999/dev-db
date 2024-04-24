#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#   Pull down lots of databases from pgsql-ext.stg.wgames.io or similar
#   import them into local
#   @warning: this is a destructive operation! It drops local databases before recreating them

#   You must pass in a connection string and it must be of the form: 
#   postgres://username:password@my_postgres_server:5432/databasename
UPSTREAM_CONNECTION_STRING="$1"

DATABASES=(
    "collections collections"
    "facebook config"
    "geofence geofence"
    "giveaways"
    "inbox inbox"
    "location_lists location_lists"
    "missions clan2 clan_missions common daily daily_missions journey2 journey_missions login rewards rewards_missions"
    "profile profile"
    "profile_data profile"
    "rewards rewards trophies unanimity wchest"
    "segments"
    "shop bundle deeplinks old_shop shop wallet"
    "wdollar_portal"
)

function execute_locally(){
    #   execute psql commands against local DB
    #   @WARNING: This is SQL injection
    echo local psql: $@
    PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres -c "$@"
}

for DBLINE in ${DATABASES[@]}; do

    #   extract DB and SCHEMAS
    IFS=' ' read -r -a DARR <<< $DBLINE
    DB=${DARR[0]}
    SCHEMAS=("${DARR[@]:1}")

    echo
    echo DATABASE $DB

    #   create database with default schema (public)
    #   @WARNING: destructive commands
    execute_locally "DROP DATABASE IF EXISTS $DB WITH (FORCE);"
    execute_locally "CREATE DATABASE $DB WITH ENCODING = 'UTF8';"
    execute_locally "GRANT ALL PRIVILEGES ON DATABASE $DB TO $POSTGRES_USER;"
    
    #   dump public schema
    pg_dump -v --schema=public \
    --no-acl \
    --no-owner \
    --no-security-labels \
    -d "$UPSTREAM_CONNECTION_STRING" \
    -f /tmp/$DB.public.dump.sql    
    
    #   import public schema
    echo "IMPORTING SCHEMA public FROM DATABASE $DB"
    PGPASSWORD=$POSTGRES_PASSWORD psql -h 127.0.0.1 -U $POSTGRES_USER $DB -f /tmp/$DB.public.dump.sql
    echo

    #   bespoke schemas
    for schema in ${SCHEMAS[@]}; do
        echo "DUMPING SCHEMA $schema IN DATABASE $DB"
        
        #execute_locally "CREATE SCHEMA IF NOT EXISTS $schema;"
        pg_dump -v --schema=$schema \
        --no-acl \
        --no-owner \
        --no-security-labels \
       -d "${UPSTREAM_CONNECTION_STRING/\/postgres/\/$DB}" \
       -f /tmp/$DB.$schema.dump.sql

       echo "IMPORTING SCHEMA $schema FROM DATABASE $DB"
       PGPASSWORD=$POSTGRES_PASSWORD psql -h 127.0.0.1 -U $POSTGRES_USER $DB -f /tmp/$DB.$schema.dump.sql
       echo
    done

done
