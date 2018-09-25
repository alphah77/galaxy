class Alien {
  has Int $.id      = +$*USER;
  has Str $.name    = ~$*USER;
  has IO  $.home    = $*HOME;
  has     @.powers;

  
  method decide(--> Bool:D) {

  }

}
