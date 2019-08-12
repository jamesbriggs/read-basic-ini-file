#!/usr/bin/ruby
#
# Purpose: Basic Windows-style .ini file parser (without sections) sample
# Env: Ruby
# Author: James Briggs, 2019
# Licence: MIT
# Date: 2019 08 05
# Note: non-trivial example of file handling and parsing for you to customize

def read_basic_ini_file(filepath)
   h = {}
   f = File.open(filepath, "r")
   f.each_line do |line|
      line = line.chomp
      if line =~ /^$/ or
         line =~ /^;|#/ or
         line =~ /^\[[^\]]*\]$/
         next
      end
      key, value = line.split('=', 2).map(&:strip)
      h[key] = value
   end
   f.close

   return h
end

h = read_basic_ini_file("config.ini")

h.keys.sort.each {|key| puts "#{key}=#{h[key]}" }

