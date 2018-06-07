use Galaxy::Physics::Laws;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {

  has %.laws = Galaxy::Physics::Laws.initiate;


  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Nebula    @.nebulas;
	

	  submethod TWEAK {
  		$!alien     = Galaxy::Physics::Alien.new;
  		$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!laws<galaxy>.hash;
  		$!gravity   = Galaxy::Physics::Gravity.new:   |%!laws<gravity>.hash;
  		$!blackhole = Galaxy::Physics::Blackhole.new: |%!laws<blackhole>.hash;
  		$!spacetime = Galaxy::Physics::Spacetime.new: |%!laws<spacetime>.hash;

			for %!laws<nebulas>.list -> $nebula {
				 @!nebulas.push: Galaxy::Physics::Nebula.new: |$nebula;
			}
		}
}
