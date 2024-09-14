#!/bin/bash


directory="${HOME}/green/VBoxBackup"
if [ -z "$1" ]
then
  :
else
  directory="${1}"
fi
mkdir -p $directory

# cut will split a string using the -d (delimiter) argument.
# VBoxManage list vms will output:
#
# "Virtual Machine Name" {identifier}
#
# The first cut is cutting the string at the "{" and taking the SECOND field (-f2)
# The second cut is cutting the string at the "}" and taking the FIRST field (-f1)
# This allows us to expose only the VM identifier, and allows us to pass it as an
# argument to the vboxmanage command to back up that VM.
list=$(vboxmanage list vms | cut -d"{" -f2 | cut -d"}" -f1)
while IFS= read -r line; do
  rm -f "${directory}/${line}.ova"
  vboxmanage export "${line}" -o "${directory}/${line}.ova"
done <<< "$list"

printf "%s\n" "${ids[@]}"

# while IFS= read -r test; do
#   echo $test
# done


# list=$(vboxmanage list vms | cut -d"{" -f2 | cut -d"}" -f1)
# while IFS= read -r line; do
#   # rm -f "${directory}/${line}.ova"
#   # vboxmanage export "${line}" -o "${directory}/${line}.ova"
#   echo "${directory}/${line}.ova"
# done <<< "$list"
