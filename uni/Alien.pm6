use Language;

class Alien {
  has $.id;
  has $.name;
  has @.powers;

  method cnf() {
    my $conf;
    return $conf;
  }

  method cmd() {
    my $cmd = @*ARGS;
    return $cmd;
  }

}
