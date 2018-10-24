#no precompilation;
#use Grammar::Tracer;

use Grammar::Xyz;

grammar Grammar::Cmd {
  also does Grammar::Xyz;

  proto token CMD { * } # ordere is important
  rule CMD:sym<gravity>   { <galaxy-laws>? <gravity>   <gravity-laws>?   <star>? <xyzs>   }
  rule CMD:sym<blackhole> { <galaxy-laws>? <blackhole> <blackhole-laws>? <star>? <xyzs>   }
  rule CMD:sym<spacetime> { <galaxy-laws>? <spacetime> <spacetime-laws>?         <event>? }
  rule CMD:sym<nebula>    { <galaxy-laws>? <nebula>    <nebula-laws>?            <xyz>    }
  rule CMD:sym<star>      { <galaxy-laws>? <star>      <star-laws>?              <xyz>    }
  rule CMD:sym<planet>    { <galaxy-laws>? <planet>    <star-laws>?              'planet' }
  rule CMD:sym<galaxy>    { <galaxy-laws>?                               <star>? <xyz>?   }

	token galaxy    { 'galaxy'          }
	token gravity   { 'gravity'   | 'g' }
	token blackhole { 'blackhole' | 'b' }
	token spacetime { 'spacetime' | 't' }
	token nebula    { 'nebula'    | 'n' }
	token star      { 'star'      | 's' }
	token planet    { 'planet'    | 'p' }

  token galaxy-laws    { <galaxy-law>+    % <space> } 
  token gravity-laws   { <gravity-law>+   % <space> }
  token blackhole-laws { <blackhole-law>+ % <space> } 
  token nebula-laws    { <nebula-law>+    % <space> } 
  token star-laws      { <star-law>+      % <space> } 
  token planet-laws    { <planet-law>+    % <space> } 
  token spacetime-laws { <spacetime-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty>  { <<<sym>>> | 'ℙ' }
  token galaxy-law:sym<cool>    { <<<sym>>> | '^.^' }
  token galaxy-law:sym<yolo>    { <<<sym>>> | 'y' }
  token galaxy-law:sym<core>    { <sym> <.space>* <core> }
  token galaxy-law:sym<origin>  { <sym> <.space>* <location> }
  token galaxy-law:sym<law>     { <sym> <.space>  <location> }


  proto token gravity-law { * }
  token gravity-law:sym<cluster> { <<<sym>>> }
  token gravity-law:sym<origin>  { <sym> <.space>* <location> }

  proto token blackhole-law { * }
  token blackhole-law:sym<cluster> { <<<sym>>> }
  token blackhole-law:sym<origin>  { <sym> <.space>* <location> }

  proto token nebula-law { * }
  token nebula-law:sym<cluster> { <<<sym>>> }

  proto token star-law  { * }
  token star-law:sym<remote> { <<<sym>>> | <<r>> }

  proto token planet-law  { * }

  proto token spacetime-law { * }
  token spacetime-law:sym<travel>  { [<sym> | <<t>>] <.space>* <value> }

  token event    { 'event' }
  token core     { 'x86_64' | 'i386' }
  token value    { <!before \s> <-[ \s ]>+ <!after \s> }
  token location { <!before \s> <-[ \s ]>+ <!after \s> }
  #token x        { 'star' <space>  }                     # edge cases where star name is reserved word
}
