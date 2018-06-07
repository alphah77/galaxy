role Galaxy::Grammar::Star {

  token stars    { <star>+ % <space> }

  token star { <<
    <name>  <hyphen>?
    <age>?  <hyphen>?
    <core>? <hyphen>?
    <tag>?  <hyphen>?
    <form>? <dot>?
    <tail>?
    <!after <[.-]>> 
    >>
  }

  token name   { [ <.alnum>+ <!before <dot>> ]+ % <hyphen> }
  token age    { [ $<agepart> = <.digit>+ ]+ % <dot> }  
  token core   { 'x86_64' }
  token tag    { <?after 'x86_64' <hyphen>> <.alnum>+ }  # start with alpha
  token form   { <.digit>+ } # TODO: <?after <tag>>
  token tail   { 'xyz' }     # TODO <?after <tag> | <form>>
  token hyphen { '-' }
  token dot    { '.' }

}
