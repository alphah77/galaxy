use Star;

role Grammar::XyzAct {

  method xyzs($/) { make $<xyz>».ast }

  method xyz($/) {
    my %s;

    %s<name> = $<name>.ast if defined $<name>;
    %s<age>  = $<age>.ast  if defined $<age>;
    %s<core> = $<core>.ast if defined $<core>;
    %s<form> = $<form>.ast if defined $<form>;
    %s<tag>  = $<tag>.ast  if defined $<tag>;
    %s<tail> = $<tail>.ast if defined $<tail>;

    make Star.new(|%s);
  }

  method name($/) { make $/.Str }
  method age($/)  { make Version.new: $/.Str }
  method core($/) { make $/.Str }
  method form($/) { make $/.Int }
  method tag($/)  { make $/.Str }
  method tail($/) { make $/.Str }
}
