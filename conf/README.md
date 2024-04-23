# ext db

run it with `run.sh`.

full with data like this:

`pull_down.sh postgres://username:password@my_postgres_server:5432/databasename`

The connection string you pass in will be used to connect to an "conf" database and populate certain databases.

It omits databases not in use, and databases owned by superuser.
