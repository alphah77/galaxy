use Data::Dump::Tree;
use DBIish;
use Nebula;
use Gravity;
use Blackhole;
#use Op;
use Star;
use Cro::HTTP::Client;

class Galaxy {
  has Str  $.name;
  has Str  $.core;
  has IO   $.origin;
  has IO   $.disk;
  has IO   $.bulge;
  has IO   $.halo;
  has Bool $.yolo;
  has Bool $.cool;
  has Bool $.pretty;

	has $!db;

  has Nebula $.nebula;
  has Gravity     $.gravity;
  has Blackhole   $.blackhole;

  has Star      %!stars;

  submethod BUILD (
    :$!name    = chomp qx<hostname>;
    :$!core    = chomp qx<uname -m>;
    :$!origin  = </>.IO;
    :$!bulge   = $!origin.add(</etc/galaxy>.IO).cleanup;
    :$!halo    = $!origin.add(</var/galaxy>.IO).cleanup;
    :$!disk    = $!halo.add(</galaxy.db>.IO).cleanup;
    :$!yolo    = False;
    :$!cool    = False;
    :$!pretty  = False;
    #:$!gravity;
    #:$!blackhole;
    :$!nebula;
	  ) {

    $!db        = self!db;
		%!stars      = self!local-stars;   #Revist

    
	}


  method stable() {
   #%!stars<perl7>.cluster;
	}

	method !db() {
    return $!db if $!db;
	  $!db = DBIish.connect('SQLite', database => $!disk.Str);
		return $!db;
	}

  # Revisit
  method !local-stars() {
    my %stars;

		%stars = self.select-stars().map: -> %h { %h<name> => Star.new: |%h };
    
		%stars.values.map({ .planet  = self.select-planet(.name).map(-> %h {Star::Planet.new: |%h}) });
		%stars.values.map({ .cluster = self.select-cluster(.name).map(-> %h {Star.new: |%h}) });

    return %stars;
	}

# method gravity (:@xyz!) {
#  	for @xyz -> $xyz {
#  	  $xyz.core //= $!core;
# 	    my @cand = @!nebula>>.cand($xyz).unique(:with(&[eqv])).flat;
#      
#  		for @cand -> $xyz {
#  		  self.cluster: $xyz;
#  	  #say  @cand;
#  	  }
#  	}
#  }

	method gravity (Bool :$cluster, :@star!) {
  	@star.map({ .core //= $!core });
    @star .= map( -> $star { self.nebula(:$cluster, :$star) } );
    say @star;
	}

  method blackhole (*%opt) {
	  say %opt;
	}

  method nebula (Bool :$cluster, Star :$star!) {
	  #$star.core //= $!core;
    my @cand = $!nebula.cand(:$star);
		#say @cand>>.Str;
	  ddt @cand;
	}

  method star (*%opt) {
	  say %opt
	}

	method planet ($planet) {

	}

  method cluster($star) {
		self.cluster($_) for $star.cluster;
		say $star.name;
	}

	method select-stars() {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT name, age, core, tag, form, tail, location, chksum
			FROM star
			STATEMENT

		$st.execute;
		return $st.allrows(:array-of-hash);
	}

	method select-planet($name) {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT path, type, perm
			FROM planet
			WHERE starname = $name;
		STATEMENT

		$st.execute($name);
	  return $st.allrows(:array-of-hash);
	}

	#Revist %h<age> eq Any
	method select-cluster($name) {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT depname AS name,  depage AS age
			FROM cluster
			WHERE starname = $name;
		STATEMENT

		$st.execute($name);
	  return $st.allrows(:array-of-hash);
	}
}
