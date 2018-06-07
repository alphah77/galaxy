use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Galaxy::Grammar::Nebula;
use Galaxy::Grammar::NebulaAct;
use Hash::Merge::Augment;

role Galaxy::Physics::Law {


  #submethod laws {
  method law {
    my %law;
    my $cmd = @*ARGS;
    my $cnf = </etc/galaxy/law>.IO;
    my $nbl = </etc/galaxy/nebula>.IO;

    my %cmd = self!command($cmd);

    %cmd<galaxy><law>    = $cnf unless %cmd<galaxy><law>:exists;
    %cmd<galaxy><nebula> = $nbl unless %cmd<galaxy><nebula>:exists;

    my %cnf = self!config(%cmd<galaxy><law>);

    %law<nebulas> = self!nebula(%cmd<galaxy><nebula>);

    %law.merge: %cnf.merge: %cmd; 

    return %law;
 	}

  submethod !command($cmd) {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct.new;

    my $m = Galaxy::Grammar::Cmd.parse: $cmd, :$rule, :$actions; 
		self.help: "cmd" unless $m;
		return $m.ast;
  }

  submethod !config($law) {
    my $rule = <CNF>;
    my $actions = Galaxy::Grammar::CnfAct.new;

    my $m = Galaxy::Grammar::Cnf.parsefile: $law, :$rule, :$actions; 
		self.help: "cnf" unless $m;
    return $m.ast;
  }

  method !nebula($law) {
    my $rule = <NEBULA>;
    my $actions = Galaxy::Grammar::NebulaAct.new;

    my $m = Galaxy::Grammar::Nebula.parsefile: $law, :$rule, :$actions; 
		self.help: "nebula" unless $m;
    return $m.ast;
  }

  method help($msg) {       # help when no cnf or cmd fails to parse
    die $msg;
  };
}
