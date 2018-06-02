use Galaxy::Grammar::StarName;

grammar Galaxy::Grammar::Cmd {
  also does Galaxy::Grammar::StarName;

  proto token CMD { * } # ordere is important
  rule CMD:sym<gravity>   { <galaxy> <gravity>   <s>?     <stars>?     }
  rule CMD:sym<blackhole> { <galaxy> <blackhole> <s>?     <stars>?     }
  rule CMD:sym<spacetime> { <galaxy> <spacetime>          <event>?     }
  rule CMD:sym<star>      { <galaxy> <star>               <star-name>  }
  rule CMD:sym<galaxy>    { <galaxy>             <s>?     <star-name>? }

  rule galaxy    {             <galaxy-laws>?    }
  rule star      { 'star'      <star-laws>?      }
  rule gravity   { 'gravity'   <gravity-laws>?   }
  rule blackhole { 'blackhole' <blackhole-laws>? }
  rule spacetime { 'spacetime' <spacetime-laws>? }

  token galaxy-laws    { <galaxy-law>+    % <space> } 
  token star-laws      { <star-law>+      % <space> } 
  token gravity-laws   { <gravity-law>+   % <space> }
  token blackhole-laws { <blackhole-law>+ % <space> } 
  token spacetime-laws { <spacetime-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty> { <<<sym>>> }
  token galaxy-law:sym<cool>   { <<<sym>>> }
  token galaxy-law:sym<yolo>   { <<<sym>>> }
  token galaxy-law:sym<core>   { <sym> <.space>* <core> }
  token galaxy-law:sym<origin> { <sym> <.space>* <value> }

  proto token star-law  { * }
  token star-law:sym<remote> { <<<sym>>> }

  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<core>    { <sym> <.space>* <core> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<core>    { <sym> <.space>* <core> }

  proto token spacetime-law { * }
  token spacetime-law:sym<travel>  { <sym> <.space>* <value> }

  token stars { <star-name>+ % <space> }
  token event { 'event' }
  token core  { 'x86_64' }
  token value { <!before \s> <-[ \s ]>+ <!after \s> }
  token s     { 'star' <space>  }                     # edge cases where star name is reserved word
}
