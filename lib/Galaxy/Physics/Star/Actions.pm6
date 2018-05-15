role Galaxy::Physics::Star::Actions {

	has %.star-laws;

	method star($/)	{
		%!star-laws<star>	= $/.Str;
		%!star-laws<name>	= $<star-name>.ast;
		%!star-laws<age>		= $<star-age>.ast;
		%!star-laws<core>	= $<star-core>.ast;
		%!star-laws<form>	= $<star-form>.ast;
		%!star-laws<tag>		= $<star-tag>.ast;
		%!star-laws<tail>	= $<star-tail>.ast;
	}

	method star-name($/) { make $/.Str }
	method star-age($/)  { make $/.Str }

	method star-core:sym<x86_64>($/) { make $/.Str }
	method star-core:sym<i386>($/)   { make $/.Str }

	method star-form($/) { make $/.Str }
	method star-tag($/)  { make $/.Str }
	method star-tail($/) { make $/.Str }

}
