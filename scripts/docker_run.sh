#!/usr/bin/env bash

set -eu

source scripts/common.sh

mkdir -p ${MODEL_REPO_HOST_PATH}

source scripts/docker_base.sh

sudo docker run \
    -it \
    --rm \
    --net=host \
    --runtime nvidia \
    --gpus=1 \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v ${MODEL_REPO_HOST_PATH}:${MODEL_REPO_CONTAINER_PATH} \
    triton_test:l4t-r${L4T_VERSION}
