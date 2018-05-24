use Galaxy::Grammar::Star;

grammar Galaxy::Grammar::Cmd {
  also does Galaxy::Grammar::Star;

  proto token CMD { * } # ordere is important
  rule CMD:sym<gravity>   { <galaxy> <gravity>   <stars>?  }
  rule CMD:sym<blackhole> { <galaxy> <blackhole> <stars>? }
  rule CMD:sym<spacetime> { <galaxy> <spacetime> <event>? } # TODO:
  rule CMD:sym<galaxy>    { <galaxy> <star>? }

  rule galaxy    {             <galaxy-laws>?     }
  rule gravity   { 'gravity'   <gravity-laws>?   }
  rule blackhole { 'blackhole' <blackhole-laws>? }
  rule spacetime { 'spacetime' <spacetime-laws>? }

  token galaxy-laws    { <galaxy-law>+    % <space> } 
  token gravity-laws   { <gravity-law>+   % <space> }
  token blackhole-laws { <blackhole-law>+ % <space> } 
  token spacetime-laws { <spacetime-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty> { <<<sym>>> }
  token galaxy-law:sym<cool>   { <<<sym>>> }
  token galaxy-law:sym<yolo>   { <<<sym>>> }
  token galaxy-law:sym<core>   { <sym> <space>* <value> }

  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<core>    { <sym> <space>* <value> }
  token gravity-law:sym<origin>  { <sym> <space>* <value> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<core>    { <sym> <space>* <value> }
  token blackhole-law:sym<origin>  { <sym> <space>* <value> }

  proto token spacetime-law { * }
  token spacetime-law:sym<travel>  { <sym> <space>* <value> }

  token stars    { <star>+ % <space> }
  token event    { 'event' }
  token value { <!before \s> <-[ \s ]>+ <!after \s> }
}
