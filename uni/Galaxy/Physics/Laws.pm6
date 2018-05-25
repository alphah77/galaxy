use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Hash::Merge::Augment;

class Galaxy::Physics::Laws {
  has $.cmd;
  has $.cnf;
  has %.law;
  
  method !conf {
    my $rule = <CNF>;
    my $actions = Galaxy::Grammar::CnfAct.new;

    my $m = Galaxy::Grammar::Cnf.parsefile: $!cnf, :$rule, :$actions; 
		die "Check law file" unless $m;
    return $m.ast;
  }

  method !command {
    my $rule = <CMD>;
    my $actions = Galaxy::Grammar::CmdAct.new;

    my $m = Galaxy::Grammar::Cmd.parse: $!cmd, :$rule, :$actions; 
    die "Check cmd" unless $m;
		return $m.ast;
  }


  method set-laws {
    %!law = self!conf.merge: self!command;
    say %!law;
  }
}
