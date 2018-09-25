#!/usr/bin/env perl6

use lib <uni>;
use Alien;
use Physics;
use Test;

my @tests = (
# [ 'string to test', matches?, message ]
  [ '',                                                                       True,   '' ],
  [ 'blackhole cluster',                                                                        True,   '' ],
  [ 'rakudo-star-0.0.7-x86_64-h-0.xyz',                                                           True,   'rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'pretty',                                                               True,   'pretty' ],
  [ 'pretty rakudo-star-0.0.7-x86_64-h-0.xyz',                                                    True,   'pretty rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'pretty core coco rakudo-star-0.0.7-x86_64-h-0.xyz',                                          True,   'pretty core coco rakudod-star' ],
  [ 'pretty core coco yolo',                                                  True,   'pretty core coco yolo' ],
  [ 'pretty core coco yolo rakudo-star-0.0.7-x86_64-h-0.xyz',                                     True,   'pretty core coco yolo rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'pretty core coco yolo gravity',                                            True,   'pretty core coco yolo gravity' ],
  [ 'pretty core coco yolo blackhole rakudo-star-0.0.7-x86_64-h-0.xyz',                           True,   'pretty core coco yolo blackhole rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'gravity origin nono',                                True,   'pretty core coco yolo gravity origin nono' ],
  [ 'pretty core coco yolo gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz',                   True,   'pretty core coco yolo gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'yolo core coco yolo gravity origin nono cluster',                            True,   'yolo core coco yolo gravity origin nono cluster' ],
  [ 'yolo core coco yolo blackhole origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',         True,   'yolo core coco yolo blackhole origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'pretty core coco yolo gravity origin nono cluster',                        True,   'pretty core coco yolo gravity origin nono cluster' ],
  [ 'pretty core coco yolo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',           True,   'pretty core coco yolo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'pretty core coco yolo gravity core dodo origin nono cluster',              True,   'pretty core coco yolo core dodo gravity origin nono cluster' ],
  [ 'pretty core coco yolo gravity core dodo origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz', True,   'pretty core coco yolo core dodo gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'blackhole',                                                              True,   'blackhole' ],
  [ 'blackhole rakudo-star-0.0.7-x86_64-h-0.xyz',                                                 True,   'blackhole rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'gravity core coco',                                                          True,   'gravity core coco' ],
  [ 'gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz',                                           True,   'gravity origin nono rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'blackhole origin nono cluster',                                          True,   'blackhole origin nono cluster' ],
  [ 'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',                                   True,   'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',                                   True,   'gravity origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'cluster',                                                                True, 'cluster' ],
  [ 'cluster rakudo-star-0.0.7-x86_64-h-0.xyz',                                                   False,  'cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz',                                       False,  'origin nono cluster rakudo-star-0.0.7-x86_64-h-0.xyz' ],
  [ 'gravity yolo',                                                             True, 'gravity yolo' ],
);


for @tests -> [$string, $should-parse, $message] {
my $alien   = Alien.new;
my $physics = Physics.new: cmd => $message, cnf => $alien.cnf;
  my $m = $physics.create;
  #die unless $m; 
  my $result = ?$m;   # make boolean
  $result = !$result if $should-parse === False;
  ok $result, $message;
}
