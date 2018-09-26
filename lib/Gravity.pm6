use Star;

class Gravity {

	has IO  $.origin;

	has Str $.core = chomp qx<uname -m>;

  has Star $.star;

  method pull(:@star) {
    say <pull>, @star;
  }
}
