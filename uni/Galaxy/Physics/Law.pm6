use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Hash::Merge::Augment;

role Galaxy::Physics::Law {

  method !command($cmd) {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct.new;

    my $m = Galaxy::Grammar::Cmd.parse: $cmd, :$rule, :$actions; 
		self.help: "cmd" unless $m;
		return $m.ast;
  }

  method !config($law) {
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
