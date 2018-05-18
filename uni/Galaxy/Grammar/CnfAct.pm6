class Galaxy::Grammar::CnfAct {

  method galaxy-law:sym<core>($/)     { make $<sym>.Str => $<value>.made }
  method galaxy-law:sym<yolo>($/)     { make $<sym>.Str => True }
  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }

  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<cluster>($/)   { make $<sym>.Str => True }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<value>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<value>.made }
}
