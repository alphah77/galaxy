#!/usr/bin/env perl6

use Data::Dump::Tree;

my %pkgs;

class Pkg {
  has         $.name;
  has Version $.version = Version.new;
	has Pkg     @.dep;

	method Str {
	  ($!name, $!version).join('-');
	}
}

my $libc1 = Pkg.new: name => 'libc', version => Version.new: <0.0.1>;
my $libc2 = Pkg.new: name => 'libc', version => Version.new: <0.0.2>;
my $raku1 = Pkg.new: name => 'raku', version => Version.new: <0.0.1>;
my $raku2 = Pkg.new: name => 'raku', version => Version.new: <0.0.2>;
my $app1  = Pkg.new: name => 'app',  version => Version.new: <0.0.1>;
my $app2  = Pkg.new: name => 'app',  version => Version.new: <0.0.2>;

$app1.dep.push: Pkg.new(name => 'libc');
$app1.dep.push: Pkg.new(name => 'raku', version => Version.new: <0.0.1>);

$app2.dep.push: Pkg.new(name => 'raku', version => Version.new: <0.0.2>);

%pkgs<libc> .push: $libc1, $libc2;
%pkgs<raku>   .push: $raku1, $raku2;
%pkgs<app>    .push: $app1,  $app2;


sub get (Pkg $pkg) {
  my @pkgs = flat %pkgs{$pkg.name};
	return grep {$_.version ~~ $pkg.version}, @pkgs;
}  

sub cand (Pkg $pkg) {
	gather {
		take get($pkg).map( -> $pkg {
			$pkg, $pkg.dep.map( -> $pkg {
				cand($pkg)
			})
		}).cache;
	}
}

my $app = Pkg.new: name => 'app';
my @cand =  cand $app;

sub print-cand (@cand) {
  say @cand>>.Str
}

print-cand @cand;
