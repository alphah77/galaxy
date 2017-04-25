use Grammar::Debugger;
use Test;


### Package : rakudo-star-ver-arch-build-tag.ext

 

grammar Pkg {
	#token TOP		{ <name> <ver>? <arch>? <build>? <tag>? <ext>? }
	token TOP {
        |       <name> <ver> <arch> <build> <tag> <ext> # Can probably be written cleaner
        |       <name> <ver> <arch> <build> <tag>
        |       <name> <ver> <arch> <build> <ext>
        |       <name> <ver> <arch> <build>
        |       <name> <ver> <arch>
        |       <name> <ver>
        |       <name>
        }
	regex name							{ <alnum>+ [ '-' <alnum>+ ]* <!before '.'> } # Don't mess with this :(
	token ver								{ '-' <(<digit>+ ['.' <digit>+]+)> }  
	proto token arch 				{ * }
	token arch:sym<x86_64>	{ '-' <(<sym>)> }
	token arch:sym<i386>		{ '-' <(<sym>)> }
	token build							{ '-' <(<digit>+)> }
	token tag								{ '-' <(<alnum>+)> } 
	token ext								{ '.' <('pkg')> }
}


my @tests = (
 #[ 'string to test', matches?, message ]
 [ 'rakudo-star',												True,		'✔ name' ],
 [ 'rakudo-star-0.7',										True,		'✔ name-ver' ],
 [ 'rakudo-star-0.7-x86_64',						True,		'✔ name-ver-arch' ],
 [ 'rakudo-star-0.7-x86_64-0',					True,		'✔ name-ver-arch-build' ],
 [ 'rakudo-star-0.7-x86_64-0.pkg',      True,		'✔ name-ver-arch-build-ext' ],
 [ 'rakudo-star-0.7-x86_64-0-tag',      True,		'✔ name-ver-arch-build-tag' ],
 [ 'rakudo-star-0.7-x86_64-0-tag.pkg',	True,		'✔ name-ver-arch-build-tag.ext' ],
 [ 'rakudo-star-0.7-0',									False,	'✘ name-ver.ext' ],
 [ 'rakudo-star-0.7.pkg',								False,	'✘ ext must come after build or tag' ],

);

#for @tests -> [$string, $should-parse, $message] {
#    my $m = Pkg.parse($string);
#    my $result = ?$m;   # make boolean
#    $result = !$result if $should-parse === False;
#    ok $result, $message;
#}



#my $m = Pkg.parse('rakudo-5.3.2-x86_64-7.xyz');
my $m = Pkg.parse(@*ARGS);

exit unless $m;
say $m<name> ?? "name: $m<name>" !! "name:";
say $m<ver> ?? "ver: $m<ver>" !! "ver:";
say $m<arch> ?? "arch: $m<arch>" !! "arch:";
say $m<build> ?? "build: $m<build>" !! "build:";
say $m<tag> ?? "tag: $m<tag>" !! "tag:";
say $m<ext> ?? "ext: $m<ext>" !! "ext:";

