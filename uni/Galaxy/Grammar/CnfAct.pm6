class Galaxy::Grammar::CnfAct {
    has %!laws;

  method CNF($/) { 
    make %!laws;
  }

  method object:sym<galaxy>($/)    { make %!laws<galaxy>      = $<galaxy-laws>.ast    }
  method object:sym<gravity>($/)   { make %!laws<gravity>     = $<gravity-laws>.ast   }
  method object:sym<blackhole>($/) { make %!laws<blackhole>   = $<blackhole-laws>.ast }
  method object:sym<nebula>($/)    { make %!laws<nebulas>.push: $<nebula-laws>.ast    }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash    }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash   }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }
  method nebula-laws($/)    { make $<nebula-law>».ast.hash    }

  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }
  method galaxy-law:sym<cool>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<yolo>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<cluster>($/){ make $<sym>.Str => True }
  method galaxy-law:sym<core>($/)   { make $<sym>.Str => $<core>.ast }
  method galaxy-law:sym<origin>($/) { make $<sym>.Str => $<path>.ast }

  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<core>.ast }
  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<path>.ast }

  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<core>.ast }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<path>.ast }

  method nebula-law:sym<disable>($/)  { make $<sym>.Str => True }
  method nebula-law:sym<url>($/) { make $<url>.ast }

  method url($/) {
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

  method core($/)     { make $/.Str }
  method value($/)    { make $/.Str }


}
