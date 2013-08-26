#!/bin/bash

# This script creates a repository at GitHub using parameters - USER & REPO.

# This bash script name
ME=`basename $0`

# GitHub User
USER=$1
# Name of repo to create
REPO=$2

if [ -z "$USER" ] || [ -z "$REPO" ];
then
echo
echo "Usage: sh "$ME" <USER> <REPO>"
echo "example: sh "$ME" ET-CS new-repo"
echo
echo "returns GitHub JSON output"
exit
fi;

# Json to pass to github api
JSON='{"name":"'$REPO'"}'

# Pass json to github
curl -u $USER https://api.github.com/user/repos -d $JSON
