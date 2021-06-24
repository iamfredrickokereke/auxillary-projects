#!/bin/bash
ARGS="${@}"
clear;
while(true); do
  clear
  OUTPUT=`$ARGS`
  echo -e "${OUTPUT[@]}"
  sleep 1
done


# sample code usage - # watch.sh kubectl get pods

# script must be in the same path 
