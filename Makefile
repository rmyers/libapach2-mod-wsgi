#% Build and publish libapache2-mod-wsgi for trusty
#%
#% Quick start:
#%     make build
#%
#% Run the build container
#%     make dev
#%

.SILENT: help
.PHONY: build dev help
default: help

build:  ## Build the debian package
	@docker build . -t libapache2-mod-wsgi
	# Copy the debian package file from the image.
	# First we need to create a container to copy the file from.
	@CONTAINER_ID=$(shell docker create --rm libapache2-mod-wsgi); \
	docker cp $$CONTAINER_ID:/wsgi/debian ./;

dev: ## Run a container to inspect/hock on files
	@docker run --rm -it -v ${PWD}/mod-wsgi:/wsgi/mod-wsgi libapache2-mod-wsgi /bin/bash

clean: ## Remove docker images
	@docker image rm -f libapache2-mod-wsgi

#% Available Commands:
help: ## Help is on the way
	grep '^#%' $(MAKEFILE_LIST) | sed -e 's/#%//'
	grep '^[a-zA-Z]' $(MAKEFILE_LIST) | awk -F ':.*?## ' 'NF==2 {printf "   %-20s%s\n", $$1, $$2}' | sort
