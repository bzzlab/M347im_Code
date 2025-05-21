#!/bin/bash
#
# Import parameter
source 01_Welcome.conf #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" .  #??
# List images
docker image ls  #??
# Run image with specific name
docker run --rm --name "$container" "$image"  #??
