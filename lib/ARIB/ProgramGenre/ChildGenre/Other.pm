package ARIB::ProgramGenre::ChildGenre::Other;
use strict;
use warnings;
use utf8;
use parent qw/ARIB::ProgramGenre::ChildGenre/;

sub CHILD_GENRES {
    return [
        '',       # 0x0
        '',       # 0x1
        '',       # 0x2
        '',       # 0x3
        '',       # 0x4
        '',       # 0x5
        '',       # 0x6
        '',       # 0x7
        '',       # 0x8
        '',       # 0x9
        '',       # 0xA
        '',       # 0xB
        '',       # 0xC
        '',       # 0xD
        '',       # 0xE
        'その他', # 0xF
    ];
}

1;

