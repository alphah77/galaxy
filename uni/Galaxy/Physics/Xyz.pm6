use Galaxy::Physics::Planet;
use Galaxy::Physics::Dep;

class Galaxy::Physics::Xyz {

#	my class Dep {

#		has Str $.name is required;
#		has Any $.age;
#  }

  has Str     $.name is required;
  has Str     $.age;
  has Str     $.tag;
  has Str     $.core;
  has Int     $.form;
  has Str     $.tail;
  has Any     $.location;
  has Any     $.chksum;
	#has Galaxy::Physics::Dep    @.dep;
	has     $.dep;
  has Galaxy::Physics::Xyz    @.cluster is rw;
  has Galaxy::Physics::Planet @.planets;

  #method add-dep(%h --> Nil) {
  #  @.dep.push: Dep.new: |%h;
	#}

  method add-cluster($xyz --> Nil) {
		#say "CLUSTER: ", $xyz;
    @.cluster.push: $xyz;
	}

}
