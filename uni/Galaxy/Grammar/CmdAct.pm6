use Galaxy::Grammar::StarAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::StarAct;

  has %.law;

 method CMD ($/) { 
  %!law<galaxy>    = $<galaxy-laws>.ast    if $<galaxy-laws>.defined;
  %!law<gravity>   = $<gravity-laws>.ast   if $<gravity-laws>.defined;
  %!law<blackhole> = $<blackhole-laws>.ast if $<blackhole-laws>.defined;
  %!law<star>      = $<star>.ast           if $<star>.defined;
  }

  method galaxy($/)    { }
  method gravity($/)   { %!law<active> = <gravity> }
  method blackhole($/) { %!law<active> = <blackhole> }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }

  method galaxy-law:sym<core>($/)     { make $<sym>.Str => $<value>.made }
  method galaxy-law:sym<yolo>($/)     { make $<sym>.Str => True }
  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }

  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<value>.made }
  method gravity-law:sym<cluster>($/)   { make $<sym>.Str => True }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<value>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<value>.made }

  method value($/)  { make $/.Str }

}
