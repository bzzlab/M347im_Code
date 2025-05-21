#!/bin/bash
#
# Import parameter
source 01_Welcome.conf #??
# Remove image
docker rmi "$image":latest  #??
# check removal
docker image ls |grep "$image"  #??

