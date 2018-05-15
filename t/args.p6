#!/usr/bin/env perl6

use lib <lib>;
use Galaxy::Physics;
use Galaxy::Physics::Actions;

use Test;

my @tests = (
#	[ 'string to test', matches?, message ]
	[ '',																																				True,		'' ],
	[ 'blackhole cluster',																																				True,		'' ],
	[ 'rakudo-star-0.0.7-x86_64-h-0.xyz',																														True,		'rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'nocolor',																																True,		'nocolor' ],
	[ 'nocolor rakudo-star-0.0.7-x86_64-h-0.xyz',																										True,		'nocolor rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'nocolor core coco rakudo-star-0.0.7-x86_64-h-0.xyz',																					True,		'nocolor core coco rakudod-star' ],
	[ 'nocolor core coco yolo',																									True,		'nocolor core coco yolo' ],
	[ 'nocolor core coco yolo rakudo-star-0.0.7-x86_64-h-0.xyz',																			True,		'nocolor core coco yolo rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'nocolor core coco yolo gravity',																						True,		'nocolor core coco yolo gravity' ],
	[ 'nocolor core coco yolo blackhole rakudo-star-0.0.7-x86_64-h-0.xyz',														True,		'nocolor core coco yolo blackhole rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'gravity origin nono',																True,		'nocolor core coco yolo gravity origin nono' ],
	[ 'nocolor core coco yolo gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz',										True,		'nocolor core coco yolo gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'yolo core coco yolo gravity origin nono cluster',														True,		'yolo core coco yolo gravity origin nono cluster' ],
	[ 'yolo core coco yolo blackhole origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',					True,		'yolo core coco yolo blackhole origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'nocolor core coco yolo gravity origin nono cluster',												True,		'nocolor core coco yolo gravity origin nono cluster' ],
	[ 'nocolor core coco yolo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',						True,		'nocolor core coco yolo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'nocolor core coco yolo gravity core dodo origin nono cluster',							True,		'nocolor core coco yolo core dodo gravity origin nono cluster' ],
	[ 'nocolor core coco yolo gravity core dodo origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',	True,		'nocolor core coco yolo core dodo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'blackhole',																															True,		'blackhole' ],
	[ 'blackhole rakudo-star-0.0.7-x86_64-h-0.xyz',																									True,		'blackhole rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'gravity core coco',																													True,		'gravity core coco' ],
	[ 'gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz',																						True,		'gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'blackhole origin nono cluster',																					True,		'blackhole origin nono cluster' ],
	[ 'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',																		True,		'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',																		True,		'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'cluster',																																True,	'cluster' ],
	[ 'cluster rakudo-star-0.0.7-x86_64-h-0.xyz',																										False,	'cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',																				False,	'origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
	[ 'gravity yolo',																															True,	'gravity yolo' ],
);

my $rule = 'TOP';

for @tests -> [$string, $should-parse, $message] {
my $actions = Galaxy::Physics::Actions.new;
	my $m = Galaxy::Physics.create($string, :$actions, :$rule);
	#die unless $m;	
  my $result = ?$m;   # make boolean
  $result = !$result if $should-parse === False;
  ok $result, $message;
	say $actions.laws.perl;
}
