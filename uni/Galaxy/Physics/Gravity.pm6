use Galaxy::Physics::Xyz;

class Galaxy::Physics::Gravity {

	has Bool $.cluster = False;
	has Str  $.core    = chomp qx<uname -m>;

  has Galaxy::Physics::Xyz $.xyz;

  method pull(:@xyz) {
say @xyz;

  }
}
