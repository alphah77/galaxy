use Galaxy::Grammar::Star;

grammar Galaxy::Grammar::Cmd {
  also does Galaxy::Grammar::Star;

  token CMD {  # rejex backtrack: yolo blackhole # star => blackhole
    |  <galaxy-laws>?  <.space>* <gravity>?    <.space>* <gravity-laws>?   <.space>* <star>?
    |  <galaxy-laws>?  <.space>* <blackhole>?  <.space>* <blackhole-laws>? <.space>* <star>?
  }

  token galaxy { 'galaxy' }
  token galaxy-laws { <galaxy-law>+ % <space> } 

  token gravity { << 'gravity' >> }
  token gravity-laws  { <?after 'gravity' <space>> <gravity-law>+ % <space> }

  token blackhole { <<'blackhole'>> }
  token blackhole-laws  { <?after 'blackhole' <space>> <blackhole-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<core>    { <sym> <space>* <value> }
  token galaxy-law:sym<yolo>    { <<<sym>>> }
  token galaxy-law:sym<pretty> { <<<sym>>> }

  proto token gravity-law { * }
  token gravity-law:sym<core>    { <sym> <space>* <value> }
  token gravity-law:sym<origin>  { <sym> <space>* <value> }
  token gravity-law:sym<cluster> { <<<sym>>> }

  proto token blackhole-law { * }
  token blackhole-law:sym<core>    { <sym> <space>* <value> }
  token blackhole-law:sym<origin>  { <sym> <space>* <value> }
  token blackhole-law:sym<cluster> { <<<sym>>> }

  token value { <!before \s> <-[ \s ]>+ <!after \s> }
}
