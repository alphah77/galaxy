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

	method get (Star :$star) {
	  
		my @cand = @!nebula>>.get(:$star).unique(:with(&[eqv])).flat;

		return @cand;

	}

  method cand (Bool :$cluster, Star :$star) {
		gather {
			take self.get(:$star).map( -> $star {
			  $star, $star.cluster.map( -> $star {
				  self.cand(:$star, :$cluster)
				})
			}).cache;
	  }
  }

  method form() {

  }
}
