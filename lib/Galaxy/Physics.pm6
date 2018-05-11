use Galaxy::Physics::Object;
use Galaxy::Physics::Object::Galaxy;
use Galaxy::Physics::Object::Gravity;
use Galaxy::Physics::Object::Blackhole;
use Galaxy::Physics::Object::Star;
#use Grammar::Debugger;

grammar Galaxy::Physics	{
	also does Galaxy::Physics::Object;
	also does Galaxy::Physics::Object::Galaxy;
	also does Galaxy::Physics::Object::Gravity;
	also does Galaxy::Physics::Object::Blackhole;
	also does Galaxy::Physics::Object::Star;

	rule TOP	{ <galaxy-laws>? <object>? <object-laws>? <star>? }

	#token value { [<-[\n\s#]>*] }
	token value { <!before \s> <-[ \s ]>+ <!after \s> }

	method create(Str $laws, :$actions, :$rule = 'TOP')	{
		my $m = self.parse($laws, :$actions, :$rule);
	#	die "Laws not consistent" unless $m;
		return $m;
		#return $m.made if $m; 
	}
}
