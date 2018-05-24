use Galaxy::Grammar::StarAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::StarAct;

  has %!law;

  method CMD:sym<gravity>($/)    { 
    %!law<gravity> = $<gravity>.ast;
    %!law<galaxy>  = $<galaxy>.ast;
    %!law<star>    = $<stars>.ast    if $<stars>.defined;
    make %!law;
  }

  method CMD:sym<blackhole>($/)    { 
    %!law<galaxy>    = $<galaxy>.ast;
    %!law<blackhole> = $<blackhole>.ast;
    %!law<star>      = $<stars>.ast      if $<stars>.defined;
    make %!law;
  }

  method CMD:sym<galaxy>($/)    { 
    %!law<galaxy> = $<galaxy>.ast;
    %!law<star>   = $<star>.ast        if $<star>.defined;
    make %!law;
  }

  method galaxy($/)    { make $<galaxy-laws>.ast    if $<galaxy-laws>.defined }
  method gravity($/)   { make $<gravity-laws>.ast   if $<gravity-laws>.defined }
  method blackhole($/) { make $<blackhole-laws>.ast if $<blackhole-laws>.defined }

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

  method stars($/)  { make $<star>».ast }
  method value($/)  { make $/.Str }

}
