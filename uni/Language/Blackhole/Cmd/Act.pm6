role Language::Blackhole::Cmd::Act {

  has %.blackhole;

  method blackhole($/)  { %!blackhole<active> => True }

  method blackhole-laws($/) { %!blackhole = $<blackhole-law>».ast.hash  }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<value>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<value>.made }

}

