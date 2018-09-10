#use Galaxy::Physics::Op;
use Galaxy::Physics::Dep;
use Galaxy::Physics::Planet;

# Bug: mv Galaxy::Physics::OP.satisfy .
#multi sub infix:<satisfy> ($star, Galaxy::Physics::Dep $dep) {
#  my $xage = Version.new($star.age);
#  my $dage = Version.new($dep.age) if $dep.age;
#	return False if $star.name !~~ $dep.name;
#  $xage ~~ $dage;
  #return $star if $xage ~~ $dage;
#}

class Galaxy::Physics::Star {

  has Str     $.name is required;
  has Str     $.age;
  has Str     $.tag;
  has Str     $.core;
  has Int     $.form;
  has Str     $.tail;
  has Any     $.location;
  has Any     $.chksum;
  has Galaxy::Physics::Dep    @.cluster;
  has Galaxy::Physics::Planet @.planet;

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
