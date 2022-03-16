#!/usr/bin/zsh
re='^[0-9]+$'
if [ -z $1 ]
then
  printf "Required 1 for on or 0 for off as input argument.\n"
  exit 0
fi
device="$(xinput | grep -i touchpad | awk '{print $6}' | grep -o '[0-9]\+')"
xinput set-prop $device "Device Enabled" $1
if [ $1 -eq 1 ]
then
  printf "Touchpad enabled.\n"
elif [ $1 -eq 0 ]
then
  printf "Touchpad disabled.\n"
fi
exit 0
