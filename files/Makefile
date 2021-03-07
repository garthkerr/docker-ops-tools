SHELL := /bin/bash

help:
	@./scripts/make/help

cleanup:
	@./scripts/make/cleanup

install:
	@./scripts/make/install

setup-env:
	@bash <(curl -LsS https://raw.githubusercontent.com/garthkerr/deinit/v0.0.1/deinit)

setup-mac:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew bundle --no-lock

use-direnv:
	@curl -o .envrc -s https://raw.githubusercontent.com/garthkerr/docker-ops-tools/master/files/.envrc.example
	@direnv allow

use-docker: use-direnv
	@docker-compose build
