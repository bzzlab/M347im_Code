#!/bin/bash
#
PARAMS='params.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS

# Remove container
docker container stop "$container"
# Remove image
docker rmi "$image":latest
# check removal
docker image ls |grep "$image"
