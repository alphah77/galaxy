use Physics::Star;

class Physics::Gravity {

	has IO  $.origin;

	has Str $.core = chomp qx<uname -m>;

  has Physics::Star $.star;

  method pull(:@star) {
    @star.say
  }
}
