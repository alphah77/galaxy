use Grammar::Debugger;

### Package : rakudo-star-ver-arch-build-tag.ext

# grammar should  parse as follow:
 # 'rakudo-star'  match name
 # 'rakudo-star-ver'  match name, ver
 # 'rakudo-star-ver-arch'  match name, ver, arch
 # 'rakudo-star-ver-arch-build'  match name, ver, arch, build
 # 'rakudo-star-ver-build'  should Not match "build" should be after "arch"
 # 'rakudo-star-ver-arch-build-tag'  match name, ver, arch, build, tag
 # 'rakudo-star-ver-arch-build.ext'  match name, ver, arch, build, ext
 # 'rakudo-star-ver-arch-build-tag.ext'  match name, ver, arch, build, tag, ext
 # 'rakudo-star-arch-build' should Not match: "arch" must be after ver and before build
 # 'rakudo-star-ver-build' should Not "match": "build" must be after arch 
 
 ### Issues ###
 #  grammar should fail to parse if token matched in wrong location (arch token showed before version token for example)
 #  rakudo-star-ver-arch.ext should fail, however, grammar successfully parse it
 #  rakudo-star-ver-arch-build-tag.pkg should match successfully, but  grammar fails to parse it
 

grammar Pkg {
	token TOP		{ <ws> <name>  ['-' <ver>]? ['-' <arch>]? ['-' <build>]? ['-' <tag>]? ['.' <ext>]?  }
	regex name	{ <alnum>+ [ '-' <alnum>+ ]* <!before '.'>} # using regex as name may contain "-"
	token ver		{ <digit>+ ['.' <digit>+]+ }  
	proto token arch { * }  # look-around asssertions for "arch" token doesn't work, Why!
	token arch:sym<x86_64>	{ <sym> }
	token arch:sym<i386>		{ <sym> }
	token build	{ <?after <arch> '-'> <digit>+ }
	token tag		{ <?after '-' <build> '-'> <alnum>+ } # "tag" is optional in the package name.
	token ext		{ <?after  [<build> | <tag>] '.'> 'pkg' } # "ext" should come after ("build" or "tag") only
}


my @tests = (
# [ 'string to test', matches?, message ]
 [ 'rakudo-star',												True,		'name' ],
 [ 'rakudo-star-0.7',										True,		'name-ver' ],
 [ 'rakudo-star-0.7-x86_64',						True,		'name-ver-arch' ],
 [ 'rakudo-star-0.7-x86_64-0',					True,		'name-ver-arch-build' ],
 [ 'rakudo-star-0.7-x86_64-0.pkg',      True,		'name-ver-arch-build-ext' ],
 [ 'rakudo-star-0.7-x86_64-0-tag',      True,		'name-ver-arch-build-tag' ],
 [ 'rakudo-star-0.7-x86_64-0-tag.pkg',	True,		'name-ver-arch-build-tag.ext' ],
 [ 'rakudo-star-0.7-0',									False,	'build must come after arch' ],
 [ 'rakudo-star-0.7.pkg',								False,	'ext must come after build or tag' ],
);


my $m = Pkg.parse(@*ARGS);

exit unless $m;
say $m<name> ?? "name: $m<name>" !! "name:";
say $m<ver> ?? "ver: $m<ver>" !! "ver:";
say $m<arch> ?? "arch: $m<arch>" !! "arch:";
say $m<build> ?? "build: $m<build>" !! "build:";
say $m<tag> ?? "tag: $m<tag>" !! "tag:";
say $m<ext> ?? "ext: $m<ext>" !! "ext:";

