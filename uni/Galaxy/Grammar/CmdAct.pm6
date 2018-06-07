use Galaxy::Grammar::StarNameAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::StarNameAct;

  has %!law;

  method CMD:sym<gravity>($/) { 
    $<galaxy>.ast;
    $<gravity>.ast;
    %!law<stars> = $<star-name>».ast if $<star-name>.defined;

    make %!law;
  }

  method CMD:sym<blackhole>($/) { 
    $<galaxy>.ast;
    $<blackhole>.ast;
    %!law<stars>      = $<star-name>».ast if $<star-name>.defined;

    make %!law;
  }

  method CMD:sym<star>($/) { 
    $<star>.ast;
    $<galaxy>.ast;
    %!law<stars> = $<star-name>».ast if $<star-name>.defined;

    make %!law;
  }

  method CMD:sym<galaxy>($/) { 
    $<galaxy>.ast;
    %!law<stars> = $<star-name>».ast if $<star-name>.defined;

    make %!law;
  }

  method star($/)      { make %!law<star>      = $<star-laws>.ast      if $<star-laws>.defined }
  method galaxy($/)    { make %!law<galaxy>    = $<galaxy-laws>.ast    if $<galaxy-laws>.defined }
  method gravity($/)   { make %!law<gravity>   = $<gravity-laws>.ast   if $<gravity-laws>.defined }
  method blackhole($/) { make %!law<blackhole> = $<blackhole-laws>.ast if $<blackhole-laws>.defined }

  method star-laws($/)      { make $<star-law>».ast.hash }
  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }

  method star-law:sym<remote>($/)   { make $<sym>.Str => True }

  method galaxy-law:sym<yolo>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<cool>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }
  method galaxy-law:sym<law>($/)    { make $<sym>.Str => $<location>.made }
  method galaxy-law:sym<core>($/)   { make $<sym>.Str => $<core>.made }
  method galaxy-law:sym<origin>($/) { make $<sym>.Str => $<location>.made }

  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<core>.made }
  method gravity-law:sym<cluster>($/)   { make $<sym>.Str => True }
  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<location>.made }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<core>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<location>.made }


  method core($/)     { make $/.Str }
  method value($/)    { make $/.Str }
  method location($/) { make $/.IO }

}
