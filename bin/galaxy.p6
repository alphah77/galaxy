#!/usr/bin/env perl6
use lib <lib>;
use Universe;
use Alien;

my $universe = Universe.new;

my $alien = Alien.new(laws => $universe.physics<alien>);

$alien.action(object => "");

