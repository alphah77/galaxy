#use Grammar::Debugger;
#

class Laws {...}

grammar LawCnf {
	token all	{ <realm>*	} 

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

	method create(Str $laws, :$rule = 'all')	{
		my $m = self.parsefile($laws, :actions(Laws), :$rule);
		die "Laws file is not consistent" unless $m;
		return $m.made;
		}
}


grammar LawCmd	{

	regex TOP	{ 
				|			<galaxy-laws> <space>+  <object> <space>+ <object-laws> <space>+ <star>
				|			<galaxy-laws> <space>+  <object> <space>+ <object-laws>
				|			<galaxy-laws> <space>+  <object> <space>+ <star>
				|			<galaxy-laws> <space>+  <object>
				|			<galaxy-laws> <space>+  <star>
				|			<galaxy-laws>
				|			<object> <space>+ <object-laws> <space>+ <star>
				|			<object> <space>+ <object-laws>
				|			<object> <space>+ <star>
				|			<object>
				|			<star>?
	}

	token galaxy-laws							{ [ \s* <galaxy-law> ]+	}
	proto token galaxy-law				{ * }
	token galaxy-law:sym<origin>	{ <sym> <space>* <value> }
	token galaxy-law:sym<core>		{ <sym> <space>* <value> }
	token galaxy-law:sym<laws>		{ <sym> <space>* <value> }
	token galaxy-law:sym<yolo>		{ <sym> }
	token galaxy-law:sym<imagine>	{ <sym> }
	token galaxy-law:sym<nocolor>	{ <sym> }

	proto token object { * }
	token object:sym<gravity>		{ <sym> }
	token object:sym<blackhole> { <sym> }

	proto token object-laws { * }
	#token object-laws:sym<galaxy-laws>		{ <?after ^>											<galaxy-laws> }
	token object-laws:sym<galaxy-laws>		{ <galaxy-laws> <?before <object>> }
	token object-laws:sym<gravity-laws>		{ <?after 'gravity' \s*>  <gravity-laws> }
	token object-laws:sym<blackhole-laws>	{	<?after 'blackhole' \s*> <blackhole-laws> }

	token gravity-laws							{ [ \s* <gravity-law> ]+ }
	proto token gravity-law					{ * }
	token gravity-law:sym<origin>		{ <sym> <space>* <value> }
	token gravity-law:sym<core>			{ <sym> <space>* <value> }
	token gravity-law:sym<cluster>	{ <sym> }
	token gravity-law:sym<dummy>		{ <sym> }

	token blackhole-laws							{ [ \s* <blackhole-law> ]+	}
	proto token blackhole-law					{ * }
	token blackhole-law:sym<origin>		{ <sym> <space>* <value> }
	token blackhole-law:sym<core>			{ <sym> <space>* <value> }
	token blackhole-law:sym<cluster>	{ <sym> }

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
		my $laws = $<galaxy-laws>.ast<laws> ?? $<galaxy-laws>.ast<laws> !! '/etc/galaxy/laws';

		#TODO: manage errors!
		die "$laws: Does not exist!" unless $laws.IO.f;


		my %laws = LawCnf.create($laws);
		# TODO: hide error Use of Nil in string context
		# If $<object> does not exist in laws file, create empty hash otherwise hyper operator will fail.
		%laws<galaxy> = {} unless %laws<galaxy>;
		%laws<galaxy> «=« $<galaxy-laws>.ast if $<galaxy-laws>;
		if $<object-laws> {
			%laws{$<object>} = {} unless %laws{$<object>};
			#say "Ocnf: " ~  %laws{$<object>.ast}.perl if $<object>;
			#say "Ocmd: " ~  $<object-laws>.ast.perl if $<object>;
			%laws{$<object>.ast} «=« $<object-laws>.ast;
		}
		%laws<alien><command> = $<object> ?? $<object>.ast !! "galaxy";
		%laws<star> = $<star>.ast if $<star>;
		#%laws<galaxy> »= $<galaxy-laws>.ast;


		make %laws;
	}
	#
	method all($/)			{ make $<realm>».ast }

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


	method star($/) 			{
		my %star;
		%star<star>	= $/.Str;
		%star<name>	= $<star-name>.Str if $<star-name>;
		%star<age>	= $<star-age>.Str if $<star-age>;
		%star<core>	= $<star-core>.Str if $<star-core>;
		%star<form>	= $<star-form>.Str if $<star-form>;
		%star<tag>	= $<star-tag>.Str if $<star-tag>;
		%star<tail>	= $<star-tail>.Str if $<star-tail>;
		make %star;
		
	}
	method realm($/)	{ make $<object>.made => $<object-laws>.made}	
	method value($/) 	{ make $/.Str	}
}


