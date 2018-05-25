class Galaxy::Alien {
  has $.id;
  has $.name;
  has @.powers;

  method cnf() {
    my $conf= "laws";
    return $conf;
  }

  method cmd() {
    my $cmd = @*ARGS;
    return $cmd;
  }

  method set-laws() {
    my $cmd = @*ARGS;
    return $cmd;
  }


}
