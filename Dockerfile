FROM pytorch/pytorch:2.5.1-cuda12.1-cudnn9-devel

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512

RUN apt-get update \
    && apt-get install -y \
        curl \
        wget \
        tree \
        time \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENV HF_HUB_ENABLE_HF_TRANSFER=1
# a rust lib to dl faster
RUN pip install -U \
    huggingface_hub[hf_transfer]

WORKDIR /ComfyUI
# the ComfyUI/models/ dir is not included here
ADD ComfyUI .
RUN pip install -U -r requirements.txt
RUN pip install -U -r custom_nodes/ComfyUI-Manager/requirements.txt

ENTRYPOINT ["/opt/conda/bin/python"]
