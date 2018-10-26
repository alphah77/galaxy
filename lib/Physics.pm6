use Grammar::Cmd;
use Grammar::Cnf;
use Grammar::Nebula;
use Grammar::CnfAct;
use Grammar::CmdAct;
use Grammar::NebulaAct;
use Hash::Merge::Augment;

use Alien;
use Galaxy;
use Gravity;
use Blackhole;
use Spacetime;
use Star;
use Nebula;

class Physics {

	has %!law;
  has Alien       $!alien;
  has Galaxy      $!galaxy;
  has Gravity     $!gravity;
  has Blackhole   $!blackhole;
  has Spacetime   $!spacetime;
  has Nebula $!nebula;
	
  submethod BUILD (:%!law) {
    my $obj = </etc/galaxy/law>.IO;
    my $nbl = </etc/galaxy/nebula>.IO;

    my %obj = object($obj);
    my %cmd = command(@*ARGS);
    my @nebula = nebula($nbl);

    %!law.merge: %obj.merge: %cmd;

  	$!alien     = Alien.new;
		$!nebula    = Nebula.new(:@nebula);
  	$!galaxy    = Galaxy.new(|%!law<galaxy>.push: (:$!nebula));

		self.cmd(%cmd<cmd>);
  }


    multi method cmd ('gravity') {
		  say <---gravity--->;
      $!galaxy.gravity: |%!law<gravity>;
    }

    multi method cmd ('blackhole') {
		  say <---blackhole--->;
      $!galaxy.blackhole: |%!law<blackhole>;
      #$!galaxy.blackhole :star($obj);

    }

    multi method cmd ('nebula') {
		  say <---nebula--->;
      $!galaxy.nebula: |%!law<nebula>;

    }

    multi method cmd ('star') {
		  say <---star--->;
      $!galaxy.star: |%!law<star>;

    }

    multi method cmd ('spacetime') {
		  say <---spacetime--->;
		  #say <spacetime>;
      #$!galaxy.spacetime :event($obj);

    }

    # galaxy star dispatch to "star"
    # galaxy event dispatch to "spacetime"
    multi method cmd ('galaxy') {
			samewith('star')      if  %!law<star><star> ~~ Star;
		#	samewith('spacetime') if  %!law<spacetime><event> ~~ Spacetime::Event;
    }

}

sub object($law) {
	my $rule = <CNF>;
	my $actions = Grammar::CnfAct.new;

	my $m = Grammar::Cnf.parsefile: $law, :$rule, :$actions; 
	help "cnf" unless $m;
	return $m.ast;
}

sub nebula($nbl) {
	my $rule = <NEBULA>;
	my $actions = Grammar::NebulaAct;

	my $m = Grammar::Nebula.parsefile: $nbl, :$rule, :$actions; 
	help "Nebula" unless $m;
	return $m.ast;
}


sub command($cmd) {
	my $rule = <CMD>;
	my $actions = Grammar::CmdAct;

	my $m = Grammar::Cmd.parse: $cmd, :$rule, :$actions; 
	help "cmd" unless $m;
	return $m.ast;
}


sub help($msg) {       # help when no cnf or cmd fails to parse
	die $msg;
};

