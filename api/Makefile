install:
	pip3 install -r src/requirements.txt
.PHONY: install

test:
	python -m pytest test/unit -v
.PHONY: test

start:
	serverless offline
.PHONY: start
