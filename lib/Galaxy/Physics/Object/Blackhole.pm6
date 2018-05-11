role Galaxy::Physics::Object::Blackhole	{

	rule	blackhole-laws	{ <blackhole-law>+ }	

	proto rule blackhole-law	{ * }
	rule blackhole-law:sym<core>		{ <sym> <value> }
	rule blackhole-law:sym<origin>	{ <sym> <value> }
	rule blackhole-law:sym<cluster>	{ <sym> }

}
