class Galaxy::Grammar::NebulaAct {
  has %!law;

  method NEBULA($/) { 
    %!law = $<nebula>».ast.hash;
    make %!law;
  }

  method nebula($/)    { make $<name>.ast => { name => $<name>.ast,  $<nebula-laws>.ast } }

  method nebula-laws($/)    { make $<nebula-law>».ast.hash }

  method nebula-law:sym<location>($/) { make $<location>.ast }
  method nebula-law:sym<disable>($/)  { make $<sym>.Str => True }

  method location:sym<local>($/)  { make { path => $<path>.ast } } 
  method location:sym<remote>($/) {
    make {
			path   => $<path>.IO,
			port   => $<port>.Int,
			proto  => $<proto>.Str,
			remote => $<remote>.Str,
    }
  } 

  method name($/)   { make $/.Str }
  method remote($/) { make $/.Str }
  method path($/)   { make $/.IO }


}
