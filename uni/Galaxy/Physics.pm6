use Galaxy::Physics::Laws;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Star;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {

  has %.laws;

  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Nebula    @.nebulas;
	
  submethod BUILD (:%!laws = Galaxy::Physics::Laws.initiate) {
		my $cmd = %!laws<cmd>;



  	$!alien     = Galaxy::Physics::Alien.new;
  	$!gravity   = Galaxy::Physics::Gravity.new:   |%!laws<gravity>.hash;
  	$!blackhole = Galaxy::Physics::Blackhole.new: |%!laws<blackhole>.hash;
		$!spacetime = Galaxy::Physics::Spacetime.new: |%!laws<spacetime>.hash;

		@!nebulas   = %!laws<nebulas>.map( {Galaxy::Physics::Nebula.new: |$_.hash} ) if %!laws<nebulas>:exists;
    
  	$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!laws<galaxy>.hash;

		#self.cmd($cmd);
		self.cmd($cmd.key, $cmd.value);
  }

    multi method cmd ('gravity', $obj) {
			#.say for %!laws;
			#say %!laws<gravity>;
      #$!galaxy.gravity: :$obj;
      #$!gravity.say;
			say $obj;
    }

    multi method cmd ("blackhole", $obj ) {
			#.say for %!laws;
			#say %!laws<blackhole>;
      #$!galaxy.blackhole: :$obj;
			say $obj;

    }

    multi method cmd ("star", $obj ) {
			#.say for %!laws;
			#say %!laws<star>;
			say $obj;

    }

    multi method cmd ("spacetime", $obj ) {
			#.say for %!laws;
			say $obj;

    }

    # galaxy star dispatch to "star"
    # galaxy event dispatch to "spacetime"
    multi method cmd ("galaxy", $obj ) {
			#.say for %!laws;
			#say %!laws<galaxy>;
      #$!galaxy.say;
			say $obj;
    }

    #multi method cmd ("galaxy") {

		#}

}
