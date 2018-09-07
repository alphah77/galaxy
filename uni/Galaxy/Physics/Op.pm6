#use Galaxy::Physics::Dep;
#use Galaxy::Physics::Xyz;

#Bug Circular module dependency
unit module Galaxy::Physics::Op;

# revisit: custom Op name
#sub infix:<satisfy> (Galaxy::Physics::Xyz $xyz, Galaxy::Physics::Dep $dep) is export {
sub infix:<satisfy> ($xyz, $dep) is export {
	return False if not $xyz;
	return False if $xyz.name !~~ $dep.name;
  my $xage = Version.new($xyz.age);
  my $dage = Version.new($dep.age) if $dep.age;
  $xage ~~ $dage; 
  #return $xyz if $xage ~~ $dage; 
}
