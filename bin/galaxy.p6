#!/usr/bin/env perl6
use lib <lib>;
use Universe;
use Alien;

my $universe = Universe.new;

my $alien = Alien.new;

$universe.action;

