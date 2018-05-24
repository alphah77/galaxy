grammar Galaxy::Grammar::Cnf {

  token CNF { <.nl>* <object>* %% <.nl> }

  proto token object { * }
  token object:sym<galaxy>    { '<'<sym>'>' <.nl> <galaxy-laws> }
  token object:sym<gravity>   { '<'<sym>'>' <.nl> <gravity-laws>   }
  token object:sym<blackhole> { '<'<sym>'>' <.nl> <blackhole-laws> }
  
  token galaxy-laws    { <galaxy-law>+    % <.nl> }
  token gravity-laws   { <gravity-law>+   % <.nl> }
  token blackhole-laws { <blackhole-law>+ % <.nl> }

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty> { <<<sym>>> }
  token galaxy-law:sym<cool>   { <<<sym>>> }
  token galaxy-law:sym<yolo>   { <<<sym>>> }
  token galaxy-law:sym<core>   { <sym> <.space>* <value> }
  
  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<core>    { <sym> <space>* <value> }
  token gravity-law:sym<origin>  { <sym> <space>* <value> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<core>    { <sym> <space>* <value> }
  token blackhole-law:sym<origin>  { <sym> <space>* <value> }

  token nl  { [ <comment>? \h* \n ]+ }
  token value { [<-[\s\n;#]>*] }
  token comment { \h* '#' \N* }
}
