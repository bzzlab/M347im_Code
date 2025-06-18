#!/bin/bash
#
# 'import' 0x_param.conf
PARAMS='01_params.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??

# 'import' teardown base script
source td-base.sh 1  #??