use Galaxy::Physics::Star;

class Galaxy::Physics::Galaxy {
  has Str  $.name;
  has Str  $.core;
  has IO   $.origin;
  has IO   $.disk;
  has IO   $.bulge;
  has IO   $.halo;
  has Bool $.yolo;
  has Bool $.cool;
  has Bool $.pretty;
  has Galaxy::Physics::Star @.star;
  has Galaxy::Physics::Star @.stars;

  submethod BUILD (
    :$!name    = chomp(qx<hostname>),
    :$!core    = chomp(qx<uname -m>),
    :$!origin  = </>.IO,
    :$!disk    = $!origin.add(</etc/galaxy/star>.IO).cleanup,
    :$!bulge   = $!origin.add(</etc/galaxy/>.IO).cleanup,
    :$!halo    = $!origin.add(</var/galaxy/>.IO).cleanup,
    :$!yolo    = False,
    :$!cool    = False,
    :$!pretty  = False,
		:@star;
	  ) {

		@!star  = @star.map({Galaxy::Physics::Star.new: |$_});
    @!stars = &local-stars(:$!disk);

		sub local-stars(IO :$disk) {
      @!stars =  Galaxy::Physics::Star.new: name => <rakudo>;
		}

	}
}
