#!/bin/bash
#
LIB='../../bin/aws.conf'
if [ ! -f $LIB ]; then  #??
    echo $LIB does not exist! #??
    exit 2  #??
  fi  #??
source $LIB

# Set variable for target directory where the app should be stored
DIR="~/01_sol" #??

scp -i ${PRIVATE_KEY} 00a_convert.sh ${DEST}:${DIR} #??