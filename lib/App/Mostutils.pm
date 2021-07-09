use diagnostics;
use strict;
use utf8;
use warnings;
use locale;

use Data::Dumper;
use Fcntl;
use File::Basename;
use File::HomeDir;
use File::Path;
use File::ShareDir;
use File::Spec;
use Tie::File;

our $NAME    = 'App-Mostutils';
our $VERSION = '1.00';

# ~/.config/perl
our $CONFIG_DIR = File::HomeDir->my_dist_config( $NAME, { create => 1 } );

# ~/.local/share/perl
our $DIST_DIR = File::HomeDir->my_dist_data( $NAME, { create => 1 } );

# File::ShareDir::dist_dir works only if directory is installed
# /usr/share/perl
our $DISTDIR = File::ShareDir::dist_dir($NAME);

package App::Mostutils {

    sub get_file {
        my ($rel_file) = @_;
        my @dirs = ( $CONFIG_DIR, $DIST_DIR, $DISTDIR );

        for (@dirs) {
            File::Path::make_path($_);
            my $abs_file = File::Spec->catfile( $_, $rel_file );
            return $abs_file if ( -r $abs_file );
        }

        my $abs_file = File::Spec->catfile( get_file('.'), $rel_file );
        File::Path::make_path( File::Basename::dirname($abs_file) );

        # Das Verz. exsitiert nun und somit kann $rel_file ggf. angelegt werden
        return ($abs_file);
    }

    sub file2list {
        my ( $list_ref, $file, $mode ) = @_;
        mkdir File::Basename::dirname($file);    # if $mode = Fcntl::O_CREAT;
        return tie @{$list_ref}, 'Tie::File', $file, mode => $mode;
    }

    1;
};
