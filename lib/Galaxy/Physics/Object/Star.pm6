role Galaxy::Physics::Object::Star {


	regex star { <star-name>  <hyphen>?
               <star-age>?  <hyphen>?
               <star-core>? <hyphen>?
               <star-tag>?  <hyphen>?
               <star-form>? <star-tail>?
	}

	regex star-name							{ [<alnum>+]+ % <hyphen> }
	token star-age							{ [<digit>+]+ % <dot> }  

	proto token star-core 			{ * }
	token star-core:sym<x86_64>	{ <sym> }
	token star-core:sym<i386>		{ <sym> }

	token star-tag							{ <alnum>+ }  # start with alpha
	token star-form							{  <digit>+ }
	token star-tail							{ <dot> <ext> }

	token hyphen                { '-' }
	token dot                   { '.' }
	token ext                   { 'xyz' }

}
