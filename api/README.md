# API

This is the api backend code to handle the interactions with database and orchestration with third-party entities

## Getting started

### Install dependencies

```bash
$ make install
```

### Run tests

```
$ make test
  python -m pytest test/unit -v
  ================================================== test session starts ==================================================
  platform darwin -- Python 3.8.2, pytest-5.4.1, py-1.8.1, pluggy-0.13.1 -- /Users/gabriel/.pyenv/versions/3.8.2/bin/python
  cachedir: .pytest_cache
  rootdir: /Users/gabriel/dev/world-bank/cf_db/api
  plugins: mock-3.1.0
  collected 1 item

  test/unit/test_handler.py::test_lambda_handler PASSED                                                             [100%]

  =================================================== 1 passed in 0.17s ===================================================
```

### Start server

Spin up a local server

```
$ make start
  serverless offline
  offline: Starting Offline: dev/us-east-1.
  offline: Offline [http for lambda] listening on http://localhost:3002

    ┌─────────────────────────────────────────────────────────────────────────┐
    │                                                                         │
    │   GET | http://localhost:3000/dev/health                                │
    │   POST | http://localhost:3000/2015-03-31/functions/hello/invocations   │
    │                                                                         │
    └─────────────────────────────────────────────────────────────────────────┘

  offline: [HTTP] server ready: http://localhost:3000 🚀
  offline:
  offline: Enter "rp" to replay the last request
```

Visit http://localhost:3004/dev/health in your browser

This should be the response:

```json
{
  "status": "ok"
}
```