use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;

class Galaxy::Physics::Galaxy {
  has $.name;
  has $.core;
  has $.disk;
  has $.halo;
  has $.bulge;

  has Galaxy::Physics::Gravity   $!gravity;
  has Galaxy::Physics::Blackhole $!blackhole;

}
