#!/usr/bin/env perl

use diagnostics;
use strict;
use threads;
use utf8;
use warnings;

use feature 'say';

use Data::Dumper;
use POSIX;
use Socket;

for my $hostname (@ARGV) {
    my @addresses = gethostbyname($hostname);

    if ( !scalar @addresses ) {
        warn "Can't resolve $hostname\n";
        next;
    }

    @addresses = map { inet_ntoa($_) } @addresses[ 4 .. $#addresses ];

    say join( ' ', @addresses );
}

