# This line allows for using spaces instead of tabs for indentation
.RECIPEPREFIX +=

.DEFAULT_GOAL := all

SHELL=/bin/bash

CONTAINER_TAG=miljar/exiftool:latest
CONTAINER_NAME=exiftool

all: test

test: start_container
	tests/smoke-test.sh
