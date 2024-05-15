#!/bin/bash
#
#source 01_param.conf
source 02_param.conf

if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "(1): create container, (2): remove container" \
    "Exit script."
  exit 1
fi


case $1 in
1)
  if [ ! -f ${file} ]
  then
    printf "Dockerfile %s does not exist.\nExit script!" ${file}
  fi
  printf "Start building %s ..." ${file}
  docker build -t ${image} -f ${file} .
  sleep 1
  docker image ls
  sleep 2
  docker run -itd --rm --name ${container} ${image}
  sleep 1
  docker exec -it ${container} bash
  ;;
2)
  #remove container
  docker stop ${container}
  docker rmi ${image}
  docker image ls | grep ${image}
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

