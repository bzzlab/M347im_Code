#!/bin/bash
#
LIB='../../bin/prep-lib.sh'
if [ ! -f $LIB ]; then      #??
  echo $LIB does not exist! #??
  exit 2                    #??
fi                          #??
source $LIB
#----------------------------------------
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "Prep number n" \
    "Exit script."
  exit 1
fi

CLT="client"
SRV="."
DEST="../00_Demo"
declare -a fileArray=($(ls *_Demo*;ls Docker*))
#fileArray+=('.sh')
case $1 in
0)
  createTargetDir "${DEST}"
  ;;
1)
  for file in "${fileArray[@]}"
  do
      #echo "${DEST}/${file}"
      removeSolution ${file} "${DEST}/${file}"
  done
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
