class Galaxy::Physics::Gravity {

	has Bool $.cluster =  False;
	has Str  $.core    = chomp qx<uname -m>;

  method pull {

  }
}
