#!/bin/bash
#
# 'import' 0x_param.conf
source 03a_param.conf #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??

