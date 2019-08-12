#!/usr/bin/env php
<?php
// Program: read_basic_ini_file.php
// Purpose: Basic Windows-style .ini file parser (without sections) sample
// Env: PHP
// Author: James Briggs, 2019
// Licence: MIT
// Date: 2019 08 05
// Note: non-trivial example of file handling and parsing for you to customize

function read_basic_ini_file($filepath) {
   $h = Array();
   $f = fopen($filepath, "r") or die("error: unable to open file!");

   while(!feof($f)) {
      $line = trim(fgets($f));
      if (!strlen($line) or
         preg_match("/^;|#/", $line) or
         preg_match("/^\[[^\]]*\]$/", $line)) {
         continue;
      }
      $tokens = explode("=", $line, 2);
      $tokens[1] = isset($tokens[1]) ? trim($tokens[1]) : null;
      $h[trim($tokens[0])] = $tokens[1];
   }
   fclose($f);
   return $h;
}

$h = read_basic_ini_file("config.ini");

ksort($h);
foreach ($h as $key => $value) {
   echo "$key=$value\n";
}
?>
