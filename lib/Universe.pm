use Physics;
use Galaxy;

# Class to create Universe which will hold Alien, Galaxy, Nebula if their laws set by Alien are consistent;
#use Nebula;

class Universe {
	has $.name;
	has @.laws;
	has %.physics = LawCmd.create(@*ARGS.Str);
	has Galaxy $.galaxy = Galaxy.new(laws => self.physics<galaxy>); 
	#	has %!physics;
	#	has Galaxy $.galaxy;
	#	has Nebula @.nebula;

	method create() {
		#	my $galaxy = Galaxy.new(physics => self.physics<galaxy>);

	}
}
