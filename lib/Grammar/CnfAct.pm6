use Cro::Uri;

class Grammar::CnfAct {
    has %!law;

  method CNF($/) { 
    make %!law;
  }

  method object:sym<galaxy>($/)    { make %!law<galaxy>      = $<galaxy-laws>.ast    }
  method object:sym<gravity>($/)   { make %!law<gravity>     = $<gravity-laws>.ast   }
  method object:sym<blackhole>($/) { make %!law<blackhole>   = $<blackhole-laws>.ast }
  method object:sym<nebula>($/)    { make %!law<nebula>.push:  $<nebula-laws>.ast    }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash    }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash   }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }
  method nebula-laws($/)    { make $<nebula-law>».ast.hash    }

  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }
  method galaxy-law:sym<cool>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<yolo>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<core>($/)   { make $<sym>.Str => $<core>.ast }
  method galaxy-law:sym<origin>($/) { make $<sym>.Str => $<path>.ast }

  method gravity-law:sym<cluster>($/) { make $<sym>.Str => True }
  method gravity-law:sym<origin>($/)  { make $<sym>.Str => $<path>.ast }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<path>.ast }

  method nebula-law:sym<url>($/)     { make $<url>.ast }
  method nebula-law:sym<disable>($/) { make $<sym>.Str => True }

  method url($/) {
    make { url => Cro::Uri.parse($/.Str)}
  } 

  method name($/)   { make $/.Str }
  method remote($/) { make $/.Str }
  method path($/)   { make $/.IO }

  method core($/)     { make $/.Str }
  method value($/)    { make $/.Str }


}
