use Language::Galaxy::Cmd;
use Language::Gravity::Cmd;
use Language::Blackhole::Cmd;
use Language::Star;
use Language::Galaxy::Cmd::Act;
use Language::Gravity::Cmd::Act;
use Language::Blackhole::Cmd::Act;
use Language::Star::Act;


grammar Cnf {

}

grammar Cmd {
  also does Language::Galaxy::Cmd;
  also does Language::Gravity::Cmd;
  also does Language::Blackhole::Cmd;
  also does Language::Star;

  regex CMD {
    |  <galaxy-laws>?  <.space>* <gravity>?    <.space>* <gravity-laws>?   <.space>* <star>?
    |  <galaxy-laws>?  <.space>* <blackhole>?  <.space>* <blackhole-laws>? <.space>* <star>?
  }

  token value { <!before \s> <-[ \s ]>+ <!after \s> }

}


class CnfAct {

}

class CmdAct {
  also does Language::Galaxy::Cmd::Act;
  also does Language::Gravity::Cmd::Act;
  also does Language::Blackhole::Cmd::Act;
  also does Language::Star::Act;


  has %.laws;

  method CMD ($/) { 
  # return %!laws;
# %!laws<active>    = %!object;
  %!laws<galaxy>    = %!galaxy;
  %!laws<gravity>   = %!gravity;
  %!laws<blackhole> = %!blackhole;
  %!laws<star>      = %!star-laws;
  }

# method star($/)   { make %!laws<star> = $/.Str  }

  method value($/)  { make $/.Str }


}
