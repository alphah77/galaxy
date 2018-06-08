use Galaxy::Physics::Star;

class Galaxy::Physics::Blackhole {

	has Str  $.core    = chomp qx<uname -m>;
	has Bool $.cluster = False;

  has Galaxy::Physics::Star @.star;

  method suck {

  }
}
