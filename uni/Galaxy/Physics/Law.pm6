use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Hash::Merge::Augment;

role Galaxy::Physics::Law {
  has $!cnf = '/etc/galaxy/law';
  has $!cmd = @*ARGS;

  method !config {
    my $rule = <CNF>;
    my $actions = Galaxy::Grammar::CnfAct.new;

    my $m = Galaxy::Grammar::Cnf.parsefile: $!cnf, :$rule, :$actions; 
		self.help: "cnf" unless $m;
    return $m.ast;
  }

  method !command {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct.new;

    my $m = Galaxy::Grammar::Cmd.parse: $!cmd, :$rule, :$actions; 
		self.help: "cmd" unless $m;
		return $m.ast;
  }

  method help($msg) {       # help when no cnf or cmd fails to parse
    die $msg;
  };
}
