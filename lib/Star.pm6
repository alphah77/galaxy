use Star::Xyz;
use Star::Planet;

class Star {
  also does Star::Xyz;

  has Star::Planet  @.planet;
}
