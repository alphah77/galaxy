use Galaxy::Physics::Xyz;

class Galaxy::Physics::Blackhole {

	has Bool $.cluster = False;
	has Str  $.core    = chomp qx<uname -m>;

  has Galaxy::Physics::Xyz @.xyz;

  method suck {

  }
}
