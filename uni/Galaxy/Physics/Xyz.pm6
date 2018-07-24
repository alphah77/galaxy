use Galaxy::Physics::Planet;

class Galaxy::Physics::Xyz {

  has Str     $.name is required;
  #has Version $.age;
  has Str     $.age;
  has Str     $.tag;
  has Str     $.core;
  has Int     $.form;
  has Str     $.tail;
  has Any     $.location;
  has Any     $.chksum;
	has         $.req;

  has Galaxy::Physics::Planet $.planets;
  has Galaxy::Physics::Xyz    $.cluster;

}
