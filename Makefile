app := comfyui

platform := --platform=linux/amd64
# pass --gpus=all only when nvidia-smi available
gpus := $(shell which nvidia-smi > /dev/null && echo "--gpus=all" || echo "")
user := $(shell id -u):$(shell id -g)

docker_run := docker run -it --rm --shm-size=2g ${gpus} ${platform} --name=${app} --env-file .env -v ./ComfyUI:/ComfyUI

PORT ?= 8818

.PHONY: all clean build

chown:
	sudo chown -R ${user} .

prune:
	docker image prune -f

build: prune
	time docker build ${NO_CACHE} ${platform} --progress=plain -t ${app}:latest .
	docker image ls | grep ^${app} | grep latest

build-no-cache:
	export NO_CACHE=--no-cache; make build

.env:
	touch .env

shell: .env
	${docker_run} ${app}:latest bash

server: .env
	curl ip.me
	${docker_run} \
		-p ${PORT}:${PORT} \
		${app}:latest \
		main.py \
			--listen=0.0.0.0 \
			--port=${PORT}

attach: .env
	docker exec -it ${app} bash
