#!/usr/bin/env perl

use diagnostics;
use strict;
use utf8;
use warnings;
use locale;

# using say, because we want on all platforms the correct newline
use feature 'say';

use Getopt::Std;
use Text::Trim;

our %opts;
getopts( "lr", \%opts ) || die $!;

while (<STDIN>) {
    chomp;

    ltrim if ( $opts{l} || !$opts{r} );
    rtrim if ( $opts{r} || !$opts{l} );

    say;
}

