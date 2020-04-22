# cf_db

Challenge Fund Database combining Hazard, Exposure, Loss and Vulnerability
schema into a single database

Please note that the contents of this repository should be considered
experimental.

## Quick setup

### Pre-requisites

Python code in this repository requires Python3 and is intended for use with
PostgreSQL 11 and PostGIS 2.5.

If you also wish to use the optional taxonomy2human stored procedure then you will
also need to install support for plpython3u and install the openquake.taxonomy
package from https://github.com/gem/oq-platform-taxtweb

## Getting started

### Setup

This will spin up a new PostgreSQL server with postgix extension enabled and pgadmin2 server using docker
check `docker-compose.yaml` to extract default usr/pwd.

```bash
$ make start
```

```bash
$ make stop
```
