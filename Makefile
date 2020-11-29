.PHONY: lambda.zip

install:
	pip install -r requirements.txt

install-dev: install
	pip install -r requirements-test.txt

lint:
	flake8 app tests

unittest:
	ENVIRONMENT_NAME=test PYTHONPATH=./app:. pytest -sv tests/

coverage:
	ENVIRONMENT_NAME=test PYTHONPATH=./app:. pytest tests/ --cov=app

test: lint unittest

lambda.zip:
	if [ -f lambda.zip ]; then rm lambda.zip; fi
	if [ -d "./package" ]; then rm -rf package/; fi
	pip install -t package -r requirements.txt
	cp -r app package/app
	cd ./package && zip -rq ../lambda.zip .
	rm -rf ./package