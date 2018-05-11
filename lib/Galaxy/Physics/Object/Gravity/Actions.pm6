role Galaxy::Physics::Object::Gravity::Actions {

	has %.gravity-laws;

	method gravity-laws($/)	{ %!gravity-laws = $<gravity-law>».ast.hash	}
	
	method gravity-law:sym<origin>($/)		{ make $<sym>.Str => $<value>.made }
	method gravity-law:sym<core>($/)			{ make $<sym>.Str => $<value>.made }
	method gravity-law:sym<cluster>($/)	{ make $<sym>.Str => True }

}
