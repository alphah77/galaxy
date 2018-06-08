use Galaxy::Physics::Star;

class Galaxy::Physics::Nebula {

  has IO   $.path;
  has Str  $.name;
  has Int  $.port;
  has Str  $.proto;
  has Str  $.remote;
  has Bool $.disable = False;

  has Galaxy::Physics::Star @.star;

  method form() {

  }
}
