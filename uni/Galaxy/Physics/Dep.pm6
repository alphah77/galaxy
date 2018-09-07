#use Galaxy::Physics::Op;

class Galaxy::Physics::Dep {

  #has Str $.name is required;
  has Str $.name;
  has Any $.age;
	has     $.xyz is rw;

  method satisfied(--> Bool) {
    self.satisfy($!xyz);    
	}

	method satisfy($xyz --> Bool) {
    #say "XYZ ", $xyz;
		return False if not $xyz;
		return False if $xyz.name !~~ $!name;
		my $xage = Version.new($xyz.age);
		my $dage = Version.new($!age) if $!age;

		$xage ~~ $dage;
	}

}
