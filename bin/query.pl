#!/usr/bin/env perl

use diagnostics;
use strict;
use threads;
use utf8;
use warnings;

use Getopt::Long;
use Fcntl;
use Tie::File;

my $keep_query  = undef;
my $max_threads = 8;
my $retry       = 0, my $retry_after = 60 * 60;
GetOptions(
    'keep-query'    => \$keep_query,
    'max-threads=i' => \$max_threads,
    'retry=i'       => \$retry,
    'retry-after=i' => \$retry_after,
) || die $!;

my @fails;
my $file = $ARGV[0];

my @commands;
tie @commands, 'Tie::File', $file,
  mode => Fcntl::O_RDWR
  or die $file,
  ': ', $!;

sub loop_threads {

    my ( $handler_sub, $max_threads ) = @_;

    for (
        ($max_threads)
        ? threads->list(threads::joinable)
        : threads->list()
      )
    {
        &{$handler_sub}( $_->join );
    }

    if ( $max_threads && threads->list >= $max_threads ) {
        sleep 3;
        loop_threads(@_);
    }

}

sub handler_start {
    my ($command) = @_;
    system($command);
    my $ret = $?;
    return ( $ret, $command );
}

sub handler_stop {
    my ( $ret, $command ) = @_;

    if ( $ret != 0 || $keep_query ) {
        warn 'Command "', $command, '" returns: ', $ret, '; keep in query';
        push @fails, $command;
    }
}

for (@commands) {
    threads->create( { "context" => "list" }, \&handler_start, ($_) );
    loop_threads( \&handler_stop, $max_threads );
}

do {
    loop_threads( \&handler_stop );
    @commands = @fails;
} while ( $retry-- && $#commands && sleep($retry_after) );

exit !$#fails;

