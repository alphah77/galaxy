role Language::Gravity::Cmd::Act {

  has %.gravity;

  method gravity($/)  { %!gravity<active> => True }

  method gravity-laws($/) { %!gravity = $<gravity-law>».ast.hash  }
  
  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<cluster>($/) { say "Cluster: "; make $<sym>.Str => True }
}

