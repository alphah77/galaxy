use Laws;
use Alien;
use Star;
use Galaxy;
use Gravity;
use Blackhole;
use Nebula;
use Spacetime;


class Universe {
	has						$.physics			= LawCmd.create(@*ARGS.Str);
	has Alien			$.alien;
	has Galaxy		$.galaxy;
	has Gravity		$.gravity;
	has Blackhole	$.blackhole;
	has Nebula		@.nebula;
	has Spacetime	$.spacetime;

	method TWEAK() {
		$!alien			= Alien.new(laws => $!physics<alien>); 
		$!galaxy		= Galaxy.new(laws => $!physics<galaxy>,
			gravity		=> Gravity.new(laws => $!physics<gravity>), 
			blackhole	=> Blackhole.new(laws => $!physics<blackhole>), 
		);
		@!nebula		= $!physics<nebula>.pairs.map({ Nebula.new(:name(.key), :location(.value)) }); # can be done better!
	}
}
