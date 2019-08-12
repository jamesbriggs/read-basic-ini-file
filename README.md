# read-basic-ini-file

**Description**

Professional-level sample source code in various programming languages for reading text files with error handling, using a basic [.ini file format](https://en.wikipedia.org/wiki/INI_file) as an example.

* Go - read_basic_ini_file.go
* Perl5 - read_basic_ini_file.pl
* PHP - read_basic_ini_file.php
* Python 2.5+ and 3 - read_basic_ini_file.py
* Ruby - read_basic_ini_file.rb
* Bash4 - read_basic_ini_file.sh

**Usage**

1. Pick your preferred sample file according to language
2. Run it to see it in action
3. Then copy and paste the source code and customize for your purpose.

**Demo .ini Parsing Rules**

Although simple .ini parsing is done for demonstration purposes, you
should use an official .ini parsing module if required.

The simple parsing rules from input lines to key-value pairs are:

* empty lines are skipped
* lines starting with comments (; or #) are skipped
* [section] lines are skipped
* values containing extra = signs are allowed
* multi-line settings are not recognized
* substitutions are not performed
* key and value strings are trimmed on left-hand and right-hand sides
* missing value default is empty string
* missing newline at EOF should not matter
* return a hash (aka dict or associative array) or hash handle of key-value pairs if possible

**Sample config.ini provided for testing**

```
<blank line>
; comment
# comment
[section]
camel=2
dog=4
 cat=3
ant = 1000
llama = 2 = a
aardvark
```

**Example**

```
$ ./read_basic_ini_file.pl

aardvark=
ant=1000
camel=2
cat=3
dog=4
llama=2 = a
```

**FAQ**

Q: Why?

A: It's not as simple as you might think to write reliable, portable code for file processing, especially in an unfamiliar programming language. As complete, tested sample programs, these are more useful than typical online programming answers.

**Copyright**

James Briggs, USA. 2019.

**License**

MIT License.
