use Galaxy::Physics::Laws;
use Galaxy::Physics::Alien;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Star;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {

  has %.law;

  has Galaxy::Physics::Alien     $.alien;
  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Spacetime $.spacetime;
  has Galaxy::Physics::Nebula    @.nebula;
	
  submethod BUILD (:%!law = Galaxy::Physics::Laws.initiate) {
		my $cmd = %!law<cmd>;

  	$!alien     = Galaxy::Physics::Alien.new;
  	$!gravity   = Galaxy::Physics::Gravity.new:   |%!law<gravity>.hash;
  	$!blackhole = Galaxy::Physics::Blackhole.new: |%!law<blackhole>.hash;
		$!spacetime = Galaxy::Physics::Spacetime.new: |%!law<spacetime>.hash;

		@!nebula    = %!law<nebula>.map( {Galaxy::Physics::Nebula.new: |.hash} ) if %!law<nebula>:exists;

	  push %!law<galaxy>, (:$!gravity, :$!blackhole, :@!nebula);

  	$!galaxy    = Galaxy::Physics::Galaxy.new(|%!law<galaxy>);

		self.cmd($cmd.key, $cmd.value);
  }

    multi method cmd ('gravity', $obj) {
		  say <gravity>;
      #$!galaxy.gravity: :star($obj);
    }

    multi method cmd ('blackhole', $obj ) {
		  say <blackhole>;
      #$!galaxy.blackhole :star($obj);

    }

    multi method cmd ('star', $obj ) {
		  say <star>;
			#.say for %!law;
			#say %!law<star>;
			#say $obj;

    }

    multi method cmd ('spacetime', $obj ) {
		  say <spacetime>;
      #$!galaxy.spacetime :event($obj);
			#say $obj;

    }

    # galaxy star dispatch to "star"
    # galaxy event dispatch to "spacetime"
    multi method cmd ('galaxy', $obj ) {
		  say <galaxy>;
			samewith('star', $obj) if $obj ~~ Hash;
			#say $!galaxy;
    }

}
