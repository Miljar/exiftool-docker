# This line allows for using spaces instead of tabs for indentation
.RECIPEPREFIX +=

.DEFAULT_GOAL := all

SHELL=/bin/bash

CONTAINER_TAG=miljar/exiftool:latest
CONTAINER_NAME=exiftool

all: build_container_image

build_container_image:
	docker build -f Dockerfile -t ${CONTAINER_TAG} .

start_container: build_container_image
	docker run \
		-d \
		-v `pwd`:/tmp \
		--name ${CONTAINER_NAME} \
		-t ${CONTAINER_TAG}

test: start_container
	docker ps
	tests/smoke-test.sh
	docker ps
	docker kill ${CONTAINER_TAG};
	docker rm ${CONTAINER_TAG}
