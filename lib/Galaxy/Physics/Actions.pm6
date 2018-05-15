use Galaxy::Physics::Galaxy::Actions;
use Galaxy::Physics::Gravity::Actions;
use Galaxy::Physics::Blackhole::Actions;
use Galaxy::Physics::Star::Actions;

class Galaxy::Physics::Actions	{ 
	also does Galaxy::Physics::Galaxy::Actions;
	also does Galaxy::Physics::Gravity::Actions;
	also does Galaxy::Physics::Blackhole::Actions;
	also does Galaxy::Physics::Star::Actions;
	
	has %.laws;


	method TOP ($/) { 
	#	return %!laws;
#	%!laws<active>		= %!object;
	%!laws<galaxy>		= %!galaxy;
	%!laws<gravity>		= %!gravity;
	%!laws<blackhole>	= %!blackhole;
	%!laws<star>			= %!star-laws;
	}

#	method star($/) 	{ make %!laws<star> = $/.Str	}

	method value($/) 	{ make $/.Str	}

}
