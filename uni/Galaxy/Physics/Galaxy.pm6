use DBIish;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Star;
use Galaxy::Physics::Xyz;
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


  has Galaxy::Physics::Xyz       @.xyz;
  has Galaxy::Physics::Xyz       @!xyzs;
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

		$!gravity    = Galaxy::Physics::Gravity.new:   |$gravity.hash;
		$!blackhole  = Galaxy::Physics::Blackhole.new: |$blackhole.hash;
		$!star       = Galaxy::Physics::Star.new:      |$star.hash;

    $!db         = self!db;
		@!xyz        = @xyz.map: -> %h { Galaxy::Physics::Xyz.new: |%h };
		#@!xyzs       = self.local-xyz();
#		say @!xyzs;
    
	}

	method !db {
    return $!db if $!db;
	  $!db = DBIish.connect('SQLite', database => $!disk.Str);
		return $!db;
	}

  method stable() {
		my @rows = self.select-xyzs;
		@!xyzs = @rows.map: -> %h { Galaxy::Physics::Xyz.new: |%h };
		@!xyzs.map: -> $xyz { $xyz.dep-add($_) for self.select-dep($xyz.name) };
#	  for @!xyzs -> $xyz {
    #@!xyzs.map: -> $xyz { $xyz.cluster-add = flat $xyz.dep.map: -> $dep { @!xyzs.grep({ .name ~~ $dep<name> }) } };
		#say @!xyzs.dep.map: -> $dep {@!xyzs.grep({ .name ~~ $dep.name }) };
   # @!xyzs.map: -> $xyz { $xyz.cluster-add($xyz.dep.map: -> $dep { @!xyzs.grep({ .name ~~ $dep.name }) }) };

#	  }
	@!xyzs>>.say;
  

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






	method select-xyzs() {

		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT name, age, core, tag, form, tail, location, chksum
			FROM star
			STATEMENT

		$st.execute;
		return $st.allrows(:array-of-hash);

	}

	method select-dep($name) {
		my $st = $!db.prepare(q:to/STATEMENT/);
			SELECT r.name, r.age
			FROM star s
			INNER JOIN dep r
			ON s.id = r.id
			WHERE s.name = ?
		STATEMENT

		$st.execute($name);
		return $st.allrows(:array-of-hash);

	}
}
