role Galaxy::Grammar::StarNameAct {


  method star-name($/) {
    my %s;
    %s<id>   = $/.Str;
    %s<name> = $<name>.ast if $<name>.ast;
    %s<age>  = $<age>.ast  if $<age>.ast;
    %s<core> = $<core>.ast if $<core>.ast;
    %s<form> = $<form>.ast if $<form>.ast;
    %s<tag>  = $<tag>.ast  if $<tag>.ast;
    %s<tail> = $<tail>.ast if $<tail>.ast;
    make %s;
  }

  method name($/) { make $/.Str }
  method age($/)  { make $/.Str }
  method core($/) { make $/.Str }
  method form($/) { make $/.Str }
  method tag($/)  { make $/.Str }
  method tail($/) { make $/.Str }

}
