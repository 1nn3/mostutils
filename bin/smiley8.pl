#!/usr/bin/env perl

use App::Mostutils;
use Fcntl;

use feature 'say';

my @smileys;
App::Mostutils::file2list( \@smileys, App::Mostutils::get_file("smileys.txt"),
    Fcntl::O_RDONLY );

my $random_smiley = $smileys[ rand @smileys ];

my ( $ascii, $utf8 ) = split( '\t', $random_smiley );

say($utf8);

=pod

=head1 NAME

smiley - Smiley (UTF8 version)

=head1 SYNOPSIS

B<smiley>

=head1 DESCRIPTION

Zufälliger Smiley.

=head1 SEE ALSO

L<smiley(1p)>

=cut

