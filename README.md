# docker-comfyui

Run ComfyUI Web Server in Docker on Linux with Nvidia GPU Support.

![Hello ComfyUI](./hello-comfyui.png)

## Prerequisites

- On Debian/Ubuntu Linux
- install Docker
- install Nvidia GPU Driver
- install Nvidia Container Toolkit

refer to `scripts/` dir.

## Quick Start

```
# clone this repo
git clone git@github.com:guoqiao/docker-comfyui.git
cd docker-comfyui/

# clone comfyui repo
git clone git@github.com:comfyanonymous/ComfyUI.git

# optional, checkout a specific branch/tag/version
cd ComfyUI/
git checkout v0.3.43
cd ..

# build docker image
make build

# run comfyui web server, GPU will be enabled in container if available
make server

# optional, attach to container to inspect
make attach

# open web server in browser
http://<IP>:8818
```

## ComfyUI Manager

ComfyUI Manager is already integrated, refer to [doc](https://docs.comfy.org/essentials/custom_node_overview#comfyui-manager) for usage.

