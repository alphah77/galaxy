#!/usr/bin/env perl6
use lib <lib>;
use Universe;

my $u = Universe.new;

say $u.physics.perl;
say $u.galaxy.laws.perl;
say $u.alien.laws.perl;
