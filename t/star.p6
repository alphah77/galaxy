#!/usr/bin/env perl6


use lib <lib>;
#use Grammar::Tracer;
use Galaxy::Physics::Object::Star;
use Galaxy::Physics::Object::Star::Actions;

use Test;

my @tests = (
#	[ 'string to test', matches?, message ]
	[ '',                                     False, '' ],
	[ '.',                                    False, '.' ],
	[ '-',                                    False, '-' ],
	[ 'rakudo.',                              False, 'rakudo.' ],
	[ 'rakudo-',                              False, 'rakudo-' ],
	[ 'rakudo-star.',                         False, 'rakudo-star.' ],
	[ 'rakudo-star-',                         False, 'rakudo-star-' ],
	[ 'rakudo-star---',                       False, 'rakudo-star---' ],
	[ 'rakudo',                               True,  'rakudo' ],
	[ 'rakudo-star-koko-0.0.7',               True,  'rakudo-star-koko-0.0.7' ],
	[ 'rakudo-star-0.0.7-x86_64',             True,  'rakudo-star-0.0.7-x86_64' ],
	[ 'rakudo-star-0.0.7-x86_64-1',           True,  'rakudo-star-0.0.7-x86_64-1' ],
	[ 'rakudo-star-0.0.7-x86_64-h-1',         True,  'rakudo-star-0.0.7-x86_64-h-1' ],
	[ 'rakudo-star-0.0.7-x86_64-hythm-1.xyz', True,  'rakudo-star-0.0.7-x86_64-h-1.xyz' ],
);

grammar Star does Galaxy::Physics::Object::Star { }

my $rule = 'star';

for @tests -> [$string, $should-parse, $message] {
	my $actions = Galaxy::Physics::Object::Star::Actions.new;
	my $m = Star.parse($string, :$actions, :$rule);
	#say $m;
	#die unless $m;	
  my $result = ?$m;
  $result = !$result if $should-parse === False;
  ok $result, $message;
	say $actions.star-laws;
}
