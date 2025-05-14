#!/bin/bash
#
# 'import' 0x_param.conf
source 03b_param.conf #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
sleep 1
# List images
docker image ls #??
# Run image with and name it (see variable)
docker run -itd --rm --name "$container" "$image" #??
sleep 1
# Show running containers
docker ps #??
sleep 1
# execute container
docker exec -it "$container" sh -c "cat /tmp/hello.txt"
# Navigate to /tmp and check if hello.txt is present
# show the content of hello.txt with cat

