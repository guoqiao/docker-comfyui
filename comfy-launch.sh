#!/bin/bash

set -xue

#comfy tracking disable
#comfy --install-completion

comfy launch -- \
    --user-directory=/workspace/user \
    --temp-directory=/workspace/tmp \
    --input-directory=/workspace/input \
    --output-directory=/workspace/output \
    --extra-model-paths-config=/workspace/extra_model_paths.yaml \
    --listen=0.0.0.0 \
    --port=8818
