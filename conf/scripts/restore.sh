#!/bin/bash

THIS_DIR="$(dirname "$(readlink -f "$0")")"

cd $THIS_DIR

cat *.sql | psql -U wg -d staging
