#!/usr/bin/env perl6

use lib <uni>;
use Alien;
use Phy;

my $alien = Alien.new;

my $physics = Phy.new: cmd => $alien.cmd, cnf => $alien.cnf;

say $physics.create;
