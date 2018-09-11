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
		my $obj = %!laws<obj>;



  	$!alien     = Galaxy::Physics::Alien.new;
  	$!gravity   = Galaxy::Physics::Gravity.new:   |%!laws<gravity>.hash;
  	$!blackhole = Galaxy::Physics::Blackhole.new:  |%!laws<blackhole>.hash;
		$!spacetime = Galaxy::Physics::Spacetime.new: |%!laws<spacetime>.hash;

		@!nebulas   = %!laws<nebulas>.map( {Galaxy::Physics::Nebula.new: |$_.hash} ) if %!laws<nebulas>:exists;
    
  	$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!laws<galaxy>.hash;

		self.cmd($cmd, :$obj);
  }

    multi method cmd ("gravity", :$obj ) {
      #$!galaxy.gravity: :$obj;
      $!gravity.say;
    }

    multi method cmd ("blackhole", :$obj ) {
      $!galaxy.blackhole: :$obj;

    }

    multi method cmd ("star", :$obj ) {

    }

    multi method cmd ("spacetime", :$obj ) {

    }

    multi method cmd ("galaxy", :$obj ) {
			say %!laws<galaxy>;
      #$!galaxy.say;
    }

}
