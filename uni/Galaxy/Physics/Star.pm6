class Galaxy::Physics::Star {
  has $.id;
  has $.age;
  has $.tag;
  has $.name;
  has $.core;
  has $.form;
  has $.tail;
  has Galaxy::Physics::Star @.cluster;

#  has Galaxy::Physics::Star @.star;

}
