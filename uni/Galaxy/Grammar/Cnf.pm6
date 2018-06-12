#use Grammar::Tracer;
# TODO: Fix spaces around rules;
grammar Galaxy::Grammar::Cnf {

  token CNF { <.nl>* <object>* %% <.nl> }

  proto token object { * }
  token object:sym<galaxy>    { '<'<sym>'>'  <.nl> <galaxy-laws>    }
  token object:sym<gravity>   { '<'<sym>'>'  <.nl> <gravity-laws>   }
  token object:sym<blackhole> { '<'<sym>'>'  <.nl> <blackhole-laws> }
  token object:sym<nebula>    { '<'<sym>'>'  <.nl> <nebula-laws>    }
  
  token galaxy-laws    { <galaxy-law>+    % <.nl> }
  token gravity-laws   { <gravity-law>+   % <.nl> }
  token blackhole-laws { <blackhole-law>+ % <.nl> }
  token nebula-laws    { <nebula-law>+    % <.nl> }

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty> { <<<sym>>> }
  token galaxy-law:sym<cool>   { <<<sym>>> }
  token galaxy-law:sym<yolo>   { <<<sym>>> }
  token galaxy-law:sym<core>   { <sym> <.space>* <core> }
  token galaxy-law:sym<origin> { <sym> <.space>* <path> }
  
  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<core>    { <sym> <.space>* <core> }
  token gravity-law:sym<origin>  { <sym> <.space>* <path> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<core>    { <sym> <.space>* <core> }
  token blackhole-law:sym<origin>  { <sym> <.space>* <path> }

  proto token nebula-law { * }
  token nebula-law:sym<url>     { <url> }
  token nebula-law:sym<disable> { <<<sym>>> }

  proto token proto    { * }
  token proto:sym<https> { <sym> }
  token proto:sym<http>  { <sym> }
  token proto:sym<ftp>   { <sym> }

  token url { <proto> <colon> <slash> <slash> <remote> [<colon> <port>]? <path>  }

  token name { \w+ }
  token path { [ <slash> | <dotslash> ]? [\w+]+ %% <slash> }   # Path

  token colon { ':' }
  token dot { '.' }
  token slash { '/' }
  token dotslash { <dot><slash> }

  token remote { [\w+]+ % <dot> }

  token port { <digit>+ }

  token core    { 'x86_64' }
  token value   { [<-[\s\n;#]>*] }
  token comment { \h* '#' \N* }

  token nl      { [ <comment>? \h* \n ]+ }
}
