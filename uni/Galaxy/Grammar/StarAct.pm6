role Galaxy::Grammar::StarAct {

  method star($/) {
    make $/.Str => {
			name => $<star-name>.ast,
			age  => $<star-age>.ast,
			core => $<star-core>.ast,
			form => $<star-form>.ast,
			tag  => $<star-tag>.ast,
			tail => $<star-tail>.ast,
    }
  }

  method star-name($/) { make $/.Str }
  method star-age($/)  { make $/.Str }

  method star-core:sym<x86_64>($/) { make $<sym>.Str }
  method star-core:sym<i386>($/)   { make $<sym>.Str }

  method star-form($/) { make $/.Str }
  method star-tag($/)  { make $/.Str }
  method star-tail($/) { make $/.Str }

}
