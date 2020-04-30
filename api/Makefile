install:
	pip3 install -r handlers/requirements.txt
	pip3 install -r graphql/requirements.txt
.PHONY: install

test:
	python -m pytest test/unit -v
.PHONY: test

start:
	serverless offline
.PHONY: start

graphql:
	python ./graphql/app.py
.PHONY: graphql
