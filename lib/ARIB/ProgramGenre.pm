package ARIB::ProgramGenre;
use 5.008005;
use strict;
use warnings;
use utf8;
use parent qw/Exporter/;
use Carp;
use Encode qw/encode_utf8/;

our $VERSION   = "0.01";
our @EXPORT_OK = qw/get_genre_name get_genre_id get_parent_genre_name get_parent_genre_id/;

use constant PARENT_GENRES => [
    {genre => 'News',        name => 'ニュース／報道'},         # 0x0
    {genre => 'Sport',       name => 'スポーツ'},               # 0x1
    {genre => 'Info',        name => '情報／ワイドショー'},     # 0x2
    {genre => 'Drama',       name => 'ドラマ'},                 # 0x3
    {genre => 'Music',       name => '音楽'},                   # 0x4
    {genre => 'Variety',     name => 'バラエティ'},             # 0x5
    {genre => 'Movie',       name => '映画'},                   # 0x6
    {genre => 'Anime',       name => 'アニメ／特撮'},           # 0x7
    {genre => 'Documentary', name => 'ドキュメンタリー／教養'}, # 0x8
    {genre => 'Theater',     name => '劇場／公演'},             # 0x9
    {genre => 'Hobby',       name => '趣味／教育'},             # 0xA
    {genre => 'Welfare',     name => '福祉'},                   # 0xB
    {genre => 'Reserve',     name => '予備'},                   # 0xC
    {genre => 'Reserve',     name => '予備'},                   # 0xD
    {genre => 'Expansion',   name => '拡張'},                   # 0xE
    {genre => 'Other',       name => 'その他'},                 # 0xF
];

sub get_genre_name {
    my ($parent_genre_id, $child_genre_id) = @_;

    if ((not defined $parent_genre_id) || (not defined $child_genre_id)) {
        croak "Parent genre ID and Child genre ID are required";
    }

    my $parent_genre      = _get_parent_genre($parent_genre_id);
    my $child_genre_class = __PACKAGE__ . '::ChildGenre::' . $parent_genre->{genre};
    eval "require $child_genre_class"; ## no critic
    return $child_genre_class->new->get_child_genre_name($child_genre_id);
}

sub get_genre_id {
    my ($name) = @_;
    croak "Genre name is required" unless $name;

    my $child_genre_id;
    my $parent_genre_id = 0;
    for my $parent_genre (@{+PARENT_GENRES}) {
        my $child_genre_class = __PACKAGE__ . '::ChildGenre::' . $parent_genre->{genre};
        eval "require $child_genre_class"; ## no critic
        eval { $child_genre_id = $child_genre_class->new->get_child_genre_id($name) };
        last if defined $child_genre_id;
        $parent_genre_id++;
    }

    if (not defined $child_genre_id) {
        croak encode_utf8("No such a genre: $name");
    }

    return [$parent_genre_id, $child_genre_id];
}

sub get_parent_genre_name {
    my ($id) = @_;

    return encode_utf8(_get_parent_genre($id)->{name});
}

sub get_parent_genre_id {
    my ($name) = @_;

    croak "Parent genre name is required" unless $name;

    eval { $name = decode_utf8($name) };

    my $id = 0;
    for my $genre (@{+PARENT_GENRES}) {
        return $id if $genre->{name} eq $name;
        $id++;
    }

    croak encode_utf8("No such a parent genre $name");
}

sub _get_parent_genre {
    my ($id) = @_;

    croak "Parent genre ID is required" if not defined $id;

    my $genre = PARENT_GENRES->[$id];
    if (!$genre || (not defined $genre->{name})) {
        croak "No such a parent genre (ID: $id)";
    }
    return $genre;
}

1;
__END__

=encoding utf-8

=head1 NAME

ARIB::ProgramGenre - It's new $module

=head1 SYNOPSIS

    use ARIB::ProgramGenre;

=head1 DESCRIPTION

ARIB::ProgramGenre is ...

=head1 LICENSE

Copyright (C) moznion.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

moznion E<lt>moznion@gmail.comE<gt>

=cut

