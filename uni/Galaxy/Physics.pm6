use Galaxy::Physics::Laws;

class Galaxy::Physics {
  also does Galaxy::Physics::Laws;
  
  has %.laws;


  method TWEAK()	{
    %!laws = self!config.merge: self!command
  }
}
