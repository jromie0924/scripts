#!/usr/bin/zsh

if [ -z $1 ]
then
  printf "Required 1 for on or 0 for off as input argument.\n"
else
  xinput set-prop 16 "Device Enabled" $1
fi
exit 0