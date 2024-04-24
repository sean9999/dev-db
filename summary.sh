#!/bin/bash

#   tests connectivity to all 3 local database servers

SUMMARY_SQL="SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;"

echo
echo "****  REDIS PING ****"

docker compose exec redis redis-cli CONFIG GET databases
docker compose exec redis redis-cli INFO keyspace
docker compose exec redis redis-cli PING


echo
echo "****  EXT database server    ****"
docker compose exec ext /scripts/run_query.sh "$SUMMARY_SQL"

echo
echo "****  CONF database server ****"
docker compose exec conf /scripts/run_query.sh "$SUMMARY_SQL"
