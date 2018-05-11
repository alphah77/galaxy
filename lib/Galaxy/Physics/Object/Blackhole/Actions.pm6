role Galaxy::Physics::Object::Blackhole::Actions {

	has %.blackhole-laws;

	method blackhole-laws($/)	{ %!blackhole-laws = $<blackhole-law>».ast.hash	}

	method blackhole-law:sym<cluster>($/)	{ make $<sym>.Str => True }
	method blackhole-law:sym<core>($/)		{ make $<sym>.Str => $<value>.made }
	method blackhole-law:sym<origin>($/)	{ make $<sym>.Str => $<value>.made }

}
