use Laws;
use Alien;
use Star;
use Galaxy;
use Gravity;
use Blackhole;
use Nebula;


class Universe {
	has						$.name;
	has Alien			$.alien;
	has						$.laws				= LawCmd.create(@*ARGS.Str);
	has Galaxy		$.galaxy;
	has Gravity		$.gravity;
	has Blackhole	$.blackhole;
	has Nebula		@.nebula;
	#	has Galaxy $.galaxy;
	#	has Nebula @.nebula;

	method create() {
	$!alien			= Alien.new(laws => self.laws<alien>); 
	$!galaxy		= Galaxy.new(laws => self.laws<galaxy>,
		gravity		=> Gravity.new(laws => self.laws<gravity>), 
		blackhole	=> Blackhole.new(laws => self.laws<blackhole>), 
	);
	@!nebula		= $!laws<nebula>.pairs.map({ Nebula.new(:name(.key), :location(.value)) }); # can be done better!

	}
}
