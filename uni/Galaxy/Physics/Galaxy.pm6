use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;

class Galaxy::Physics::Galaxy {
  has Str  $.name    = chomp qx<hostname>;
  has Str  $.core    = chomp qx<uname -m>;
  has IO   $.disk    = </etc/galaxy/star>.IO;
  has IO   $.bulge   = </etc/galaxy/>.IO;
  has IO   $.halo    = </var/galaxy/>.IO;
  has IO   $.origin  = </>.IO;
  has Bool $.yolo    = False;
  has Bool $.cool    = False;
  has Bool $.pretty  = False;

}
