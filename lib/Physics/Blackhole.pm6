use Physics::Star;

class Physics::Blackhole {

	has IO  $.origin;

	has Str $.core = chomp qx<uname -m>;

  has Physics::Star @.star;

  method suck {

  }
}
