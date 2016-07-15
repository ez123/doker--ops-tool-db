TAG_VERSION=160715

THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TIMESTAMP=$(shell date +"%Y%m%d_%H%M%S")

BUILD_OPTS=--pull --force-rm

default: dc-build

# --------------------------------------------------------------------------
dc-build:
	docker-compose build $(BUILD_OPTS) alpine
	docker-compose build $(BUILD_OPTS) ubuntu

dc-rebuild:
	docker-compose build $(BUILD_OPTS) alpine
	docker-compose build $(BUILD_OPTS) ubuntu

# --------------------------------------------------------------------------
dc-down-all:
	docker-compose down -v --remove-orphans

# --------------------------------------------------------------------------
dc-up-all-fg:
	docker-compose up

dc-up-all:
	docker-compose up -d

dc-up-all-n-logs:
	docker-compose up -d
	docker-compose logs -f

# --------------------------------------------------------------------------
dc-ps:
	docker-compose ps

dc-logs:
	docker-compose logs

dc-logs-f:
	docker-compose logs -f

# --------------------------------------------------------------------------
shell-ubuntu:
	docker-compose run --rm ubuntu bash

shell-alpine:
	docker-compose run --rm alpine bash

# --------------------------------------------------------------------------
clean-junk:
	docker rm        `docker ps -aq -f status=exited`      || true
	docker rmi       `docker images -q -f dangling=true`   || true
	docker volume rm `docker volume ls -qf dangling=true`  || true

# --------------------------------------------------------------------------
list:
	docker images
	docker volume ls
	docker ps -a
