use Galaxy::Physics::Planet;

class Galaxy::Physics::Xyz {
  has $.id;
  has $.name is required;
  has $.age;
  has $.tag;
  has $.core;
  has $.form;
  has $.tail;

  has Galaxy::Physics::Planet @.planets;
  has Galaxy::Physics::Xyz    @.cluster;

}
