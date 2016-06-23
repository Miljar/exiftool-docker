# This line allows for using spaces instead of tabs for indentation
.RECIPEPREFIX +=

.DEFAULT_GOAL := all

SHELL=/bin/bash

all: test

test: 
	tests/smoke-test.sh
