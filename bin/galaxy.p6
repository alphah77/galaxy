#!/usr/bin/env perl6
use lib <lib>;
use Universe;

my $u = Universe.new;

#say $u.physics.perl;
use nqp;
use Data::Dump;
#my %physics = LawCmd.create(@*ARGS.Str);
#my %physics-cnf = LawCnf.create('bin/laws');
#say %physics.perl;

my %hash = $u.physics;
print-keys %hash;
sub print-keys (%hash, Int:D $indent = 0) {
    say "\nLevel $indent elems: ", %hash.keys.elems;
    for %hash.keys {
        my $thing = %hash{$_};
        if !nqp::defined($thing) {
            print ' ' x $indent;
            say "$_ => ", nqp::what($thing)
            #NQPMu";
        }
        else {
            print ' ' x $indent ~ "$_ => ";
            if $thing ~~ Hash {
                print-keys $thing, $indent + 1;
            }
            else {
                say try { %hash{$_}.WHICH }
            }
        }
    }
}
say $u.galaxy.laws.perl;
say $u.alien.laws.perl;
