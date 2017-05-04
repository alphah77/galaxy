#use Star;

class Nebula {
	has $.name;
	has $.location; # URL
	has $.proto;

	method TWEAK()	{
		$!proto =  $!location ~~ /.* <?before ':'>/ && ~$/;
	}

	method has($star)	{

	}

}
