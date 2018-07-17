use Galaxy::Physics::Laws;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Xyz;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {

  has %.laws;

  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Xyz       @.xyz;
  has Galaxy::Physics::Nebula    @.nebulas;
	
  submethod BUILD (
		:%!laws     = Galaxy::Physics::Laws.initiate
	  ) {

  	$!alien     = Galaxy::Physics::Alien.new;
  	$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!laws<galaxy>.hash;
		$!spacetime = Galaxy::Physics::Spacetime.new: |%!laws<spacetime>.hash;

		@!xyz       = %!laws<xyz>.map(     {Galaxy::Physics::Xyz.new:    |$_.hash} ) if %!laws<xyz>:exists;
		@!nebulas   = %!laws<nebulas>.map( {Galaxy::Physics::Nebula.new: |$_.hash} ) if %!laws<nebulas>:exists;

    &action(%!laws<cmd>, :@!xyz);

    multi sub action ("gravity", :@xyz ) {
      $!galaxy.gravity: :@xyz;
    }

    multi sub action ("blackhole", :@xyz ) {
      $!galaxy.blackhole: :@xyz;

    }

    multi sub action ("star", :@xyz ) {

    }

    multi sub action ("spacetime", :@events ) {

    }

    multi sub action ("galaxy", :@xyz ) {

    }
	}

}
