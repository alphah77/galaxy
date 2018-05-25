role Galaxy::Grammar::StarAct {


  method star($/) {
    my %s;
    %s<name> = $<star-name>.ast if $<star-name>.ast;
    %s<age>  = $<star-age>.ast if $<star-age>.ast;
    %s<core> = $<star-core>.ast if $<star-core>.ast;
    %s<form> = $<star-form>.ast if $<star-form>.ast;
    %s<tag>  = $<star-tag>.ast if $<star-tag>.ast;
    %s<tail> = $<star-tail>.ast if $<star-tail>.ast;
    make $/.Str => %s;
  }

  method star-name($/) { make $/.Str }
  method star-age($/)  { make $/.Str }

  method star-core:sym<x86_64>($/) { make $<sym>.Str }
  method star-core:sym<i386>($/)   { make $<sym>.Str }

  method star-form($/) { make $/.Str }
  method star-tag($/)  { make $/.Str }
  method star-tail($/) { make $/.Str }

}
