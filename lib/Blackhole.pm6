use Star;

class Blackhole {

	has IO  $.origin;

	has Str $.core = chomp qx<uname -m>;

  has Star @.star;

  method suck {

  }
}
