role Galaxy::Grammar::StarNameAct {


  method star-name($/) {
    my %s;
    %s<name> = $<name>.ast if $<name>.ast;
    %s<age>  = $<age>.ast  if $<age>.ast;
    %s<core> = $<core>.ast if $<core>.ast;
    %s<form> = $<form>.ast if $<form>.ast;
    %s<tag>  = $<tag>.ast  if $<tag>.ast;
    %s<tail> = $<tail>.ast if $<tail>.ast;
    make $/.Str => %s;
  }

  method name($/) { make $/.Str }
  method age($/)  { make $/.Str }

  method core:sym<x86_64>($/) { make $<sym>.Str }
  method core:sym<i386>($/)   { make $<sym>.Str }

  method form($/) { make $/.Str }
  method tag($/)  { make $/.Str }
  method tail($/) { make $/.Str }

}
