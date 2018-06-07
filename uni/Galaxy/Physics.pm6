use Galaxy::Physics::Laws;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Star;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {

  has %.laws = Galaxy::Physics::Laws.initiate;

  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Star      @.stars;
  has Galaxy::Physics::Nebula    @.nebulas;
	
  submethod TWEAK {
 # 	$!alien     = self!create-alien;
  	$!galaxy    = self!create-galaxy:    %!laws<galaxy>;
  	$!gravity   = self!create-gravity:   %!laws<gravity>;
  	$!blackhole = self!create-blackhole: %!laws<blackhole>;
  	$!spacetime = self!create-spacetime: %!laws<spacetime>;
    @!stars     = self!create-star:      %!laws<stars>;
    @!nebulas   = self!create-nebula:    %!laws<nebulas>;
	}

  method !create-alien            { Galaxy::Physics::Alien.new;                  }
  method !create-galaxy($laws)    { Galaxy::Physics::Galaxy.new:    |$laws.hash; }
  method !create-gravity($laws)   { Galaxy::Physics::Gravity.new:   |$laws.hash; }
  method !create-blackhole($laws) { Galaxy::Physics::Blackhole.new: |$laws.hash; }
  method !create-spacetime($laws) { Galaxy::Physics::Spacetime.new: |$laws.hash; }

  method !create-star($laws) {
    my @stars;
    for $laws.list -> $star {
      @stars.push: Galaxy::Physics::Star.new: |$star.hash if $star;
    }

    return @stars;
  }

  method !create-nebula($laws) {
    my @nebulas;
    for $laws.list -> $nebula {
      @nebulas.push: Galaxy::Physics::Nebula.new: |$nebula.hash;
    }

    return @nebulas;
  }


}
