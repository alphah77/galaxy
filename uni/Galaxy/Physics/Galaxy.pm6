use DBIish;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Star;
use Galaxy::Physics::Op;
use Galaxy::Physics::Xyz;
use Galaxy::Physics::Dep;
use Cro::HTTP::Client;

class Galaxy::Physics::Galaxy {
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

  #has Galaxy::Physics::Dep       %!dep;
  has %!dep;

  has Galaxy::Physics::Xyz       @.xyz;
  has Galaxy::Physics::Xyz       %!xyzs;
  has Galaxy::Physics::Gravity   $!gravity;
  has Galaxy::Physics::Blackhole $!blackhole;
  has Galaxy::Physics::Star      $.star;


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
    :$!law;
		:$gravity;
		:$blackhole;
		:$star;
		:@xyz;
	  ) {

		$!gravity   = Galaxy::Physics::Gravity.new:   |$gravity.hash;
		$!blackhole = Galaxy::Physics::Blackhole.new: |$blackhole.hash;
		$!star      = Galaxy::Physics::Star.new:      |$star.hash;

    $!db        = self!db;
		@!xyz       = @xyz.map: -> %h { Galaxy::Physics::Xyz.new: |%h };
		#%!dep       = self!dep;   #Revist
		%!xyzs      = self!local-xyz;   #Revist

    
	}


  method stable() {
    #%!xyzs<perl7>.print-dep;
    say %!xyzs<perl7>.cluster;

	}

	method !db() {
    return $!db if $!db;
	  $!db = DBIish.connect('SQLite', database => $!disk.Str);
		return $!db;
	}


  # Revisit
  method !local-xyz() {
		#my @xyz = self.select-xyz().map: -> %h { %h.push: {:dep(%!dep{%h<name>}) } };
		#return @xyz.map: -> %h { %h<name> => Galaxy::Physics::Xyz.new: |%h  }

		my %xyz = self.select-xyz().map: -> %h { %h<name> => Galaxy::Physics::Xyz.new: |%h };
    
		%xyz.values.map: { .add-dep(self.select-dep(.name)) };

		#Revisit: !%xyz{$dep.name}.defined 
    %xyz.values.map: { .add-cluster(.dep.map: -> $d { %xyz{$d.name} if %xyz{$d.name} === $d }) }

	 return %xyz;

	}

  method gravity (:@xyz) {
    $!gravity.pull(:@xyz);
  }

  method blackhole (:@xyz) {
    $!blackhole.suck(:@xyz);
  }

  method star (:@xyz) {
  #  $!star;
  }






	method select-xyz() {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT name, age, core, tag, form, tail, location, chksum
			FROM star
			STATEMENT

		$st.execute;
		return $st.allrows(:array-of-hash);

	}

	#Revist %h<age> eq Any
	method select-dep($name) {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT depname AS name,  depage AS age
			FROM dep
			WHERE xyzname = $name;
		STATEMENT

		$st.execute($name);
	  return $st.allrows(:array-of-hash);
	}
}
