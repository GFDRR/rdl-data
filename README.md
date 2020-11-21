# Risk Data Library Database

Challenge Fund Database combining Hazard, Exposure, Loss and Vulnerability
schema into a single database

Please note that the contents of this repository should be considered
experimental.

## Getting started

### Pre-requisites

Python code in this repository requires Python3 and is intended for use with
PostgreSQL 11 and PostGIS 2.5.

If you also wish to use the optional taxonomy2human stored procedure then you will
also need to install support for plpython3u and install the openquake.taxonomy
package from https://github.com/gem/oq-platform-taxtweb

### Setup

This will spin up a new PostgreSQL server with postgix extension enabled and pgadmin2 server using docker
check `docker-compose.yaml` to extract default usr/pwd.

```bash
$ make start
```

```bash
$ make stop
```

### Local python setup

These are instructions for cases where docker is not being used and only the `challenge_fund_db` interfaces are needed.

Download or clone project:

```bash
$ git clone https://github.com/GFDRR/rdl-data.git
```

Install as a local development/editable package

```bash
$ cd rdl-data
$ pip install -e .
```

Package can now be imported without modifying system paths:

```python
import challenge_fund_db as cf

print(cf.hazard)
```



