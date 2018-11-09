#!/usr/bin/env perl6

use Data::Dump::Tree;

my %pkgs;

class Pkg {
  has         $.name;
  has Version $.version = Version.new;
	has Pkg     @.dep;

	method Str {
	  $!name ~ $!version;
	}
}

my $a1 = Pkg.new: name => 'a', version => Version.new: <1>;
my $a2 = Pkg.new: name => 'a', version => Version.new: <2>;
my $b1 = Pkg.new: name => 'b', version => Version.new: <1>;
my $b2 = Pkg.new: name => 'b', version => Version.new: <2>;
my $c1 = Pkg.new: name => 'c', version => Version.new: <1>;
my $c2 = Pkg.new: name => 'c', version => Version.new: <2>;

$c1.dep.push: Pkg.new(name => 'a');
$c1.dep.push: Pkg.new(name => 'b', version => Version.new: <1>);

$c2.dep.push: Pkg.new(name => 'b', version => Version.new: <2>);

%pkgs<a> .push: $a1, $a2;
%pkgs<b> .push: $b1, $b2;
%pkgs<c> .push: $c1, $c2;


sub return-pkg (Pkg $pkg) {
  my @pkgs = flat %pkgs{$pkg.name};
	return grep {$_.version ~~ $pkg.version}, @pkgs;
}  

sub get-cand (Pkg $pkg) {
	gather {
		take return-pkg($pkg).map( -> $pkg {
			($pkg, $pkg.dep.map( -> $pkg {
				flat get-cand($pkg).Slip
			}).Slip)
		}).Slip;
	}
}

sub conflicts (Pkg $pkg) {
  return True if $pkg.name eq <a> and $pkg.version eq <1>; 
  #take $pkg.Str if $pkg.name eq <a> and $pkg.version eq <1>; 
}

multi select-cand (Pkg $pkg) {
	say $pkg.Str;
  return $pkg.Str if not conflicts $pkg;
}

multi select-cand (@cand) {
  say @cand.Str;
  gather {
    @cand.map({ .first({ take select-cand $_ }) });
	}
}

my $c = Pkg.new: name => 'c';

my @cand =  get-cand $c;

my @selected = select-cand @cand;
say @selected;
