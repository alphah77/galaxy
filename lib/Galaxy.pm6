use DBIish;
use Nebula;
use Gravity;
use Blackhole;
use Planet;
#use Op;
use Star;
use Dep;
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

	has IO   $.law;

	has $!db;

  has Nebula    @.nebula;
  has Gravity   $.gravity;
  has Blackhole $.blackhole;

  has Star      %!star;

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
    :$!gravity;
    :$!blackhole;
    :@!nebula;
    :$!law;
	  ) {

    $!db        = self!db;

		%!star      = self!local-star;   #Revist

    
	}


  method cluster(Star $star) {
    $star.print-cluster();
	}

  method stable() {
		my @unstable = %!star.values.map({ .name => .unstable  if .unstable });
		my @stable = %!star.values.map({ .name if .stable });
    #%!star<perl7>.planet>>.path>>.say;


	}

	method !db() {
    return $!db if $!db;
	  $!db = DBIish.connect('SQLite', database => $!disk.Str);
		return $!db;
	}


  # Revisit
  method !local-star() {
		my %star = self.select-star().map: -> %h { %h<name> => Star.new: |%h };
    
		%star.values.map({ .planet = self.select-planet(.name).map(-> %h {Planet.new: |%h}) });

		%star.values.map({ .cluster = self.select-dep(.name).map(-> %h {Dep.new: |%h}) });

    .cluster.map({ .star = %star{.name} if .satisfy(%star{.name}) }) for %star.values;
    #%star.values.map({ .cluster.map({ .satisfy(%star{.name}) }) }); # Revisit: Not working!

    return %star;

	}

  method gravity (:@star!) {
    $!gravity.pull(:@star);
  }

  method blackhole (:@star) {
    $!blackhole.suck(:@star);
  }

  #method star (:@star) {
  #  $!star;
  #}






	method select-star() {
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
	method select-dep($name) {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT depname AS name,  depage AS age
			FROM dep
			WHERE starname = $name;
		STATEMENT

		$st.execute($name);
	  return $st.allrows(:array-of-hash);
	}
}
