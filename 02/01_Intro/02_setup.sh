#!/bin/bash
#
# 'import' 0x_param.conf
source 02_param.conf #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??
# Run image with and name it (see variable)
docker run -itd --rm --name "$container" -p 8080:80 "$image" #??
# Test container
sleep 5
curl -X GET http://localhost:8080 #??
