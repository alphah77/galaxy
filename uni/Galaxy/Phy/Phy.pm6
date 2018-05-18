use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;

class Galaxy::Phy::Phy {
  has $.cmd;
  has $.cnf;
  has %.law;
  
  method !conf {

  }

  method !command {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct.new;

    Galaxy::Grammar::Cmd.parse: $!cmd, :$rule, :$actions; 
		%!law = $actions.law;
  }

  method create {
    self!conf;
    self!command;
  }
}
