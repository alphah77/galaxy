use Grammar::Cmd;
use Grammar::Cnf;
use Grammar::CmdAct;
use Grammar::CnfAct;
use Hash::Merge::Augment;

role Physics::Law {

  method initiate {
    my %law;
    my $cmd = @*ARGS;
    my $cnf = </etc/galaxy/law>.IO;
    my $nbl = </etc/galaxy/nebula>.IO;

    my %cmd = self!command($cmd);

    %cmd<galaxy><law>    = $cnf unless %cmd<galaxy><law>:exists;

    my %cnf = self!config(%cmd<galaxy><law>);


    %law.merge: %cnf.merge: %cmd; 
    return %law;
 	}

  submethod !command($cmd) {
    my $rule = <CMD>;
    my $actions = Grammar::CmdAct;

    my $m = Grammar::Cmd.parse: $cmd, :$rule, :$actions; 
		self.help: "cmd" unless $m;
		return $m.ast;
  }

  submethod !config($law) {
    my $rule = <CNF>;
    my $actions = Grammar::CnfAct.new;

    my $m = Grammar::Cnf.parsefile: $law, :$rule, :$actions; 
		self.help: "cnf" unless $m;
    return $m.ast;
  }


  method help($msg) {       # help when no cnf or cmd fails to parse
    die $msg;
  };
}
