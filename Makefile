# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

SHELL := /usr/bin/env bash
.DEFAULT_GOAL := build
NAME ?= ""
DOCKERFILE ?= "false"

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
	@NAME=$(NAME) DOCKERFILE=$(DOCKERFILE) $(PWD)/add-hook.sh
