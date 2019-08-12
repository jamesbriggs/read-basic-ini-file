#!/bin/bash

# Program: read_basic_ini_file.sh
# Purpose: Basic Windows-style .ini file parser (without sections) sample
# Env: bash4
# Author: James Briggs, 2019
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
   debug=0
   pattern="^[;#\[]"

   local IFS="="
   while read -r key value; do
       key=$(trim "$key")
       value=$(trim "$value")
       if [[ "$key" != "" && ! "$key" =~ $pattern ]]; then
          if [[ "$debug" -eq 1 ]]; then
             echo "$key, $value"
          fi
          hash["$key"]="$value"
       fi
   done < "$1"
}

declare -A hash
read_basic_ini_file "config.ini"

for i in "${!hash[@]}"; do
   echo "$i, ${hash[$i]}"
done

set -e
