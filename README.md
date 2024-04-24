# Local DB

This project is for working with local copies of Hard Rock / WGames databases:

- The "ext" database
- The "conf" database
- Redis

It makes it easy to pull down data so your local db is like remote.

This might become part of an effort to make every go service easy to run by doing so:

```sh
$ go run .
```

# Dependencies

You must have docker.

You must have access to HRD database servers.

#  Getting Started

From the root of the repo, do `docker compose up`. This will create a set of empty databases. You will then need to run a series of commands to seed your local database.

## the ext database server

To seed this, you must have access to to an "ext" database server, which contains databases like missions, inbox, and collections. The one I use is `pgsql-ext.stg.wgames.io.`.

To see this, you must have a connection string. Then you can run:

```sh
$ seed_ext_database.sh postgres://billybob:my-special-password@pgsql-ext.stg.wgames.io:5432/postgres
```

That will connect to the remote database, and sync down to local. The results will be available at:

```sh
$ psql postgres://wg:wg@localhost:5432/wg
```

## the conf database server

This one uses dumps, which are located in `./conf/scripts/*.sql`.

It's up to you to create new dumps and place them in that folder.

In my case, I use `pgcs-config.prod.wginfra.net`, which looks a lot like a production database server, but I make sure to connect to the `staging` database, and only operate on that.

In my case, I get a handful of tables in 3 different schemas: public, go, and geofence.

To import all dumps into your local "conf" database, run this:

```sh
$ populate_conf_database.sh 
```

After that, it will be accessible at:

```sh
$ psql postgres://wg:wg@localhost:5434/wg
```

Note the subtle difference: "ext" uses the standard `5432` port. This one uses `5434`.

## redis

so far, no pre-seeding is done with redis. It's good to go.
