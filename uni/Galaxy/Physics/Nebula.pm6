use File::Find;
use Galaxy::Physics::Xyz;

class Galaxy::Physics::Nebula {

  has IO   $.path    is required;
  has Int  $.port    is required;
  has Str  $.proto   is required;
  has Str  $.remote  is required;

  has Bool $.disable = False;

  has Galaxy::Physics::Xyz @.xyz;

  method locate (Galaxy::Physics::Xyz $xyz) { # returns Path
    
  }

  method form() {

  }
}
