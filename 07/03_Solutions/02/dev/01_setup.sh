#!/bin/bash
#
### Steps to build and run 0x_dockerfile
PARAMS='01_params.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??

# Run the Docker container with auto-restart policy
docker run -d --name "$container" -p 5000:5000 \
  --restart always "$image" #??


