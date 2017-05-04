my @tests = (
 #[ 'string to test', matches?, message ]
 [ 'yolo gravity dummy rakudo-star',	True,		'yolo gravity dummy rakudo-star' ],
 [ 'yolo gravity dummy',							True,		'yolo gravity dummy' ],
 [ 'yolo gravity rakudo-star',				True,		'yolo gravity rakudo-star' ],
 [ 'yolo gravity',										True,		'yolo gravity' ],
 [ 'yolo rakudo-star',								True,		'yolo rakudo-star' ],
 [ 'yolo',														True,		'yolo' ],
 [ 'gravity dummy rakudo-star',			True,		'gravity dummy rakudo-star' ],
 [ 'gravity dummy',									True,		'gravity dummy' ],
 [ 'gravity rakudo-star',						True,		'gravity rakudo-star' ],
 [ 'gravity',												True,		'gravity' ],
 [ 'rakudo-star',										True,		'rakudo-star' ],
 [ 'gravity dummy cluster-star',			True,		'gravity dummy cluster-star' ], # Failling ):

);

for @tests -> [$string, $should-parse, $message] {
	my %physics = LawCmd.create($string);
  my $result = ?%physics;   # make boolean
  $result = !$result if $should-parse === False;
	print %physics.perl ~ " ";
  ok $result, $message;
}
#
