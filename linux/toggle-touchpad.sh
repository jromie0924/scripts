#!/usr/bin/zsh

if [ -z $1 ]
then
  printf "Required 1 for on or 0 for off as input argument.\n"
else
  device="$(xinput | grep -i touchpad | awk '{print $6}' | grep -o '[0-9]\+')"
  xinput set-prop $device "Device Enabled" $1
fi
exit 0
