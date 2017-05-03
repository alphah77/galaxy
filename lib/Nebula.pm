#use Star;

class Nebula {
	has $.name;
	has $.location; # URL
	has $.proto =  $!location ~~ /.* <?before ':'>/ && ~$/;

	method has($star)	{

	}

}
