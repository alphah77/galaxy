use Grammar::XyzAct;

class Grammar::CmdAct {
  also does Grammar::XyzAct;


  method CMD:sym<gravity>($/) { 
    my %law;

    %law<cmd>           = <gravity>;
    %law<galaxy>        = $<galaxy-laws>.ast   if $<galaxy-laws>.defined;
    %law<gravity>       = $<gravity-laws>.ast  if $<gravity-laws>.defined;
		%law<gravity><star> = $<xyzs>.ast;

    make %law;
  }

  method CMD:sym<blackhole>($/) { 
    my %law;

    %law<cmd>             = <blackhole>;
    %law<galaxy>          = $<galaxy-laws>.ast    if $<galaxy-laws>.defined;
    %law<blackhole>       = $<blackhole-laws>.ast if $<blackhole-laws>.defined;
		%law<blackhole><star> = $<xyzs>.ast;

    make %law;
  }

  method CMD:sym<spacetime>($/) { 
    my %law;

    %law<cmd>       = <spacetime>;
    %law<galaxy>    = $<galaxy-laws>.ast    if $<galaxy-laws>.defined;
    %law<spacetime> = $<spacetime-laws>.ast if $<spacetime-laws>.defined;
    %law<spacetime><event> = $<event>.ast   if $<event>.defined;

    make %law;
  }

  method CMD:sym<nebula>($/) { 
    my %law;

    %law<cmd>          = <nebula>;
    %law<galaxy>       = $<galaxy-laws>.ast     if $<galaxy-laws>.defined;
    %law<nebula>       = $<nebula-laws>.ast     if $<nebula-laws>.defined;
    %law<nebula><star> = $<xyz>.ast;

    make %law;
  }

  method CMD:sym<star>($/) { 
    my %law;

    %law<cmd>          = <star>;
    %law<galaxy>       = $<galaxy-laws>.ast     if $<galaxy-laws>.defined;
    %law<star>         = $<star-laws>.ast       if $<star-laws>.defined;
    %law<star><star>   = $<xyz>.ast;

    make %law;
  }

  method CMD:sym<galaxy>($/) { 
    my %law;

    #%law<cmd> = $<galaxy>.ast;
    %law<cmd>        = <galaxy>;
    %law<galaxy>     = $<galaxy-laws>.ast if $<galaxy-laws>.defined;
		%law<star><star> = $<xyz>.ast   if $<xyz>.defined;
		#%law<planet><planet> = $<xyz>.ast if $<planet>.defined;

    make %law;
  }


  method galaxy($/)    { make 'galaxy' }
  method gravity($/)   { make 'gravity' }
  method blackhole($/) { make 'blackhole' }
  method spacetime($/) { make 'spacetime' }
  method nebula($/)    { make 'nebula' }
  method star($/)      { make 'star' }
  method planet($/)    { make 'planet' }

  method galaxy-laws($/)    { make $<galaxy-law>».ast.hash }
  method gravity-laws($/)   { make $<gravity-law>».ast.hash }
  method blackhole-laws($/) { make $<blackhole-law>».ast.hash }
  method nebula-laws($/)    { make $<nebula-law>».ast.hash }
  method star-laws($/)      { make $<star-law>».ast.hash }
  method planet-laws($/)    { make $<planet-law>».ast.hash }
  method spacetime-laws($/) { make $<spacetime-law>».ast.hash }


  method galaxy-law:sym<yolo>($/)    { make (:yolo) }
  method galaxy-law:sym<cool>($/)    { make (:cool) }
  method galaxy-law:sym<pretty>($/)  { make (:pretty) }
  method galaxy-law:sym<law>($/)     { make (law    => $<location>.made) }
  method galaxy-law:sym<core>($/)    { make (core   => $<core>.made) }
  method galaxy-law:sym<origin>($/)  { make (origin => $<location>.made) }

  method gravity-law:sym<core>($/)    { make (core   => $<core>.made) }
  method gravity-law:sym<cluster>($/) { make (:cluster) }
  method gravity-law:sym<origin>($/)  { make (origin => $<location>.made) }

  method blackhole-law:sym<core>($/)    { make (core   => $<core>.made) }
  method blackhole-law:sym<cluster>($/) { make (:cluster) }
  method blackhole-law:sym<origin>($/)  { make (origin => $<location>.made) }

  method nebula-law:sym<cluster>($/) { make (:cluster) }

  method star-law:sym<remote>($/)   { make (:remote) }

  method spacetime-law:sym<travel>($/)  { make (travel => $<event>.made) }

  method core($/)     { make $/.Str }
  method event($/)    { make $/.Str }
  method value($/)    { make $/.Str }
  method location($/) { make $/.IO }

}
