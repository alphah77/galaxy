class Nebula {
	has $.name;
	has $.location; # URL
	has $.proto =  $!location ~~ /.* <?before ':'>/ && ~$/;

}
