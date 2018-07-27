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

		@!xyz        = @xyz.map: -> %h { Galaxy::Physics::Xyz.new: |%h };
		@!xyzs       = &local-xyz(:$!disk);
#		say @!xyzs;
    
	}

  method stable () {
    say @!xyzs[1].cluster.name;


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

	sub local-xyz(:$disk) {
	  my $dbh = DBIish.connect('SQLite', database => $disk.Str);

		my $st = $dbh.prepare('SELECT id, name, age, core, tag, form, tail, location, chksum FROM star');

		$st.execute;


		my @rows = $st.allrows(:array-of-hash);

		my @xyzs = @rows.map: -> %h { Galaxy::Physics::Xyz.new: |%h };

#		 my $resp = await Cro::HTTP::Client.get('http://localhost:20000/cand?core=x86_64&name=rakudo&age=0.0.7+');
#		 my $json = await $resp.body;
#		 my @xyzs = $json.map({ Galaxy::Physics::Xyz.new: |$_.hash });

		 return @xyzs;
	}
}
