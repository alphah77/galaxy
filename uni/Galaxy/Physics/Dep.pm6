#use Galaxy::Physics::Op;

class Galaxy::Physics::Dep {

  #has Str $.name is required;
  has Str $.name;
  has Any $.age;
	has     $.star is rw;

  method satisfied(--> Bool) {
    self.satisfy($!star);    
	}

	method satisfy($star --> Bool) {
    #say "XYZ ", $star;
		return False if not $star;
		return False if $star.name !~~ $!name;
		my $xage = Version.new($star.age);
		my $dage = Version.new($!age) if $!age;

		$xage ~~ $dage;
	}

}
