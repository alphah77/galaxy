use File::Find;
use Star;

class Nebula {

  has IO   $.path    is required;
  has Int  $.port    is required;
  has Str  $.proto   is required;
  has Str  $.remote  is required;

  has Bool $.disable = False;

#  has Star @.star;

  method locate (Star $star) { # returns Path
    
  }

  method form() {

  }
}
