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

for my $address (@ARGV) {
    my $hostname = gethostbyaddr( inet_aton($address), AF_INET );

    if ( !$hostname ) {
        warn "Can't resolve $address\n";
        next;
    }

    say $hostname;
}

