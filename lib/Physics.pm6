use Physics::Laws;
use Physics::Alien;
use Physics::Galaxy;
use Physics::Gravity;
use Physics::Blackhole;
use Physics::Spacetime;
use Physics::Star;
use Physics::Nebula;

class Physics {

  has %.law;

  has Physics::Alien     $.alien;
  has Physics::Galaxy    $.galaxy;
  has Physics::Gravity   $.gravity;
  has Physics::Blackhole $.blackhole;
  has Physics::Spacetime $.spacetime;
  has Physics::Nebula    @.nebula;
	
  submethod BUILD (:%!law = Physics::Laws.initiate) {
		my $cmd = %!law<cmd>;

  	$!alien     = Physics::Alien.new;
  	$!gravity   = Physics::Gravity.new:   |%!law<gravity>.hash;
  	$!blackhole = Physics::Blackhole.new: |%!law<blackhole>.hash;
		$!spacetime = Physics::Spacetime.new: |%!law<spacetime>.hash;

		@!nebula    = %!law<nebula>.map( {Physics::Nebula.new: |.hash} ) if %!law<nebula>:exists;

	  push %!law<galaxy>, (:$!gravity, :$!blackhole, :@!nebula);

  	$!galaxy    = Physics::Galaxy.new(|%!law<galaxy>);

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
			say $!galaxy;
    }

}
