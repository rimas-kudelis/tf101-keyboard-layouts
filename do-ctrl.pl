#!/usr/bin/perl
use strict;
use warnings;
use 5.012;
use File::Slurp 'edit_file';

edit_file {
    s{
(?<pre> key \s+ (?<key> [A-Z] ) \s+ \{
.*?)
^\s+ alt,\ ctrl,\ meta:\s+none$
(?<post> .*? \})
}{
"$+{pre}    ctrl:                               '\\x".sprintf('%02x',ord($+{key})-ord('@'))."'
    alt, meta:                          none$+{post}"
}smxge;
} shift;
