use Language;

class Phy {
  has $.cmd;
  has $.cnf;
  has %.law;
  
  method !conf {

  }

  method !command {
    my $rule = <CMD>;
    my $actions = CmdAct.new;

    Cmd.parse: $!cmd, :$rule, :$actions; 
		%!law = $actions.laws;
  }

  method create {
    self!conf;
    self!command;
  }
}
