#!/usr/bin/env perl

use diagnostics;
use strict;
use utf8;
use warnings;
use locale;

use feature say;

use HTML::Entities;

while (<STDIN>) {
    chomp;
    say encode_entities($_);
}

