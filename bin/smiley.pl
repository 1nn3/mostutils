#!/usr/bin/env perl

use App::Mostutils;
use Fcntl;

use feature 'say';

my @smileys;
App::Mostutils::file2list( \@smileys, App::Mostutils::get_file("smileys.txt"),
    Fcntl::O_RDONLY );

my $random_smiley = $smileys[ rand @smileys ];

my ( $ascii, $utf8 ) = split( '\t', $random_smiley );

say($ascii);

=pod

=head1 NAME

smiley - Smiley (ASCII version)

=head1 SYNOPSIS

B<smiley>

=head1 DESCRIPTION

Zufälliger Smiley.

=head1 SEE ALSO

L<smiley8(1p)>

=cut

