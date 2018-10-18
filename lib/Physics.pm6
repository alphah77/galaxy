use Physics::Law;
use Alien;
use Galaxy;
use Gravity;
use Blackhole;
use Spacetime;
use Star;
use Nebula::Way;

class Physics {

  has %.law;

  has Alien       $.alien;
  has Galaxy      $.galaxy;
  has Gravity     $.gravity;
  has Blackhole   $.blackhole;
  has Spacetime   $.spacetime;
  has Nebula::Way @.nebula;
	
  submethod BUILD (:%!law = Physics::Law.initiate) {
		my $cmd = %!law<cmd>;

  	$!alien     = Alien.new;
  	#$!gravity   = Gravity.new:   |%!law<gravity>.hash;
  	#$!blackhole = Blackhole.new: |%!law<blackhole>.hash;
		#$!spacetime = Spacetime.new: |%!law<spacetime>.hash;

		@!nebula    = %!law<nebula>.map( {Nebula::Way.new: |.hash} ) if %!law<nebula>:exists;

  	#$!galaxy    = Galaxy.new(|%!law<galaxy>.push: (:$!gravity, :$!blackhole, :@!nebula));
  	$!galaxy    = Galaxy.new(|%!law<galaxy>.push: (:@!nebula));

		#self.cmd($cmd.key, $cmd.value);
		self.cmd($cmd);
  }

    multi method cmd ('gravity') {
		  say <---gravity--->;
      $!galaxy.gravity: |%!law<gravity>;
    }

    multi method cmd ('blackhole') {
		  say <---blackhole--->;
      $!galaxy.blackhole: |%!law<blackhole>;
      #$!galaxy.blackhole :star($obj);

    }

    multi method cmd ('star') {
		  say <---star--->;
      $!galaxy.star: |%!law<star>;

    }

    multi method cmd ('spacetime') {
		  say <---spacetime--->;
		  #say <spacetime>;
      #$!galaxy.spacetime :event($obj);

    }

    # galaxy star dispatch to "star"
    # galaxy event dispatch to "spacetime"
    multi method cmd ('galaxy') {
			samewith('star')      if  %!law<star><star> ~~ Star::Xyz;
		#	samewith('spacetime') if  %!law<spacetime><event> ~~ Spacetime::Event;
    }

}
