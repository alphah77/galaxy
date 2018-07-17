use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Hash::Merge::Augment;


role Galaxy::Physics::Laws {


  method initiate {
    my %laws;
    my $cmd = @*ARGS;
    my $cnf = </etc/galaxy/law>.IO;
    my $nbl = </etc/galaxy/nebula>.IO;

    my %cmd = self!command($cmd);

    %cmd<galaxy><law>    = $cnf unless %cmd<galaxy><law>:exists;

    my %cnf = self!config(%cmd<galaxy><law>);


    %laws.merge: %cnf.merge: %cmd; 
    return %laws;
 	}

  submethod !command($cmd) {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct;

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


  method help($msg) {       # help when no cnf or cmd fails to parse
    die $msg;
  };
}
