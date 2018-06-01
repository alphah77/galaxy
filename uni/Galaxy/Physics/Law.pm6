use Galaxy::Grammar::Cmd;
use Galaxy::Grammar::Cnf;
use Galaxy::Grammar::CmdAct;
use Galaxy::Grammar::CnfAct;
use Hash::Merge::Augment;

role Galaxy::Physics::Law {
  has %.law;
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

  method !law {
		%!law<galaxy><halo>  = '/var/galaxy/';
		%!law<galaxy><bulge> = '/etc/galaxy/';

		%!law<galaxy><law>   = '/etc/galaxy/law';
		%!law<galaxy><disk>  = '/etc/galaxy/star/';

		%!law<galaxy><name>  = chomp qx<hostname>; 
		%!law<galaxy><core>  = chomp qx<uname -m>;

   %!law.merge: self!config.merge: self!command; 
  }

  method help($msg) {       # help when no cnf or cmd fails to parse
    die $msg;
  };
}
