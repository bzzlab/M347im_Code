#!/bin/bash
#
### Steps to 02_dockerfile
PARAMS='a02-params.sh'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS

# stop container
docker container stop "$container"
docker ps -a

