#!/usr/bin/env perl6
use lib <lib>;
use Physics;
use Alien;
use Galaxy;

my %physics = LawCmd.create(@*ARGS.Str);
#my %physics-cnf = LawCnf.create('bin/laws');
say %physics.perl;
#say %physics-cnf.perl;
#say $laws<realm>[0]<block><law>[1]<key>:

#my $universe = Universe.new(name => 'universe', physics => @*ARGS);
#my $universe = Universe.new(name => 'universe', laws => @*ARGS);
#my $physics = Physics.new(laws => @*ARGS);
#say $physics.physics;
#$physics.define;
#say $physics.phyhash; 
#say $physics.phyhash<Galaxy><core>;
#say $physics.phyhash<Nebula><Helix>;
#$universe.physics(@*ARGS);

#say %physics<power>.WHAT;
#say %physics<power>;
