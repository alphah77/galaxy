class Alien {
	has $.laws;

	method TWEAK()	{
		$!laws<name>	= ~$*USER;
		$!laws<id>		= +$*USER;
		$!laws<power>; # To be used for Alien permession later.
	}

	multi method action(Str :$object)	{
		say $object;

	}

	multi method action(:$object)	{

	}

	method spot() {

	}

	method decide()	{

	}

}
