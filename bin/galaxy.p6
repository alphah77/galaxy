#!/usr/bin/env perl6
use lib <lib>;
use Universe;

#my %physics = LawCmd.create(@*ARGS.Str);
#my %physics-cnf = LawCnf.create('bin/laws');
#say %physics.perl;

my $u = Universe.new;
say $u.physics;
say $u.galaxy.laws.perl;
say $u.alien.laws.perl;
