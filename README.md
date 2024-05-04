# Local DB

This app spins up 3 containers. 2 postgres, and one redis. It provides ways for you to sync down data from a Config database server, and a UserData database server. It is meant as a tool to assist in creating local environments for Go services.

# Dependencies

You must have docker.

You _should_ have access to HRD database servers.

You should have bash. zsh might work too.

You need to have the following ports available:

- 5432
- 5433
- 6379

... or you can change `docker-compose.yml` to expose different port numbers.

#  Getting Started

From the root of the repo, do `docker compose up`. This will create a set of empty databases. You will then need to run a series of commands to seed your local database.

## the ext database server

> [!NOTE]  
> This is more properly called the "data" database server, or "user data" database server

To seed this, you must have access to to an "ext" database server, which contains databases like missions, inbox, and collections. The one I use is `pgsql-ext.stg.wgames.io.`.

example:

```sh
$ ./seed_ext_database.sh postgres://billybob:my-special-password@pgsql-ext.stg.wgames.io:5432/postgres
```

> [!TIP]
> If your postgres password contains special characters, you'll need to consult your shell's escaping rules

That will connect to the remote database, and sync down to local. You will then have a mirror at:

```sh
$ psql postgres://wg:wg@localhost:5432/wg
```

## the conf database server

This one uses dumps, which are located in `./conf/scripts/*.sql`.

It's up to you to create new dumps and place them in that folder. Although there are some there for convenience, they may be old by the time you read this.

In my case, I use `pgcs-config.prod.wginfra.net`. I make sure to connect to the `staging` database, and only operate on that. I do not wish to touch production data.

In my case, I get a handful of tables in 3 different schemas: public, go, and geofence.

To import all dumps into your local "conf" database, run this:

```sh
$ ./populate_conf_database.sh 
```

After that, it will be accessible at:

```sh
$ psql postgres://wg:wg@localhost:5434/wg
```

Note the subtle difference: "ext" uses the standard `5432` port. "conf" uses `5434`.

## redis

so far, no pre-seeding is done with redis. It's good to go.

# Local DB

This project is designed to make it easy to work with local copies of Hard Rock / WGames databases. Such as:

- The "ext" database
- The "conf" database
- Redis

It makes it easy to pull down data so your local db is like remote.

This might become part of an effort to make every go service easy to run by doing so:

```sh
$ go run .
```


# Basic Architecture

The docker-compose.yml defines services that are exposed on well-known ports on your host:

- 5432 for the "ext" postgres instance
- 5434 for the "conf" postgres instnce
- 6379 for redis

This means that those ports must be free before running `docker compose up`. If you have local postgres or redis instances running already, there will be conflicts.

The "ext" and "conf" database instances are encapsulated in the "ext" and "conf" folders. Within each, the "scripts" folder is mounted to your host, so that you can modify scripts at will and manipulate files in that directory.

- In the "ext"  container, `./ext/scripts`  in the repo is mounted to `/scripts` in the container.
- In the "conf" container, `./conf/scripts` in the repo is mounted to `/scripts` in the container.

The redis container is defined in `docker-compose.yml`, but does not require any special processing, so does not have a subfolder in this repo.


# Going Forward

All this seeding is only required at the beginning. Data is persistent. To spin up or down your set of databases:

```sh
$ docker compose up # bring the databases up
$ docker compose down # turn them off 
```
Once you have these local databases up, and they are listed in `config.json`, you should be able to bring any service up by doing:

```sh
$ go run .
```

# Test connectivity

Simply run this:

```sh
$ ./summary.sh
```

It connects to each database and returns summary information. If there is a connection error, it will be shown here.
