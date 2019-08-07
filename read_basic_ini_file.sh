#!/bin/bash

# Program: read_basic_ini_file.sh
# Purpose: Basic Windows-style .ini file parser (without sections) sample
# Env: bash
# Author: Jmaes Briggs, 2019
# Licence: MIT
# Date: 2019 08 05
# Note: non-trivial example of file handling and parsing for you to customize

set +e

# see trim() in:
# https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
trim() {
   local var="$*"
   # remove leading whitespace characters
   var="${var#"${var%%[![:space:]]*}"}"
   # remove trailing whitespace characters
   var="${var%"${var##*[![:space:]]}"}"   
   echo -n "$var"
}

read_basic_ini_file() {
   pattern="^[#\[]"
   while IFS="=" read -ra line; do
       key=$(trim "${line[0]}")
       value=$(trim "${line[1]}")
       if [[ "$key" != "" && ! "$key" =~ $pattern ]]; then
          echo "$key, $value"
       fi
   done < "$1"
}

read_basic_ini_file "animals.txt"

set -e
