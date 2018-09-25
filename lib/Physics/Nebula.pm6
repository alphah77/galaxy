use File::Find;
use Physics::Star;

class Physics::Nebula {

  has IO   $.path    is required;
  has Int  $.port    is required;
  has Str  $.proto   is required;
  has Str  $.remote  is required;

  has Bool $.disable = False;

#  has Physics::Star @.star;

  method locate (Physics::Star $star) { # returns Path
    
  }

  method form() {

  }
}
