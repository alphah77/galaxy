class Alien {
	has $.laws;

	method TWEAK()	{
		$!laws<name>	= ~$*USER;
		$!laws<id>		= +$*USER;
		$!laws<power>; # To be used for Alien permession later.
	}

	method command() {

	}

	method spot() {

	}

	method decide()	{

	}

}
