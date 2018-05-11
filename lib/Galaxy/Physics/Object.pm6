role Galaxy::Physics::Object {

	proto rule object { * }
	rule object:sym<gravity>		{ <sym> }
	rule object:sym<blackhole>	{ <sym> }
	
	proto rule object-laws { * }
	rule	object-laws:sym<gravity>		{ <?after <sym> > <gravity-laws> }
	rule	object-laws:sym<blackhole>	{ <?after <sym> > <blackhole-laws> }

}
