#!/bin/bash
#
### Steps to 02_dockerfile
PARAMS='a02-params.sh'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS

# Remove container
id=$(docker ps -a |tail -n +2|xargs|cut -d' ' -f15)
docker rm "$id"
# Remove image
docker rmi "$image":latest
# check removal
docker image ls |grep "$image"

