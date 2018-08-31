
class Galaxy::Physics::Dep {

  #has Str $.name is required;
  has Str $.name;
  has Any $.age;
#	has     $.xyz;

#	method satisfy($xyz --> Nil) {
#	say "XYZ ", $xyz;
#		return if not $xyz;
#		return if $xyz.name !~~ $!name;
#		my $xage = Version.new($xyz.age);
#		my $dage = Version.new($!age) if $!age;
#		$!xyz = $xyz if $xage ~~ $dage;
#	}

}
