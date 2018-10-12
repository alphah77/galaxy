use Star::Xyz;
use Star::Planet;

class Star {
  also does Star::Xyz;

  has Star::Planet  @.planet;

	method print-dep($indent = 0) {
	  
    @!dep.map({ .star.print-dep($indent + 1) });
		$!name.indent($indent).say;
	}

}
