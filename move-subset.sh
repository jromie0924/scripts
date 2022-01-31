#!/bin/bash

if [ -z "$1" ]
then
    printf "Required number of files to move.\n"
    exit 1
fi
if [ -z "$2" ]
then
    printf "Required source directory.\n"
    exit 1
fi
if [ -z "$3" ]
then
    printf "Required target directory.\n"
    exit 1
fi

numFiles="$1"
sourceDirectory="$2"
targetDirectory="$3"

cd "$sourceDirectory"
mv `ls | head -$numFiles` "$targetDirectory"

printf "Moved $numFiles from $sourceDirectory to $targetDirectory.\n\n"
exit 0