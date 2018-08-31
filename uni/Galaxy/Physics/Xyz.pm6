use Galaxy::Physics::Op;
use Galaxy::Physics::Dep;
use Galaxy::Physics::Planet;

# Bug: mv Galaxy::Physics::OP.satisfy .
#multi sub infix:<satisfy> ($xyz, Galaxy::Physics::Dep $dep) {
#  my $xage = Version.new($xyz.age);
#  my $dage = Version.new($dep.age) if $dep.age;
#	return False if $xyz.name !~~ $dep.name;
#  $xage ~~ $dage;
  #return $xyz if $xage ~~ $dage;
#}

class Galaxy::Physics::Xyz {

  has Str     $.name is required;
  has Str     $.age;
  has Str     $.tag;
  has Str     $.core;
  has Int     $.form;
  has Str     $.tail;
  has Any     $.location;
  has Any     $.chksum;
	has Galaxy::Physics::Dep    @.dep;
  has Galaxy::Physics::Xyz    @.cluster;
  has Galaxy::Physics::Planet @.planets;

  method add-dep(@dep --> Nil) {
    @dep.map: -> %h { @.dep.push: Galaxy::Physics::Dep.new: |%h };
	}

  method add-cluster(@xyz --> Nil) {
    @!cluster.append: @xyz;
	}

  method stable(--> Bool) {
	@!dep>>.say;
	@!cluster>>.say;
	True;
	}

	method print-dep() {
	  @!cluster>>.print-dep;

    for @!dep -> $d {
      say $d.name, " ", $d.age, ":  ",;

		}

	}

	method print-cluster() {
	  @!cluster>>.print-cluster;
		.name.say for @!cluster;

	}

}
