use diagnostics;
use strict;
use utf8;
use warnings;

use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share dist => 'dist';

WriteMakefile(
    NAME         => 'App::Mostutils',
    VERSION_FROM => 'lib/App/Mostutils.pm',
    AUTHOR       => q{user <user@host>},
    EXE_FILES    =>
        [ 'bin/21', 'bin/cwd', 'bin/keep', 'bin/redo', 'bin/query', ],
    MAN1PODS => {
        'pod/21.pod'   => '$(INST_MAN1DIR)/21.1p',
        'pod/cwd.pod'  => '$(INST_MAN1DIR)/cwd.1p',
        'pod/keep.pod' => '$(INST_MAN1DIR)/keep.1p',
        'pod/redo.pod' => '$(INST_MAN1DIR)/redo.1p',
    },
    MAN3PODS => {
        'lib/App/Mostutils/Threads.pm' =>
            '$(INST_MAN3DIR)/App::Mostutils::Threads.3pm',
    },
    PREREQ_PM => {
        'use Carp'    => undef,
        'use Cwd'     => undef,
        'use Fcntl'   => undef,
        'use File'    => undef,
        'use Getopt'  => undef,
        'use IO'      => undef,
        'use List'    => undef,
        'use Net'     => undef,
        'use Parse'   => undef,
        'use POSIX'   => undef,
        'use Text'    => undef,
        'use threads' => undef,
        'use Tie'     => undef,
    }
);

package MY;
use File::ShareDir::Install qw(postamble);

