role Galaxy::Physics::Star {


	token star { <<
    <star-name>  <hyphen>?
    <star-age>?  <hyphen>?
    <star-core>? <hyphen>?
    <star-tag>?  <hyphen>?
    <star-form>? <dot>?
		<star-tail>?
		<!after <[.-]>> 
    >>
	}

	token star-name							{ [ <.alnum>+ <!before <dot>> ]+ % <hyphen> }
	token star-age							{ [ $<agepart> = <.digit>+ ]+ % <dot> }  

	proto token star-core 			{ * }
	token star-core:sym<x86_64>	{ <sym> }
	token star-core:sym<i386>		{ <sym> }

	token star-tag							{ <.alnum>+ }  # start with alpha
	token star-form							{ <.digit>+ }
	token star-tail							{ 'xyz' }

	token hyphen                { '-' }
	token dot                   { '.' }

}
