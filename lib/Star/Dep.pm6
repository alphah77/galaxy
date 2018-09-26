#use Op;
use Star::Xyz;

class Star::Dep {
  also does Star::Xyz;

	has $.star is rw;

  method satisfied(--> Bool) {
    self.satisfy($!star);    
	}

	method satisfy($star --> Bool) {
		return False if not $star;
		return False if $star.name !~~ $!name;
		$star.age ~~ $!age;
	}

}
