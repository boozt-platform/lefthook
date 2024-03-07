# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

SHELL := /usr/bin/env bash
.DEFAULT_GOAL := build
NAME ?= ""

.PHONY: build
build: container_build container_scanning

.PHONY: container_build
container_build:
	@docker build \
		-t ${NAME} \
		--file "${PWD}/hooks/${NAME}/Dockerfile" \
		.

.PHONY: container_run
run: container_run
container_run:
	@docker run --rm -it \
		-v ${PWD}:/app \
		${NAME} \
		bash

.PHONY: container_scanning
scan: container_scanning
container_scanning:
	@docker run --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/.trivy:/root/.cache/ \
		aquasec/trivy:0.38.3 \
		image --no-progress --exit-code 1 --severity CRITICAL ${NAME}

.PHONY: add_hook
add_hook:
	@read -r -p "Enter the name of the hook: " HOOK_NAME; \
	read -r -p "Do you want to create a Dockerfile for the hook? [y/N] " CREATE_DOCKERFILE; \
	bash -c "NAME=$$HOOK_NAME CREATE_DOCKERFILE=$$CREATE_DOCKERFILE $(PWD)/add-hook.sh"
