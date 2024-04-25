#!/bin/bash

cd /scripts

cat /scripts/go.from-staging.sql | psql -U wg -d profile
