use Galaxy::Physics::Law;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {
  also does Galaxy::Physics::Law;

  has %.law = self.law;


  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Nebula    @.nebula;
	

	  submethod TWEAK {
#say %!law<nebula>;
  		$!alien     = Galaxy::Physics::Alien.new;
  		$!galaxy    = Galaxy::Physics::Galaxy.new:    |%!law<galaxy>.hash;
  		$!gravity   = Galaxy::Physics::Gravity.new:   |%!law<gravity>.hash;
  		$!blackhole = Galaxy::Physics::Blackhole.new: |%!law<blackhole>.hash;
  		$!spacetime = Galaxy::Physics::Spacetime.new: |%!law<spacetime>.hash;
  		@!nebula    = Galaxy::Physics::Nebula.new:    |%!law<nebula><helix>.hash;
		}
}
