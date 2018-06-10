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
  has Galaxy::Physics::Star      @.stars;
  has Galaxy::Physics::Nebula    @.nebulas;
	
  submethod BUILD (
		:%!laws     = Galaxy::Physics::Laws.initiate
	  ) {
  	$!alien     = Galaxy::Physics::Alien.new;
  	$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!laws<galaxy>.hash;
		$!gravity   = Galaxy::Physics::Gravity.new:   |%!laws<gravity>.hash;
		$!blackhole = Galaxy::Physics::Blackhole.new: |%!laws<blackhole>.hash;
		$!spacetime = Galaxy::Physics::Spacetime.new: |%!laws<spacetime>.hash;

		@!nebulas   = %!laws<nebulas>.map({Galaxy::Physics::Nebula.new: |$_.hash});
	}
}
