use Galaxy::Grammar::StarAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::StarAct;

  has %!law;

  method CMD:sym<gravity>($/) { 
    %!law<stars>   = $<star>».ast        if $<star>.defined;
    %!law<galaxy>  = $<galaxy-laws>.ast  if $<galaxy-laws>.defined;
    %!law<gravity> = $<gravity-laws>.ast if $<gravity-laws>.defined;

    make %!law;
  }

  method CMD:sym<blackhole>($/) { 
    %!law<stars>     = $<star>».ast        if $<star>.defined;
    %!law<galaxy>    = $<galaxy-laws>.ast  if $<galaxy-laws>.defined;
    %!law<blackhole> = $<gravity-laws>.ast if $<gravity-laws>.defined;

    make %!law;
  }

  method CMD:sym<star>($/) { 
    $<star>.ast;
    %!law<stars>  = $<star>.ast        if $<star>.defined;
    %!law<star>   = $<star-laws>.ast   if $<star-laws>.defined;
    %!law<galaxy> = $<galaxy-laws>.ast if $<galaxy-laws>.defined;

    make %!law;
  }

  method CMD:sym<galaxy>($/) { 
    %!law<stars>  = $<star>.ast        if $<star>.defined;
    %!law<galaxy> = $<galaxy-laws>.ast if $<galaxy-laws>.defined;

    make %!law;
  }

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
