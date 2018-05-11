role Galaxy::Physics::Object::Actions {

	has %.object;

	method object:sym<gravity>($/)		{ %!object = $<sym>.Str => True	}
	method object:sym<blackhole>($/)	{ %!object = $<sym>.Str => True	}

#	method object-laws:sym<gravity>($/)		{ make $<gravity-laws>.ast	}
#	method object-laws:sym<blackhole>($/)	{ make $<blackhole-laws>.ast	}


}
