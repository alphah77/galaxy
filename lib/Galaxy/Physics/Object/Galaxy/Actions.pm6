role Galaxy::Physics::Object::Galaxy::Actions {

	has %.galaxy-laws;

	method galaxy-laws($/)		{ %!galaxy-laws = $<galaxy-law>».ast.hash	}

	method galaxy-law:sym<core>($/)			{ make $<sym>.Str => $<value>.made }
	method galaxy-law:sym<yolo>($/)			{ make $<sym>.Str => True }
	method galaxy-law:sym<nocolor>($/)	{ make $<sym>.Str => True }

}
