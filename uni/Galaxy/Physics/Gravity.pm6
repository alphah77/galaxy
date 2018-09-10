use Galaxy::Physics::Star;

class Galaxy::Physics::Gravity {

	has Bool $.cluster = False;
	has Str  $.core    = chomp qx<uname -m>;

  has Galaxy::Physics::Star $.star;

  method pull(:@star) {
#say @star;

  }
}
