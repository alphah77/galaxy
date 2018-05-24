class Galaxy::Grammar::CnfAct {
  has %!law;

  method CNF($/) { 
    %!law = $<object>».ast.hash;
    make %!law;
  }

  method object:sym<galaxy>($/)    { make $<sym>.Str => $<galaxy-laws>.ast    }
  method object:sym<gravity>($/)   { make $<sym>.Str => $<gravity-laws>.ast   }
  method object:sym<blackhole>($/) { make $<sym>.Str => $<blackhole-laws>.ast }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }

  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }
  method galaxy-law:sym<cool>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<yolo>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<core>($/)   { make $<sym>.Str => $<value>.made }

  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<cluster>($/)   { make $<sym>.Str => True }
  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<value>.made }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<value>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<value>.made }

}
