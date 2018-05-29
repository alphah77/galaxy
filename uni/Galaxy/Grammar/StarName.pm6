role Galaxy::Grammar::StarName {

  token star-name { <<
    <name>  <hyphen>?
    <age>?  <hyphen>?
    <core>? <hyphen>?
    <tag>?  <hyphen>?
    <form>? <dot>?
    <tail>?
    <!after <[.-]>> 
    >>
  }

  token name             { [ <.alnum>+ <!before <dot>> ]+ % <hyphen> }
  token age              { [ $<agepart> = <.digit>+ ]+ % <dot> }  

  proto token core       { * }
  token core:sym<x86_64> { <sym> }
  token core:sym<i386>   { <sym> }

  token tag              { <?after ['x86_64-' | 'i386-']> <.alnum>+ }  # start with alpha
  token form             { <.digit>+ } # TODO: <?after <tag>>
  token tail             { 'xyz' }     # TODO <?after <tag> | <form>>

  token hyphen                { '-' }
  token dot                   { '.' }

}
