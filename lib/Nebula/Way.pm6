use Cro::HTTP::Client;
use Cro::Uri;
use Star;

class Nebula::Way {

	has $.name;
	has Cro::HTTP::Client $!client;
	has Cro::Uri          $.url;
  has Bool              $.disable = False;

  submethod TWEAK () {
	  $!client = Cro::HTTP::Client.new(base-uri => $!url, :json);
	}

	method get (Star :$star) {

    my $path = </cand?>;
	  my $resp = await $!client.get($path ~ star-location(:$star)); # TODO catch the error
		my $json = await $resp.body;
		return $json.map: -> %h { Star.new(|%h) };
	}
}

sub star-location(:$star) {
  my $query;
  $query ~= "name=$_"  with $star.name;
  $query ~= "&age=$_"  with $star.age;
  $query ~= "&core=$_" with $star.core;
  $query ~= "&tag=$_"  with $star.tag;
  $query ~= "&form=$_" with $star.form;
  return $query;
}

