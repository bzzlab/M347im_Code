#!/bin/bash
#

# jq is the safest and cleanest way to build JSON in shell scripts.
# This avoids issues with escaping quotes and special characters in user input.
# It ensures the JSON is valid, even if the user enters special characters or spaces.
function install_package() {
  local CMD=$1
  echo "Checking ${CMD} installation ..."
  if command -v ${CMD} &> /dev/null; then
      VER=$(${CMD} --version)
      echo "${CMD} version ${VER} is installed!"
  else
      echo "${CMD} installation not found. Installing now ..."
      sudo apt  install ${CMD}
  fi
}

function next_step() {  #??
    printf "\n\n" #??
    read -p "Enter any key to continue" #??
} #??

# set HOST variable with IP-address and port
HOST="http://127.0.0.1:5000" #??
# start with a loop and quit it with a character entered by the user
while true; do #??
  # Clear screen
  clear #??
  # Ask user for action and read it
  read -p "Test app ([p]ost, [l]ist, [r]emove task, [i]nstall packages, [q]uit): " action  #??
  action=$(echo $action | tr '[A-Z]' '[a-z]') #??
  # show selected action
  echo "Your selection : $action" #??
  # case/switch
  case $action in  #??
  p | post)
    read -p "Set title: " title #??
    read -p "Set description: " desc #??
    printf "\n---------\nTask added\n---------\n" #??
    printf "Post task %s, %s\n\n" "${title}" "${desc}" #??

    curl -X POST "${HOST}/task" \  #??
         -H "Content-Type: application/json" \  #??
         -d "$(jq -n --arg title "$title" --arg desc "$desc" \  #??
             '{title: $title, description: $desc}')"  #??
    next_step #??
  ;; #??
  [l] | list)
    printf "\n---------\nShow all tasks\n---------\n" #??
    curl ${HOST}/tasks #??
    next_step #??
  ;; #??
  [r] | remove)
    printf "\n---------\nRemove task\n---------\n" #??
    curl ${HOST}/tasks #??
    read -p "Provide id: " id #??
    curl -X DELETE ${HOST}/task/${id} #??
    next_step #??
  ;; #??
  [i] | install)
    install_package "jq" #??
    next_step #??
  ;; #??
  [q] | quit )
    echo "Exiting loop." #??
    break #??
  ;; #??
  *)
    echo "Incorrect action entered!" #??
    ;; #??
  esac  #??
done  #??