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

## Install SAM on MacOSX

Follow instructions at [Installing the AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

### MacOSX

```bash
$ brew tap aws/tap
  ...
$ brew install aws-sam-cli
  ==> Installing aws-sam-cli from aws/tap
  ==> Downloading https://github.com/awslabs/aws-sam-cli/releases/download/v0.47.0//aws-sam-cli-0.47.0.sierra.bottle.tar.gz
  ==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.com/92205085/e5599a80-7364-11ea-9f8a-3109dddbbdfb?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200420%2Fus-east-1%2Fs3%2Faws4_request&
  ######################################################################## 100.0%
  ==> Pouring aws-sam-cli-0.47.0.sierra.bottle.tar.gz
  🍺  /usr/local/Cellar/aws-sam-cli/0.47.0: 4,027 files, 64.2MB
```

Verify the installation:

```bash
$ sam --version
  SAM CLI, version 0.47.0
```

