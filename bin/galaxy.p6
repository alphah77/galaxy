#!/usr/bin/env perl6
use lib <lib>;
use Test;
use Universe;

#my %physics = LawCmd.create(@*ARGS.Str);
#my %physics-cnf = LawCnf.create('bin/laws');
#say %physics.perl;

my $u = Universe.new;
say $u.laws.perl;

$u.create;
say $u.alien.laws<command>;
say $u.galaxy.gravity.laws;
.name.say for $u.nebula:
