role Language::Galaxy::Cmd::Act {

  has %.galaxy;

  method galaxy-laws($/)    { %!galaxy = $<galaxy-law>».ast.hash  }

  method galaxy-law:sym<core>($/)     { make $<sym>.Str => $<value>.made }
  method galaxy-law:sym<yolo>($/)     { make $<sym>.Str => True }
  method galaxy-law:sym<pretty>($/) { make $<sym>.Str => True }

}

