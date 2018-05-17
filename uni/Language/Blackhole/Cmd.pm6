role Language::Blackhole::Cmd {


  token blackhole { <<'blackhole'>> }

  token blackhole-laws  { <?after 'blackhole' <space>> <blackhole-law>+ % <space> } 

  proto token blackhole-law { * }
  token blackhole-law:sym<core>    { <sym> <space>* <value> }
  token blackhole-law:sym<origin>  { <sym> <space>* <value> }
  token blackhole-law:sym<cluster> { <<<sym>>> }

}

