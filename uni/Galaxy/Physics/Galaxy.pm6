class Galaxy::Physics::Galaxy {
  has $.name;
  has $.core;
  has $.disk;
  has $.halo;
  has $.bulge;

  has Gravity   $!gravity;
  has Blackhole $!gravity;

}
