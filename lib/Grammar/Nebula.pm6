grammar Grammar::Nebula {

  token NEBULA { <.nl>* <nebula>* %% <.nl> }

  token nebula { '<'<nebula-name>'>'  <.nl> <nebula-laws>    }
  
  token nebula-laws    { <nebula-law>+    % <.nl> }

  token blackhole-law:sym<origin>  { <sym> <.space>* <path> }

  proto token nebula-law { * }
  token nebula-law:sym<url>     { <url> }
  token nebula-law:sym<disable> { <<<sym>>> }

  proto token proto    { * }
  token proto:sym<https> { <sym> }
  token proto:sym<http>  { <sym> }
  token proto:sym<ftp>   { <sym> }

  token url { <proto> <colon> <slash> <slash> <remote> [<colon> <port>]? }

  token nebula-name { \w+ }
  token path { [ <slash> | <dotslash> ]? [\w+]+ %% <slash> }   # Path

  token colon { ':' }
  token dot { '.' }
  token slash { '/' }
  token dotslash { <dot> <slash> }

  token remote { [\w+]+ % <dot> }

  token port { <digit>+ }

  token core    { 'x86_64' | 'i386' }
  token value   { [<-[\s\n;#]>*] }
  token comment { \h* '#' \N* }

  token nl      { [ <comment>? \h* \n ]+ }
}
