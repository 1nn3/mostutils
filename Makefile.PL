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
    AUTHOR       => q{nobody <nobody>},

    MAN1PODS => {
        'pod/cwd.pod'          => '$(INST_MAN1DIR)/cwd.1',
        'pod/d.pod'            => '$(INST_MAN1DIR)/d.1',
        'pod/domain2ip.pod'    => '$(INST_MAN1DIR)/domain2ip.1',
        'pod/hist.pod'         => '$(INST_MAN1DIR)/hist.1',
        'pod/html-decode.pod'  => '$(INST_MAN1DIR)/html-decode.1',
        'pod/html-encode.pod'  => '$(INST_MAN1DIR)/html-encode.1',
        'pod/ip2domain.pod'    => '$(INST_MAN1DIR)/ip2domain.1',
        'pod/lc.pod'           => '$(INST_MAN1DIR)/lc.1',
        'pod/lineratio.pod'    => '$(INST_MAN1DIR)/lineratio.1',
        'pod/ltrim.pod'        => '$(INST_MAN1DIR)/ltrim.1',
        'pod/mute-cronjob.pod' => '$(INST_MAN1DIR)/mute-cronjob.1',
        'pod/mute.pod'         => '$(INST_MAN1DIR)/mute.1',
        'pod/query.pod'        => '$(INST_MAN1DIR)/query.1',
        'pod/rtrim.pod'        => '$(INST_MAN1DIR)/rtrim.1',
        'pod/strim.pod'        => '$(INST_MAN1DIR)/strim.1',
        'pod/trim.pod'         => '$(INST_MAN1DIR)/trim.1',
        'pod/tz.pod'           => '$(INST_MAN1DIR)/tz.1',
        'pod/uc.pod'           => '$(INST_MAN1DIR)/uc.1',
        'pod/unmute.pod'       => '$(INST_MAN1DIR)/unmute.1',
        'pod/unsortuniq.pod'   => '$(INST_MAN1DIR)/unsortuniq.1',
        'pod/uri-decode.pod'   => '$(INST_MAN1DIR)/uri-decode.1',
        'pod/uri-encode.pod'   => '$(INST_MAN1DIR)/uri-encode.1',
        'pod/voldown.pod'      => '$(INST_MAN1DIR)/voldown.1',
        'pod/volreset.pod'     => '$(INST_MAN1DIR)/volreset.1',
        'pod/volup.pod'        => '$(INST_MAN1DIR)/volup.1',
    },
    MAN3PODS => {
        'lib/App/Mostutils.pm' => '$(INST_MAN3DIR)/Mostutils.3pm',
    },
    PM => {
        'bin/cwd.pl'            => '$(INST_BIN)/cwd',
        'bin/d.bash'            => '$(INST_BIN)/d',
        'bin/domain2ip.pl'      => '$(INST_BIN)/domain2ip',
        'bin/hist.bash'         => '$(INST_BIN)/hist',
        'bin/html-decode.pl'    => '$(INST_BIN)/html-decode',
        'bin/html-encode.pl'    => '$(INST_BIN)/html-encode',
        'bin/ip2domain.pl'      => '$(INST_BIN)/ip2domain',
        'bin/lc.pl'             => '$(INST_BIN)/lc',
        'bin/lineratio.awk'     => '$(INST_BIN)/lineratio',
        'bin/ltrim.pl'          => '$(INST_BIN)/ltrim',
        'bin/mute.bash'         => '$(INST_BIN)/mute',
        'bin/mute-cronjob.bash' => '$(INST_BIN)/mute-cronjob',
        'bin/query.pl'          => '$(INST_BIN)/query',
        'bin/rtrim.pl'          => '$(INST_BIN)/rtrim',
        'bin/smiley8.pl'        => '$(INST_BIN)/smiley8',
        'bin/smiley.pl'         => '$(INST_BIN)/smiley',
        'bin/strim.pl'          => '$(INST_BIN)/strim',
        'bin/trim.pl'           => '$(INST_BIN)/trim',
        'bin/tz.bash'           => '$(INST_BIN)/tz',
        'bin/uc.pl'             => '$(INST_BIN)/uc',
        'bin/unmute.bash'       => '$(INST_BIN)/unmute',
        'bin/unsortuniq.awk'    => '$(INST_BIN)/unsortuniq',
        'bin/uri-decode.pl'     => '$(INST_BIN)/uri-decode',
        'bin/uri-encode.pl'     => '$(INST_BIN)/uri-encode',
        'bin/voldown.bash'      => '$(INST_BIN)/voldown',
        'bin/volreset.bash'     => '$(INST_BIN)/volreset',
        'bin/volup.bash'        => '$(INST_BIN)/volup',

        'lib/App/Mostutils.pm' => '$(INST_LIBDIR)/Mostutils.pm',
    },
    PREREQ_PM => {

        #'Cwd::utf8'      => undef,

        'Cwd'            => undef,
        'Data::Dumper'   => undef,
        'Fcntl'          => undef,
        'File::Basename' => undef,
        'Getopt::Long'   => undef,
        'Getopt::Std'    => undef,
        'HTML::Entities' => undef,
        'Text::Trim'     => undef,
        'Tie::File'      => undef,
        'URI::Escape'    => undef,
    }
);

package MY;
use File::ShareDir::Install qw(postamble);

