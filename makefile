APP_NAME ?= telemetry
PORT ?= 3000
WORKERS ?= 1
THREADS ?= 1

build:
	docker build -t $(APP_NAME) .

run: build
	docker run -it --name test-$(APP_NAME) --rm $(APP_NAME) bash

test: build
	PYTHONDONTWRITEBYTECODE=1 # no __pycache__ files
	docker run --name test-$(APP_NAME) --rm \
  -v $(PWD):/usr/src/app $(APP_NAME) \
  	python -Bm pytest -fxqs --color="yes"