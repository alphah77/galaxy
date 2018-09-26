#use Op;
use Star::Xyz;
use Star::Dep;
use Star::Planet;

# Bug: mv OP.satisfy .
#multi sub infix:<satisfy> ($star, Dep $dep) {
#  my $xage = Version.new($star.age);
#  my $dage = Version.new($dep.age) if $dep.age;
#	return False if $star.name !~~ $dep.name;
#  $xage ~~ $dage;
  #return $star if $xage ~~ $dage;
#}

class Star {
  also does Star::Xyz;

  has Star::Dep     @.cluster;
  has Star::Planet  @.planet;


  method unstable() {
    @!cluster.map(-> $d { $d if not $d.satisfied });
	}

  method stable(--> Bool) {
    not so self.unstable();
	}

	method print-cluster($indent = 0) {
	  
    @!cluster.map({ .star.print-cluster($indent + 1) });
		$!name.indent($indent).say;
	}

}
