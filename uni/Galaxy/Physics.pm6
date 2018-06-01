use Galaxy::Physics::Law;
use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Spacetime;
use Galaxy::Physics::Nebula;

class Galaxy::Physics {
  also does Galaxy::Physics::Law;

  has Galaxy::Physics::Galaxy    $.galaxy;
  has Galaxy::Physics::Gravity   $.gravity;
  has Galaxy::Physics::Blackhole $.blackhole;
  has Galaxy::Physics::Nebula    $.nebula;

  submethod TWEAK() {
    self!law;

    # TODO: Fix when %!law<gravity> = Nil
    $!gravity   = Galaxy::Physics::Gravity.new:   |%!law<gravity>;
    $!blackhole = Galaxy::Physics::Blackhole.new: |%!law<blackhole>;
    $!galaxy    = Galaxy::Physics::Galaxy.new:    |%!law<galaxy>;
  }
}
