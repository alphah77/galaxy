use Galaxy::Grammar::StarAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::StarAct;


  method CMD:sym<gravity>($/) { 
    my %law;

    %law<galaxy>  = $<galaxy-laws>.ast   if $<galaxy-laws>.defined;
    %law<galaxy><star>  = $<stars>.ast;
    %law<gravity> = $<gravity-laws>.ast  if $<gravity-laws>.defined;

    make %law;
  }

  method CMD:sym<blackhole>($/) { 
    my %law;

    %law<galaxy>    = $<galaxy-laws>.ast  if $<galaxy-laws>.defined;
    %law<galaxy><star>  = $<stars>.ast;
    %law<blackhole> = $<blackhole-laws>.ast if $<blackhole-laws>.defined;

    make %law;
  }

  method CMD:sym<spacetime>($/) { 
    my %law;

    %law<galaxy>    = $<galaxy-laws>.ast  if $<galaxy-laws>.defined;
    %law<galaxy><star>  = $<stars>.ast;
    %law<spacetime> = $<spacetime-laws>.ast if $<spacetime-laws>.defined;

    make %law;
  }

  method CMD:sym<star>($/) { 
    my %law;

    %law<galaxy>         = $<galaxy-laws>.ast     if $<galaxy-laws>.defined;
    %law<galaxy><star>  = $<stars>.ast;
    %law<star>           = $<star-laws>.ast       if $<star-laws>.defined;

    make %law;
  }

  method CMD:sym<galaxy>($/) { 
    my %law;

    %law<galaxy> = $<galaxy-laws>.ast     if $<galaxy-laws>.defined;
    %law<galaxy><star>.push: $<star>.ast         if $<star>.defined;

    make %law;
  }



  method star-laws($/)      { make $<star-law>».ast.hash }
  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }
  method spacetime-laws($/) { make $<spacetime-law>».ast.hash }

  method star-law:sym<remote>($/)   { make $<sym>.Str => True }

  method galaxy-law:sym<yolo>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<cool>($/)   { make $<sym>.Str => True }
  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }
  method galaxy-law:sym<law>($/)    { make $<sym>.Str => $<location>.made }
  method galaxy-law:sym<nebula>($/) { make $<sym>.Str => $<location>.made }
  method galaxy-law:sym<core>($/)   { make $<sym>.Str => $<core>.made }
  method galaxy-law:sym<origin>($/) { make $<sym>.Str => $<location>.made }

  method gravity-law:sym<core>($/)      { make $<sym>.Str => $<core>.made }
  method gravity-law:sym<cluster>($/)   { make $<sym>.Str => True }
  method gravity-law:sym<origin>($/)    { make $<sym>.Str => $<location>.made }

  method blackhole-law:sym<cluster>($/) { make $<sym>.Str => True }
  method blackhole-law:sym<core>($/)    { make $<sym>.Str => $<core>.made }
  method blackhole-law:sym<origin>($/)  { make $<sym>.Str => $<location>.made }

  method spacetime-law:sym<travel>($/)  { make $<sym>.Str => $<event>.made }

  method core($/)     { make $/.Str }
  method event($/)     { make $/.Str }
  method value($/)    { make $/.Str }
  method location($/) { make $/.IO }

}
