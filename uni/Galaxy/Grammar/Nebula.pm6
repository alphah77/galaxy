# TODO: revisit tokens

grammar Galaxy::Grammar::Nebula {

  token NEBULA { <.nl>* <nebula>+ %% <.nl> }

  token nebula    { '<'<name>'>' <.nl> <nebula-laws> }
  
  token nebula-laws    { <nebula-law>*    % <.nl> }

  proto token nebula-law  { * }
  token nebula-law:sym<disable>  { <<<sym>>> }
  token nebula-law:sym<location> { <location> }
  
  proto token proto    { * }
  token proto:sym<https> { <sym> }
  token proto:sym<http>  { <sym> }
  token proto:sym<ftp>   { <sym> }

  proto token location    { * }
  token location:sym<local>  { <path> }
  token location:sym<remote> { <proto> <colon> <slash> <slash> <remote> [<colon> <port>]? <path>  }

  token name { \w+ }
  token path { [ <slash> | <dotslash> ]? [\w+]+ %% <slash> }   # Path

  token colon { ':' }
  token dot { '.' }
  token slash { '/' }
  token dotslash { <dot><slash> }

  token remote { [\w+]+ % <dot> }

  token port { <digit>+ }
  token comment { \h* '#' \N* }

  token nl      { [ <comment>? \h* \n ]+ }
}
