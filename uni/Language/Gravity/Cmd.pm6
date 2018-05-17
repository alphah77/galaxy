role  Language::Gravity::Cmd  {

  token gravity { << 'gravity' >> }

  token gravity-laws  { <?after 'gravity' <space>> <gravity-law>+ % <space> }

  proto token gravity-law { * }
  token gravity-law:sym<core>    { <sym> <space>* <value> }
  token gravity-law:sym<origin>  { <sym> <space>* <value> }
  token gravity-law:sym<cluster> { <<<sym>>> }

} 

