#!/usr/bin/env perl

use diagnostics;
use strict;
use utf8;
use warnings;
use locale;

use feature 'say';

use URI::Escape;

while (<STDIN>) {
    chomp;
    print uri_unescape($_);
}

