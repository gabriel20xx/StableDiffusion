#!/bin/bash

echo "Starting entrypoint script"

MODEL_DIR="/home/user/models/"

# Run webui.sh
cd /home/user/stable-diffusion-webui
./webui.sh --ckpt-dir "$MODEL_DIR" $COMMANDLINE_ARGS