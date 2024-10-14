
=pod

=encoding utf8

=head1 NAME

App::Mostutils

=cut

package App::Mostutils {

    use Data::Dumper;
    use Fcntl;
    use File::Basename;
    use File::HomeDir;
    use File::Path;
    use File::ShareDir;
    use File::Spec;
    use File::Touch;
    use strict;
    use Tie::File;
    use URI;

    our $NAME    = 'App-Mostutils';
    our $VERSION = '1.00';

    # ~/.config/perl
    our $CONFIG_DIR = File::HomeDir->my_dist_config( $NAME, { create => 1 } );

    # ~/.local/share/perl
    our $DIST_DIR = File::HomeDir->my_dist_data( $NAME, { create => 1 } );

    # File::ShareDir::dist_dir works only if directory is installed
    # /usr/share/perl
    our $DISTDIR = File::ShareDir::dist_dir($NAME);

    our @dirs = ( $CONFIG_DIR, $DIST_DIR, $DISTDIR );

=pod

=over

=item get_file($rel_filepath, @dirs)

=back

=cut

    sub get_file {
        my ( $rel_filepath, @dirs ) = @_;

        if ( !scalar @dirs ) {
            die 'No @dirs given!';
        }

        for (@dirs) {
            File::Path::make_path($_);
            my $abs_filepath = File::Spec->catfile( $_, $rel_filepath );
            return $abs_filepath if ( -r $abs_filepath );
        }

        my $abs_filepath
            = File::Spec->catfile( get_file( '.', @dirs ), $rel_filepath );
        File::Path::make_path( File::Basename::dirname($abs_filepath) );
        return $abs_filepath;
    }

=pod

=over

=item file2list($list_ref, $file, $params)

Use Tie::File to load a file linewise into a list.
Directory will be created automaticly.

$list_ref Ref. to list,
$path Path to file,
$param Hash ref. { mode => mode for Tie::File }

	use Fcntl;
	file2list( \@list, "path/to/file", { mode => Fcntl::O_RDWR | Fcntl::O_CREAT } ); # default
	file2list( \@list, "path/to/file", { mode => Fcntl::O_RDONLY } );

Return value is the one from tie; see Tie::File.

=back

=cut

    sub file2list {
        my ( $list_ref, $file, $params ) = @_;
        $params->{mode} //= Fcntl::O_RDWR | Fcntl::O_CREAT;

        if ( ( Fcntl::O_CREAT & $params->{mode} ) == $params->{mode} ) {
            mkdir File::Basename::dirname($file);
        }

        #warn "Loading file: ", $file;fwarn

        return tie @{$list_ref}, 'Tie::File', $file,
            mode       => $params->{mode},
            discipline => ':encoding(UTF-8)';
    }

=pod

=over

=item load_args($path, $argv_ref)

Fill @ARGV from file $path or $path is '-' or @ARGV is emtpy fill it from STDIN.

$path Path to file,
$argv_ref Ref. to @ARGV,

Returns the List.

=back

=cut

    sub load_args {
        my ( $file, $argv_ref ) = @_;

        if ( $file && $file ne '-' ) {
            open( my $fh, '<', $file )
                || die $!, ": ", $file;
            @{$argv_ref} = <$fh>;
        }
        elsif ( $file eq '-' || !@{$argv_ref} ) {
            @{$argv_ref} = <STDIN>;
        }
        chomp( @{$argv_ref} );
        return @{$argv_ref};
    }

    sub load_input_file {
        my ( $file ) = @_;
        if ( $file && $file ne '-' ) {
            open( my $fh, '<', $file )
                || die $!, ": ", $file;
            return $fh;
        }
    }

    1;
};

