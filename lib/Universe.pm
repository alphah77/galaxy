use Laws;
use Galaxy;
use Gravity;
use Blackhole;
use Nebula;

# Class to create Universe which will hold Alien, Galaxy, Nebula if their laws set by Alien are consistent;
#use Nebula;

class Universe {
	has $.name;
	has $.laws = LawCmd.create(@*ARGS.Str);
	has Galaxy		$.galaxy;
	has Gravity		$.gravity;
	has Blackhole	$.blackhole;
	has Nebula		@.nebula;
	#	has Galaxy $.galaxy;
	#	has Nebula @.nebula;

	method create() {
		#	my $galaxy = Galaxy.new(laws => self.laws<galaxy>);
	$!galaxy		= Galaxy.new(laws => self.laws<galaxy>); 
	$!gravity		= Gravity.new(laws => self.laws<gravity>); 
	$!blackhole	= Blackhole.new(laws => self.laws<blackhole>); 
	@!nebula		= $!laws<nebula>.pairs.map({ Nebula.new(:name(.key), :location(.value)) });

	}
}
