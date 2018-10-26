use File::Find;
use Nebula::Way;
use Star;

class Nebula {

  has Nebula::Way @.nebula;
  #has @.nebula;
#  has Star @.star;
  submethod BUILD (:@nebula) {
    @!nebula = @nebula.map( -> %h { Nebula::Way.new: |%h });
	}

  method cand (Bool :$cluster, Star :$star) {
    my @cand = @!nebula>>.get(:$star).unique(:with(&[eqv])).flat;
		return @cand;
  }

  method form() {

  }
}
