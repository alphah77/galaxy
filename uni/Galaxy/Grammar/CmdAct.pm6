use Galaxy::Grammar::XyzAct;

class Galaxy::Grammar::CmdAct {
  also does Galaxy::Grammar::XyzAct;


  method CMD:sym<gravity>($/) { 
    my %law;

    %law<cmd>             = $<gravity>.ast;
    %law<star>            = $<xyzs>.ast;
    %law<galaxy>          = $<galaxy-laws>.ast   if $<galaxy-laws>.defined;
    %law<galaxy><gravity> = $<gravity-laws>.ast  if $<gravity-laws>.defined;

    make %law;
  }

  method CMD:sym<blackhole>($/) { 
    my %law;

    %law<cmd>               = $<blackhole>.ast;
    %law<star>              = $<xyzs>.ast;
    %law<galaxy>            = $<galaxy-laws>.ast    if $<galaxy-laws>.defined;
    %law<galaxy><blackhole> = $<blackhole-laws>.ast if $<blackhole-laws>.defined;

    make %law;
  }

  method CMD:sym<spacetime>($/) { 
    my %law;

    %law<cmd>       = $<spacetime>.ast;
    #%law<event>      = $<xyzs>.ast;
    %law<galaxy>    = $<galaxy-laws>.ast    if $<galaxy-laws>.defined;
    %law<spacetime> = $<spacetime-laws>.ast if $<spacetime-laws>.defined;

    make %law;
  }

  method CMD:sym<star>($/) { 
    my %law;

    %law<cmd>          = $<star>.ast;
    %law<star>          = $<xyzs>.ast;
    %law<galaxy>       = $<galaxy-laws>.ast     if $<galaxy-laws>.defined;
    %law<galaxy><star> = $<star-laws>.ast       if $<star-laws>.defined;

    make %law;
  }

  method CMD:sym<galaxy>($/) { 
    my %law;

    #%law<cmd> = $<galaxy>.ast;
    %law<cmd> = <galaxy>;
    %law<star>.push: $<xyz>.ast        if $<xyz>.defined;
    %law<galaxy> = $<galaxy-laws>.ast if $<galaxy-laws>.defined;

    make %law;
  }


  method galaxy($/)    { make <galaxy> }
  method gravity($/)   { make <gravity> }
  method blackhole($/) { make <blackhole> }
  method spacetime($/) { make <spacetime> }
  method star($/)      { make <star> }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }
  method star-laws($/)      { make $<star-law>».ast.hash }
  method spacetime-laws($/) { make $<spacetime-law>».ast.hash }


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

  method star-law:sym<remote>($/)   { make $<sym>.Str => True }

  method spacetime-law:sym<travel>($/)  { make $<sym>.Str => $<event>.made }

  method core($/)     { make $/.Str }
  method event($/)     { make $/.Str }
  method value($/)    { make $/.Str }
  method location($/) { make $/.IO }

}
