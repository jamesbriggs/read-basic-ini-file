#!/bin/bash

# Program: make_go.sh
# Purpose: build read_basic_ini_file.go
# Copyright: James Briggs USA 2019
# Env: bash
# Returns: exit status is non-zero on failure
# Usage: ./make_go.sh
# Note:

app=read_basic_ini_file

rm -f $app

go build $app.go && ./$app
echo $?

