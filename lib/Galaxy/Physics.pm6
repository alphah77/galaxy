use Galaxy::Physics::Galaxy;
use Galaxy::Physics::Gravity;
use Galaxy::Physics::Blackhole;
use Galaxy::Physics::Star;
#use Grammar::Debugger;

grammar Galaxy::Physics	{
	also does Galaxy::Physics::Galaxy;
	also does Galaxy::Physics::Gravity;
	also does Galaxy::Physics::Blackhole;
	also does Galaxy::Physics::Star;

	regex TOP	{
    |  <galaxy-laws>?  <.space>* <gravity>?    <.space>* <gravity-laws>?   <.space>* <star>?
    |  <galaxy-laws>?  <.space>* <blackhole>?  <.space>* <blackhole-laws>? <.space>* <star>?
  }

	#token value { [<-[\n\s#]>*] }
	token value { <!before \s> <-[ \s ]>+ <!after \s> }

	method create(Str $laws, :$actions, :$rule = 'TOP')	{
		my $m = self.parse($laws, :$actions, :$rule);
	#	die "Laws not consistent" unless $m;
		return $m;
		#return $m.made if $m; 
	}
}
