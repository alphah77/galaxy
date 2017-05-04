class Alien {
	has $.laws;

	method TWEAK()	{
		$!laws<name>	= ~$*USER;
		$!laws<id>		= +$*USER;
		$!laws<power>;
	}

	method telescope() {

	}

	method decide()	{

	}

}
