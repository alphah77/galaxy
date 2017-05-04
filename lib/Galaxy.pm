use Gravity;
use Blackhole;
use Star;

class Galaxy {
	has $.laws;
	has Gravity		$.gravity;
	has Blackhole	$.blackhole;
	has Star			$.xyz; # Datastructure for stars

	method TWEAK()	{
		$!laws<name>		=	chomp qx<hostname>;
		$!laws<origin>;
		$!laws<bulge>		= '/etc/galaxy/';
		$!laws<disk>		= $!laws<bulge>	~	'stars/';
		$!laws<halo>		=	'/var/galaxy/';
		$!laws<core>		= chomp qx<uname -m>;
	}

	method stable() {

	}
}
