#!/usr/bin/python

# Program: read_basic_ini_file.py
# Purpose: Basic Windows-style .ini file parser (without sections) sample
# Env: Python 2.5+ or 3+
# Author: Jmaes Briggs, 2019
# Licence: MIT
# Date: 2019 08 05
# Note: non-trivial example of file handling and parsing for you to customize

import os
import re

def read_basic_ini_file(filepath):
   d = {} # dict (hash)
   debug = 0
   with open(filepath, 'r') as f:
       # for cnt, line in enumerate(f): ### python v3 only
       for line in f:
           if debug:
              print(line)
           line = line.rstrip('\r\n')
           if not len(line) or \
              line[0] == '#' or \
              re.search('^\[.*\]$', line):
              continue
           key, value = line.split('=', 2)
           if debug:
              print(key, value)
           d[key.strip()] = value.strip()
   return d

def main():
   filepath = 'animals.txt'
   h = read_basic_ini_file(filepath)
   for key, value in h.items():
       print(key, value)

if __name__ == "__main__":
   main()
