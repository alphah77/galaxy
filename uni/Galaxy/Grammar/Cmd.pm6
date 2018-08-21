#no precompilation;
#use Grammar::Tracer;

use Galaxy::Grammar::Xyz;

grammar Galaxy::Grammar::Cmd {
  also does Galaxy::Grammar::Xyz;

  proto token CMD { * } # ordere is important
  rule CMD:sym<gravity>   { <galaxy-laws>? <sym> <gravity-laws>?   <s>? <xyzs>   } # g
  rule CMD:sym<blackhole> { <galaxy-laws>? <sym> <blackhole-laws>? <s>? <xyzs>   } # b
  rule CMD:sym<spacetime> { <galaxy-laws>? <sym> <spacetime-laws>?      <event>? } # st
  rule CMD:sym<star>      { <galaxy-laws>? <sym> <star-laws>?           <xyzs>   } # s
  rule CMD:sym<galaxy>    { <galaxy-laws>?                         <s>? <xyz>?   } # g

  token galaxy-laws    { <galaxy-law>+    % <space> } 
  token gravity-laws   { <gravity-law>+   % <space> }
  token blackhole-laws { <blackhole-law>+ % <space> } 
  token star-laws      { <star-law>+      % <space> } 
  token spacetime-laws { <spacetime-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty> { <<<sym>>> }
  token galaxy-law:sym<cool>   { <<<sym>>> }
  token galaxy-law:sym<yolo>   { <<<sym>>> }
  token galaxy-law:sym<core>   { <sym> <.space>* <core> }
  token galaxy-law:sym<origin> { <sym> <.space>* <location> }
  token galaxy-law:sym<law>    { <sym> <.space>  <location> }
  token galaxy-law:sym<nebula> { <sym> <.space>  <location> }


  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<core>    { <sym> <.space>* <core> }
  token gravity-law:sym<origin>  { <sym> <.space>* <location> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<core>    { <sym> <.space>* <core> }
  token blackhole-law:sym<origin>  { <sym> <.space>* <location> }

  proto token star-law  { * }
  token star-law:sym<remote> { <<<sym>>> }

  proto token spacetime-law { * }
  token spacetime-law:sym<travel>  { <sym> <.space>* <value> }

  token event    { 'event' }
  token core     { 'x86_64' }
  token value    { <!before \s> <-[ \s ]>+ <!after \s> }
  token location { <!before \s> <-[ \s ]>+ <!after \s> }
  token s        { 'star' <space>  }                     # edge cases where star name is reserved word
}
