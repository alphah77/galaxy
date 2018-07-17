role Galaxy::Grammar::XyzAct {

  method xyzs($/) { make $<xyz>».ast  }

  method xyz($/) {
    my %s;

    %s<id>   = $/.Str;
    %s<name> = $<name>.ast;
    %s<age>  = $<age>.ast  if defined $<age>;
    %s<core> = $<core>.ast if defined $<core>;
    %s<form> = $<form>.ast if defined $<form>;
    %s<tag>  = $<tag>.ast  if defined $<tag>;
    %s<tail> = $<tail>.ast if defined $<tail>;

    make %s;
  }

  method name($/) { make $/.Str }
  method age($/)  { make $/.Str }
  method core($/) { make $/.Str }
  method form($/) { make $/.Str }
  method tag($/)  { make $/.Str }
  method tail($/) { make $/.Str }

}
