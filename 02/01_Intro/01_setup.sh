#!/bin/bash
#
# 'import' 0x_param.conf
source 01_param.conf
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??
# Run image with specific name
docker run --name "$container" "$image" #??


