#!/bin/bash

# This script sync folders to repositories at GitHub using parameters - FOLDER & USER.

# This bash script name
ME=`basename $0`

# Folder
FOLDER=$1
# GitHub User
USER=$2

if [ -z "$USER" ] || [ -z "$FOLDER" ];
then
echo
echo "Usage: sh "$ME" <FOLDER> <USER>"
echo "example: sh "$ME" /my_folder ET-CS"
echo
echo "returns GitHub JSON output"
exit
fi;

for SUBFOLDER in $(find $FOLDER -maxdepth 1 -type d)
do
    if [ ! $SUBFOLDER = $FOLDER ]; then
        echo Creating $SUBFOLDER repo....
        REPO=${SUBFOLDER##*/}
        sh sync-folder-to-github.sh $SUBFOLDER $USER $REPO
    fi;
done
exit

