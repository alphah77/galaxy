use Galaxy::Physics::Star;

class Galaxy::Physics::Blackhole {

	has IO  $.origin;

	has Str $.core = chomp qx<uname -m>;

  has Galaxy::Physics::Star @.star;

  method suck {

  }
}
