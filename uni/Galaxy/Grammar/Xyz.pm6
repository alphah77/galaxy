role Galaxy::Grammar::Xyz {

  token xyzs    { <xyz>+ % <space> }

  token xyz { # <<
    <name>  <hyphen>?
    <age>?  <hyphen>?
    <core>? <hyphen>?
    <tag>?  <hyphen>?
    <form>? <dot>?
    <tail>?
    <!after <[.-]>> 
   # >>
  }

  token name   { [ <.alnum>+ <!before <dot>> ]+ % <hyphen> }
  token age    { [ $<agepart> = [ <.digit>+ | '*' ] ]+ % <dot> }  
  token core   { 'x86_64' }
  token tag    { <?after 'x86_64' <hyphen>> <.alpha> <.alnum>* }  # start with alpha
  token form   { <.digit>+ } # TODO <?after <tag>>
  token tail   { 'xyz' }     # TODO <?after <form>>
  token hyphen { '-' }
  token dot    { '.' }

}
