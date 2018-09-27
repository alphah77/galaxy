use Cro::HTTP::Client;
use Cro::Uri;
use File::Find;
use Star;

class Nebula::Way {

	has Cro::HTTP::Client $!client;
	has Cro::Uri          $.url;
  has Bool              $.disable = False;

#  has Star @.star;

  submethod TWEAK () {
	  $!client = Cro::HTTP::Client.new(base-uri => $!url, :json);
	}

  method cand (Star::Xyz $xyz) {
	  my $path = </cand?>;
	  my $resp = await $!client.get($path ~ self!xyz-location($xyz));
		my @json = await $resp.body;
		my @cand = @json.map: -> %h { Star::Xyz.new(|%h) };
		return @cand;
  }

  method form() {

  }

  # Rev
  submethod !xyz-location($xyz) {
	  my $query;
		$query ~= "name=$_"  with $xyz.name; 
		$query ~= "&age=$_"  with $xyz.age; 
		$query ~= "&core=$_" with $xyz.core; 
		$query ~= "&tag=$_"  with $xyz.tag; 
		$query ~= "&form=$_" with $xyz.form; 
    return $query;
	}

}
