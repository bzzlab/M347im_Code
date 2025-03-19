#!/bin/bash
#
file="Dockerfile1"
image=m347_i1
container=m347_c1

if [ ! -f ${file} ]
then
  printf "Dockerfile %s is missing!\nExit script!" ${file}
  exit 1
fi
docker build -t ${image} -f ${file} .
sleep 1
docker image ls
sleep 2
clear
docker run -itd --rm --name ${container} ${image}
docker exec -it ${container} bash
