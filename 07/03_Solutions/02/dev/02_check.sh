#!/bin/bash
#
# set port
PORT=3000
# Clear screen
clear
# Ask user for action and read it
read -p "Check app (container [o]utside, [s]hutdown app, [w]atch process): " action
action=$(echo $action | tr '[A-Z]' '[a-z]') #??
# show selected action
echo "Your selection : $action" #??
# case/switch
case $action in  #??
o | outside)
printf "\n---------\nCHECK URL\n---------\n" #??
curl http://localhost:${PORT} #??
printf "\n\n"
;;
[s] | shutdown)
printf "\n---------\nshutdown app\n---------\n" #??
curl http://localhost:${PORT}/shutdown #??
printf "\n\n"
;;
w | watch)
printf "\n---------\nWATCH RUNNING CONTAINER\n Stop with Ctrl-C\n---------\n" #??
watch docker ps #??
printf "\n\n"
;;
*)
  echo "Incorrect action entered!"
  ;;  #??
esac  #??