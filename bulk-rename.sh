#!/bin/bash

usage="Usage: bulk-rename.sh [EXTENSION] [DIRECTORY]"
if [ -z "$1" ]
then
  printf "Required file extensionn\n\n"
  printf "$usage"
  exit 1
fi
if [ -z "$2" ]
then
  printf "Required directory.\n\n"
  printf "$usage"
  exit 1
fi
cd "$2"
a=1
for i in *.$1; do
  new=$(printf "%05d.$1" "$a")
  mv -i -- "$i" "$new"
  let a=a+1
done
let a=a-1
printf "Renamed $a files sequentially.\n"
exit 0
