#!/usr/bin/env perl6

use lib <uni>;
use Galaxy::Alien;
use Galaxy::Phy::Phy;

my $alien = Galaxy::Alien.new;

my $physics = Galaxy::Phy::Phy.new: cmd => $alien.cmd, cnf => $alien.cnf;

say $physics.create;
