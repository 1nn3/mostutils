#!/usr/bin/env perl
# strip trim

use diagnostics;
use strict;
use utf8;
use warnings;
use locale;

# using say, because we want on all platforms the correct newline
use feature 'say';

use Text::Trim;

while (<STDIN>) {
    chomp;

    ltrim;
    rtrim;

    s/[[:space:]]+/ /g;
    s/[^[:print:]]+//g;

    say;
}

