role Galaxy::Grammar::StarAct {

  method star($/) {
    my %star;
    %star<star> = $/.Str;
    %star<name> = $<star-name>.ast;
    %star<age>  = $<star-age>.ast;
    %star<core> = $<star-core>.ast;
    %star<form> = $<star-form>.ast;
    %star<tag>  = $<star-tag>.ast;
    %star<tail> = $<star-tail>.ast;
    make %star;
  }

  method star-name($/) { make $/.Str }
  method star-age($/)  { make $/.Str }

  method star-core:sym<x86_64>($/) { make $/.Str }
  method star-core:sym<i386>($/)   { make $/.Str }

  method star-form($/) { make $/.Str }
  method star-tag($/)  { make $/.Str }
  method star-tail($/) { make $/.Str }

}
