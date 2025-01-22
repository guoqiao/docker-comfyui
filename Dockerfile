# FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04
# above image deprecated, switch to pytorch one
FROM pytorch/pytorch:2.5.1-cuda12.1-cudnn9-devel

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512

RUN apt-get update && apt-get install -y \
        curl \
        tree \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ComfyUI

ADD ComfyUI .

RUN pip install -r requirements.txt
RUN pip install -r custom_nodes/ComfyUI-Manager/requirements.txt

ENV HF_HUB_ENABLE_HF_TRANSFER=1
# a rust lib to dl faster
RUN pip install -U \
    huggingface_hub[hf_transfer]


ENTRYPOINT ["/opt/conda/bin/python"]
