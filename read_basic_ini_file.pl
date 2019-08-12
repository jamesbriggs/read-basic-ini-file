#!/usr/bin/perl

# Program: read_basic_ini_file.pl
# Purpose: Basic Windows-style .ini file parser (without sections) sample
# Env: Perl5
# Author: James Briggs, 2019
# Licence: MIT
# Date: 2019 08 05
# Note: non-trivial example of file handling and parsing for you to customize

use strict;
use diagnostics;

use String::Util qw/trim/;
use Data::Dumper;

   my $DEBUG = 0;

   my $filepath = "config.ini";
   my $h = read_basic_ini_file($filepath);

   print Dumper($h) if $DEBUG; # show nested hash data structure

   # Do not use each:
   # http://blogs.perl.org/users/rurban/2014/04/do-not-use-each.html
   for my $k (sort keys %{$h}) {
      no warnings 'uninitialized';
      print "$k=$h->{$k}\n"; # use arrow notation to dereference hashref
   }

sub read_basic_ini_file {
   my ($filepath) = @_;

   open X, "<$filepath" or die "error: $!";

   my %h; # hash

   while (<X>) {
      print if $DEBUG;
      chomp;               # remove trailing newline for this OS

      next if /^$/ or      # skip blank line
              /^;|#/ or      # skip line starting with a comment character
              /^\[[^\]]*\]$/;  # skip section name like [section]

      my ($key, $value) = split(/=/, $_, 2);

      $h{trim($key)} = trim($value);
      print "$key=$value\n" if $DEBUG;
   }

   close X;

   return \%h; # reference to hash
}

