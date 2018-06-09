class Galaxy::Physics::Star {
  has $.id;
  has $.name is required;
  has $.age;
  has $.tag;
  has $.core;
  has $.form;
  has $.tail;
  has Galaxy::Physics::Star @.cluster;

#  has Galaxy::Physics::Star @.star;

}
