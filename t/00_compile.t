use strict;
use Test::More;

use_ok $_ for qw(
    ARIB::ProgramGenre
    ARIB::ProgramGenre::ChildGenre
    ARIB::ProgramGenre::ChildGenre::Anime
    ARIB::ProgramGenre::ChildGenre::Documentary
    ARIB::ProgramGenre::ChildGenre::Drama
    ARIB::ProgramGenre::ChildGenre::Expansion
    ARIB::ProgramGenre::ChildGenre::Hobby
    ARIB::ProgramGenre::ChildGenre::Info
    ARIB::ProgramGenre::ChildGenre::Movie
    ARIB::ProgramGenre::ChildGenre::Music
    ARIB::ProgramGenre::ChildGenre::News
    ARIB::ProgramGenre::ChildGenre::Other
    ARIB::ProgramGenre::ChildGenre::Reserve
    ARIB::ProgramGenre::ChildGenre::Sport
    ARIB::ProgramGenre::ChildGenre::Theater
    ARIB::ProgramGenre::ChildGenre::Variety
    ARIB::ProgramGenre::ChildGenre::Welfare
);

done_testing;

