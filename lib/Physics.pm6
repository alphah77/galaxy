use Physics::Law;
use Alien;
use Galaxy;
use Gravity;
use Blackhole;
use Spacetime;
use Star;
use Nebula;

class Physics {

  has %.law;

  has Alien     $.alien;
  has Galaxy    $.galaxy;
  has Gravity   $.gravity;
  has Blackhole $.blackhole;
  has Spacetime $.spacetime;
  has Nebula    @.nebula;
	
  submethod BUILD (:%!law = Physics::Law.initiate) {
		my $cmd = %!law<cmd>;

  	$!alien     = Alien.new;
  	$!gravity   = Gravity.new:   |%!law<gravity>.hash;
  	$!blackhole = Blackhole.new: |%!law<blackhole>.hash;
		$!spacetime = Spacetime.new: |%!law<spacetime>.hash;

		@!nebula    = %!law<nebula>.map( {Nebula.new: |.hash} ) if %!law<nebula>:exists;

  	$!galaxy    = Galaxy.new(|%!law<galaxy>.push: (:$!gravity, :$!blackhole, :@!nebula));

		self.cmd($cmd.key, $cmd.value);
  }

    multi method cmd ('gravity', $obj) {
		  #say <gravity>;
      #$!galaxy.gravity: :star($obj);
    }

    multi method cmd ('blackhole', $obj ) {
		  #say <blackhole>;
      #$!galaxy.blackhole :star($obj);

    }

    multi method cmd ('star', $obj ) {
		  #say <star>;
			#.say for %!law;
			#say %!law<star>;
			#say $obj;

    }

    multi method cmd ('spacetime', $obj ) {
		  #say <spacetime>;
      #$!galaxy.spacetime :event($obj);
			#say $obj;

    }

    # galaxy star dispatch to "star"
    # galaxy event dispatch to "spacetime"
    multi method cmd ('galaxy', $obj ) {
		  #say <galaxy>;
			samewith('star',      $obj) if $obj ~~ Hash;
			samewith('spacetime', $obj) if $obj ~~ 'event';

			say $!galaxy;
    }

}
