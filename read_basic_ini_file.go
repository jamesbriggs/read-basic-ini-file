// Program: read_basic_ini_file.go
// Purpose: Basic Windows-style .ini file parser (without sections) sample
// Env: Perl5
// Author: James Briggs, 2019
// Licence: MIT
// Date: 2019 08 05
// Note: non-trivial example of file handling and parsing for you to customize

package main

import (
   "bufio"
   "fmt"
   "log"
   "os"
   "regexp"
   "strings"
)

func main() {
   h := read_basic_ini_file("animals.txt")

   for key, value := range h {
       fmt.Println(key, ": ", value)
   }
}

func read_basic_ini_file(filepath string) map[string]string {
   var debug bool = false

   file, err := os.Open(filepath)
   if err != nil {
       log.Fatal(err)
   }
   defer file.Close()

   h := make(map[string]string)

   r, _ := regexp.Compile("^\\[[^\\]]*\\]$")

   scanner := bufio.NewScanner(file)
   var line string
   for scanner.Scan() {
       line = scanner.Text()
       if len(line) == 0 ||
          line[0] == '#' ||
          r.MatchString(line) {
          continue
       }
       if debug {
          fmt.Println(line)
       }
       result := strings.Split(line, "=")
       key, result := result[0], result[1:]
       var value string = ""
       for len(result) > 0 {
          var x string
          x, result = result[0], result[1:]
          if len(value) == 0 {
             value = x
          } else {
             value += "=" + x
          }
       }
       h[strings.TrimSpace(key)] = strings.TrimSpace(value)
   }

   if err := scanner.Err(); err != nil {
      log.Fatal(err)
   }

   return h
}
