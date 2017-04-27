#unit module Universe;
# Class to create Universe which will hold Alien, Galaxy, Nebula if their laws set by Alien are consistent;
use Physics;
use Galaxy;
#use Nebula;

class Universe {
	has $.name;
	has @.laws;
	has %.physics = LawCmd.create(@*ARGS.Str);
	#	has %!physics;
	#	has Galaxy $.galaxy;
	#	has Nebula @.nebula;

	method create() {

	}
}
