#!/bin/bash 
# Running Jenkins deployment

source modules/general.sh
source modules/jenkins-blueoccean.sh

while [ "$#" -gt 0 ]
do
  case "$1" in 
    -r)
      intro
      run_main
      ;;
    -d)
      destroyAll
      ;;
    -c)
      checkContainer 
      ;;
    -i)
      aptInstallDepency
      ;;
    -y) 
      yumInstallDependency
      ;;
 test) 
      bats jenkins-blueoccean.bats;
      ;;
    *)
      echo "Error: Invalid option"
      help
      exit 1
      ;;
  esac 
  shift
done
