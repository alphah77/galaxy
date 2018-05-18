grammar Galaxy::Grammar::Cnf {

  token CNF { 'CNF' }

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
}
