
=pod

=encoding utf8

=head1 NAME

App::Mostutils::Threads

=cut

package App::Mostutils::Threads {

    use POSIX;
    use strict;
    use threads;
    use threads::shared;

=pod

=over

=item loop_threads ($handler_sub, $params)

Threads durchlaufen.

@param \&stop_handler Funktionsreferenze,
@param \%params

	sub stop_handler {;}
	loop_threads(\&stop_handler, {
	    # max_threads maximale Anzahl Threads/Slots
	    max_threads => 8,
	    # Zeit zum abarbeiten von Threads, damit "Slots" frei werden
	    sleep => 3,
	});

No return value.

=back

=cut

    sub loop_threads {

        my ( $handler_sub, $params ) = @_;

        # max_threads maximale Anzahl Threads/Slots
        $params->{max_threads} //= 8;

        # Zeit zum abarbeiten von Threads, damit "Slots" frei werden
        $params->{sleep} //= 3;

        do {

            for (
                ( $params->{max_threads} )
                ? threads->list(threads::joinable)
                : threads->list()
                )
            {
                &{$handler_sub}( $_->join );
            }

            # Keine "Slots" frei; D.h. warten bis Threads abgearbeitet wurden
            # und nochmal loop_threads durchlaufen

        } while ( $params->{max_threads}
            && threads->list >= $params->{max_threads}
            && sleep $params->{sleep} );

    }

=pod

=over

=item loop_last_threads ($handler_sub)

Restliche Threads durchlaufen.

@param \&stop_handler Funktionsreferenze,

No return value.

=back

=cut

    sub loop_last_threads {
        my ($handler_sub) = @_;
        loop_threads( $handler_sub, { max_threads => defined } );
    }

=pod

=over

=item listsplit ($portions, @array)

Teilt eine Liste in N gleiche Portionen auf.

Beachte: Bleibt ein Rest, sind es N+1 Portionen. Ist $portions >
scalar(@array), sind es nur scalar(@array) Portionen.

$portions Anzahl Portionen,
@list Die aufzuteilende Liste

Return Value @list portions as array of arrays

=back

=cut

    sub listsplit {
        my ( $portions, @array ) = @_;

        my @aoa = ();    # array of arrays

        if ( $portions > scalar(@array) ) {
            $portions = scalar(@array);
        }

        if ( $portions <= 0 ) {
            return @aoa;
        }

        my $portion_length = floor( scalar(@array) / $portions );

        if ( $portion_length <= 0 ) {
            return @aoa;
        }

        for ( my $i = 0; $i < $portions; $i++ ) {
            push @aoa, [ splice( @array, 0, $portion_length ) ];
        }

        # rest if any
        my $rest = scalar(@array) % $portions;
        if ($rest) {
            push @aoa, [ splice( @array, 0, $rest ) ];
        }

        return @aoa;
    }

    1;
}
