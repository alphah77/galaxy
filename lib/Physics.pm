#use Grammar::Debugger;

class Laws {...}

grammar LawCnf {
	token laws	{ <realm>*	} 

	token realm	{	<object> <object-laws> }

	proto token object-laws { * }
	token object-laws:sym<galaxy-laws>		{ <?after '<' galaxy			'>' \n+	> <galaxy-laws> }
	token object-laws:sym<gravity-laws>		{ <?after '<' gravity		'>' \n+	> <gravity-laws> }
	token object-laws:sym<blackhole-laws>	{ <?after '<' blackhole	'>' \n+	>	<blackhole-laws> }
	token object-laws:sym<nebula-laws>		{ <?after	'<' nebula	'>' \n+	>	<nebula-laws> }

	proto token object					{ * }
	token object:sym<galaxy>		{ '<' <sym> '>' \n+	}	
	token object:sym<gravity>		{ '<' <sym> '>' \n+	}	
	token object:sym<blackhole>	{ '<' <sym> '>' \n+	}	
	token object:sym<nebula>		{ '<' <sym> '>' \n+	}	

	token galaxy-laws			{ [ <ws> <galaxy-law> <ws> \n+ | <comment> ]*	}
	proto token galaxy-law				{ * }
	token galaxy-law:sym<origin>	{ <sym> <space>+ <value> }
	token galaxy-law:sym<core>		{ <sym> <space>+ <value> }
	token galaxy-law:sym<yolo>		{ <sym> }
	token galaxy-law:sym<imagine>	{ <sym> }
	token galaxy-law:sym<nocolor>	{ <sym> }

	token gravity-laws							{ [ <ws> <gravity-law>  <ws> \n+ | <comment> ]*	}
	proto token gravity-law					{ * }
	token gravity-law:sym<origin>		{ <sym> <space>+ <value> }
	token gravity-law:sym<core>			{ <sym> <space>+ <value> }
	token gravity-law:sym<cluster>	{ <sym> <ws> }
	token gravity-law:sym<dummy>		{ <sym> <ws> }

	token blackhole-laws							{ [ <ws> <blackhole-law> <ws> \n+ | <comment> ]*	}
	proto token blackhole-law					{ * }
	token blackhole-law:sym<origin>		{ <sym> <space>+ <value> }
	token blackhole-law:sym<core>			{ <sym> <space>+ <value> }
	token blackhole-law:sym<cluster>	{ <sym> <ws> }

	token nebula-laws			{ [ <ws> <nebula-law> <ws> \n+ | <comment> ]*	}
	token nebula-law			{ <nebula-name> <ws> <nebula-location> }
	token nebula-name			{ <!before \s>  <(\w+)>  <!after \s>	}
	token nebula-location	{ <!before \s> <-[\n #]>+ <!after \s> }

	token value		{ <!before \s> <-[\n #]>+ <!after \s> }
	token comment	{ '#' \N*\n+ }
	token ws			{ \h* }

	method create(Str $laws, :$rule = 'laws')	{
		my $m = self.parsefile($laws, :actions(Laws), :$rule);
		die "Laws file is not consistent" unless $m;
		return $m.made;
		}
}


grammar LawCmd	{

	token TOP				{ <galaxy-laws>? <ws> <object>? <ws> <object-laws>? <ws> <star>?}

	token galaxy-laws							{ [ <ws> <galaxy-law> <law-end> ]*	}
	proto token galaxy-law				{ * }
	token galaxy-law:sym<origin>	{ <sym> <space>+ <value> }
	token galaxy-law:sym<core>		{ <sym> <space>+ <value> }
	token galaxy-law:sym<laws>		{ <sym> <space>+ <value> }
	token galaxy-law:sym<yolo>		{ <sym> }
	token galaxy-law:sym<imagine>	{ <sym> }
	token galaxy-law:sym<nocolor>	{ <sym> }

	proto token object { * }
	#token object:sym<galaxy>		{ ^ 		}
	token object:sym<gravity>		{ <sym> }
	token object:sym<blackhole> { <sym> }

	proto token object-laws { * }
	token object-laws:sym<galaxy-laws>		{ <galaxy-laws> <?before <object>> }
	token object-laws:sym<gravity-laws>		{ <?after 'gravity'		<space>+> <gravity-laws> }
	token object-laws:sym<blackhole-laws>	{ <?after 'blackhole'	<space>+> <blackhole-laws> }

	token gravity-laws							{ [ <ws> <gravity-law> \h* ]* }
	proto token gravity-law					{ * }
	token gravity-law:sym<origin>		{ <sym> <space>+ <value> }
	token gravity-law:sym<core>			{ <sym> <space>+ <value> }
	token gravity-law:sym<cluster>	{ <sym> }
	token gravity-law:sym<dummy>		{ <sym> }


	token blackhole-laws							{ [ <ws> <blackhole-law> \h* ]*	}
	proto token blackhole-law					{ * }
	token blackhole-law:sym<origin>		{ <sym> <space>+ <value> }
	token blackhole-law:sym<core>			{ <sym> <space>+ <value> }
	token blackhole-law:sym<cluster>	{ <sym> }

	#token value			{ <!before \s>  <(<graph>+)>  <!after \s>	}
	token value			{ <!before \s> <-[ \s ]>+ <!after \s> }

	token star {
        |       <star-name> <star-age> <star-core> <star-form> <star-tag> <star-tail> # Can probably be written cleaner
        |       <star-name> <star-age> <star-core> <star-form> <star-tag>
        |       <star-name> <star-age> <star-core> <star-form> <star-tail>
        |       <star-name> <star-age> <star-core> <star-form>
        |       <star-name> <star-age> <star-core>
        |       <star-name> <star-age>
        |       <star-name>
  }
	regex star-name							{  <alnum>+ [ '-' <alnum>+ ]* <!before '.'> } # Don't mess with this :(
	token star-age							{ '-' <(<digit>+ ['.' <digit>+]+)> }  
	proto token star-core 			{ * }
	token star-core:sym<x86_64>	{ '-' <(<sym>)> }
	token star-core:sym<i386>		{ '-' <(<sym>)> }
	token star-form							{ '-' <(<digit>+)> }
	token star-tag							{ '-' <(<alnum>+)> } 
	token star-tail							{ '.' <('xyz')> }
	
	token ws			{ \h* }
	token law-end { \h* }

	method create(Str $laws, :$rule = 'TOP')	{
		my $m = self.parse($laws, :actions(Laws), :$rule);
		die "Laws are not consistent" unless $m;
		return $m.made;
	}
}


class Laws		{

	#method TOP ($/) { make { galaxy => $<galaxy-laws>.made, active-object => $<object>.made, $<object>.made => $<object-laws>.made, "active-star" => $<star>.made } }
	method TOP ($/) { 
		# This method need some love :)
		my $laws = $<galaxy-laws>.ast<laws>:exists ?? $<galaxy-laws>.ast<laws> !! '/etc/galaxy/laws';

		#TODO: manage errors!
		die "$laws: Does not exist!" unless $laws.IO.f;


		my %physics = LawCnf.create($laws);
		# TODO: hide error Use of Nil in string context
		# If $<object> does not exist in laws file, create empty hash otherwise hyper operator will fail.
		%physics<galaxy> = {} unless %physics<galaxy>:exists;
		#	say "g cnf: " ~  %physics<galaxy>.perl;
		#say "g cmd: " ~  $<galaxy-laws>.ast.perl;
		%physics<galaxy> <<=<< $<galaxy-laws>.ast;
		if $<object-laws> {
				%physics{$<object>} = {} unless %physics{$<object>}:exists;
				#say "o cnf: " ~  %physics{$<object>.ast}.perl if $<object>;
				#		say "o cmd: " ~  $<object-laws>.ast.perl if $<object>;
			%physics{$<object>.ast} <<=<< $<object-laws>.ast;
		}
		%physics<star> <<=<< $<star>.ast if $<star>;
		#%physics<galaxy> »=« $<galaxy-laws>.ast;

		#%physics<actobject> = $<object>.ast;

		make %physics;
	}
	#
	method laws($/)			{ make $<realm>».ast }

	method object-laws:sym<galaxy-laws>($/)			{ make $<galaxy-laws>.made	}
	method object-laws:sym<gravity-laws>($/)		{ make $<gravity-laws>.made	}
	method object-laws:sym<blackhole-laws>($/)	{ make $<blackhole-laws>.made	}
	method object-laws:sym<nebula-laws>($/)			{ make $<nebula-laws>.made	}

	method galaxy-laws($/)							{ make $<galaxy-law>».ast.hash	}
	method galaxy-law:sym<core>($/)			{ make $<sym>.Str => $<value>.made }
	method galaxy-law:sym<origin>($/)		{ make $<sym>.Str => $<value>.made }
	method galaxy-law:sym<laws>($/)			{ make $<sym>.Str => $<value>.made }
	method galaxy-law:sym<yolo>($/)			{ make $<sym>.Str => True	}
	method galaxy-law:sym<imagine>($/)	{ make $<sym>.Str => True	}
	method galaxy-law:sym<nocolor>($/)	{ make $<sym>.Str => True	}


	method gravity-laws($/)							{ make $<gravity-law>».ast.hash	}
	method gravity-law:sym<core>($/)		{ make $<sym>.Str => $<value>.made }
	method gravity-law:sym<origin>($/)	{ make $<sym>.Str => $<value>.made }
	method gravity-law:sym<cluster>($/)	{ make $<sym>.Str => True	}
	method gravity-law:sym<dummy>($/)		{ make $<sym>.Str => True	}


	method blackhole-laws($/)							{ make $<blackhole-law>».ast.hash	}
	method blackhole-law:sym<core>($/)		{ make $<sym>.Str => $<value>.made }
	method blackhole-law:sym<origin>($/)	{ make $<sym>.Str => $<value>.made }
	method blackhole-law:sym<cluster>($/)	{ make $<sym>.Str => True	}

	method nebula-laws($/)			{ make $<nebula-law>».ast.hash	}
	method nebula-law($/)				{ make $<nebula-name>.made => $<nebula-location>.made }
	method nebula-name($/)			{ make $/.Str	}
	method nebula-location($/)	{ make $/.Str	}

	#method object:sym<galaxy>($/)			{ make $<sym> ?? $<sym>.Str !! "galaxy"	} 
	method object:sym<galaxy>($/)			{ make $<sym>.Str } 
	method object:sym<gravity>($/)		{ make $<sym>.Str	} 
	method object:sym<blackhole>($/)	{ make $<sym>.Str	} 
	method object:sym<nebula>($/)			{ make $<sym>.Str	} 


	method star($/) 			{ make $/.Str	}
	method star-name($/) 	{ make "star-name"	=> $/.Str }
	method star-age($/) 	{ make "star-age"		=> $/.Str	}
	method star-core($/) 	{ make "star-core"	=> $/.Str }
	method star-build($/) { make "star-build"	=> $/.Str }
	method star-tag($/) 	{ make "star-tag"		=> $/.Str }
	method star-ext($/) 	{ make "star-ext"		=> $/.Str }

	method realm($/)	{ make $<object>.made => $<object-laws>.made}	
	method value($/) 	{ make $/.Str	}
}


