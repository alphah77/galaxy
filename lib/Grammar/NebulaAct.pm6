use Cro::Uri;

class Grammar::NebulaAct {

  method NEBULA ($/)      { make $<nebula>».ast; }
  method nebula ($/)      { make $<nebula-name>.ast => $<nebula-laws>.ast    }
  method nebula-laws ($/) { make $<nebula-law>».ast.hash    }

  method nebula-law:sym<url>($/)     { make $<url>.ast }
  method nebula-law:sym<disable>($/) { make $<sym>.Str => True }

  method url($/) {
    make { url => Cro::Uri.parse($/.Str)}
  } 

  method nebula-name($/)   { make $/.Str }
  method remote($/) { make $/.Str }
  method path($/)   { make $/.IO }

  method core($/)     { make $/.Str }
  method value($/)    { make $/.Str }
}
