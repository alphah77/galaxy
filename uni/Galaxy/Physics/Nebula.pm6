use File::Find;
use Galaxy::Physics::Star;

class Galaxy::Physics::Nebula {

  has IO   $.path    is required;
  has Int  $.port    is required;
  has Str  $.proto   is required;
  has Str  $.remote  is required;

  has Bool $.disable = False;

#  has Galaxy::Physics::Star @.star;

  method locate (Galaxy::Physics::Star $star) { # returns Path
    
  }

  method form() {

  }
}
