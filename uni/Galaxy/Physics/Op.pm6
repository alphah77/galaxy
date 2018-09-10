#use Galaxy::Physics::Dep;
#use Galaxy::Physics::Star;

#Bug Circular module dependency
unit module Galaxy::Physics::Op;

# revisit: custom Op name
#sub infix:<satisfy> (Galaxy::Physics::Star $star, Galaxy::Physics::Dep $dep) is export {
sub infix:<satisfy> ($star, $dep) is export {
	return False if not $star;
	return False if $star.name !~~ $dep.name;
  my $xage = Version.new($star.age);
  my $dage = Version.new($dep.age) if $dep.age;
  $xage ~~ $dage; 
  #return $star if $xage ~~ $dage; 
}
