#!/usr/bin/env perl
# change working directory

use diagnostics;
use strict;
use utf8;
use warnings;

use File::Basename;
use Getopt::Std;
use Cwd;

#use Cwd::utf8

our %opts;
getopts( "d:", \%opts ) || die $!;

if ( !$opts{d} ) {

    # Das working directory so ändern,
    # das es auf den Speicherort des Skripts zeigt
    ( undef, $opts{d}, undef ) = fileparse( $ARGV[0] );
}

if ( !-d $opts{d} ) {

    # Kein Verz.
    die "$!: $opts{d}";
}

if ( !Cwd::chdir $opts{d} ) {

    # Fehlgeschlagen
    die "$!: $opts{d}";
}

# Kommandozeile ausführen
exec @ARGV;

