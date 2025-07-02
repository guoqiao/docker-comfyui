#!/bin/bash

set -xue

#comfy tracking disable
#comfy --install-completion

comfy --skip-prompt \
    install \
        --nvidia \
        --cuda-version=12.4 \
        --restore \
        --fast-deps
