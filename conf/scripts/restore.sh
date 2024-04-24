#!/bin/bash

cd /scripts

#  create database
echo "DROP DATABASE IF EXISTS staging;" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres
echo "CREATE DATABASE staging WITH ENCODING = 'UTF8';" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres
echo "GRANT ALL PRIVILEGES ON DATABASE staging TO $POSTGRES_USER;" | PGPASSWORD=$POSTGRES_PASSWORD psql -w -h 127.0.0.1 -U $POSTGRES_USER postgres

cat *.sql | psql -U wg -d staging
