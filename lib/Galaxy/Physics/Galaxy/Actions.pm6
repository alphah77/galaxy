role Galaxy::Physics::Galaxy::Actions {

	has %.galaxy;

	method galaxy-laws($/)		{ %!galaxy = $<galaxy-law>».ast.hash	}

	method galaxy-law:sym<core>($/)			{ make $<sym>.Str => $<value>.made }
	method galaxy-law:sym<yolo>($/)			{ make $<sym>.Str => True }
	method galaxy-law:sym<nocolor>($/)	{ make $<sym>.Str => True }

}
