#!/bin/bash

# Read in config.env file; error if not found
if [ ! -f config.env ]; then
    echo "config.env not found, please run setup.sh"
    exit 1
fi
source config.env

export NUM_GPUS=${NUM_GPUS}
export MODEL_DIR="${MODEL_DIR}"/"${MODEL}-${NUM_GPUS}gpu"
export GPUS=$(seq 0 $(( NUM_GPUS - 1 )) | paste -sd ',')
docker-compose up