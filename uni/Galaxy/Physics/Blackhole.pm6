use Galaxy::Physics::Star;

class Galaxy::Physics::Blackhole {

	has Bool $.cluster = False;
	has Str  $.core    = chomp qx<uname -m>;

  has Galaxy::Physics::Star @.star;

  method suck {

  }
}
