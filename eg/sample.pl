#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../lib";

use ARIB::ProgramGenre;

print ARIB::ProgramGenre::get_name(0,0);
use Data::Dumper; warn Dumper(ARIB::ProgramGenre::get_id('時代劇'));

# print ARIB::ProgramGenre::ChildGenre::News->new->get_child_genre_name(1);
# print ARIB::ProgramGenre::ChildGenre::News->new->get_child_genre_id('天気');
