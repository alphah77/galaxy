use Galaxy::Physics::Object::Actions;
use Galaxy::Physics::Object::Galaxy::Actions;
use Galaxy::Physics::Object::Gravity::Actions;
use Galaxy::Physics::Object::Blackhole::Actions;
use Galaxy::Physics::Object::Star::Actions;

class Galaxy::Physics::Actions	{ 
	also does Galaxy::Physics::Object::Actions;
	also does Galaxy::Physics::Object::Galaxy::Actions;
	also does Galaxy::Physics::Object::Gravity::Actions;
	also does Galaxy::Physics::Object::Blackhole::Actions;
	also does Galaxy::Physics::Object::Star::Actions;
	
	has %.laws;


	method TOP ($/) { 
	#	return %!laws;
	%!laws<active>		= %!object;
	%!laws<galaxy>		= %!galaxy-laws;
	%!laws<gravity>		= %!gravity-laws;
	%!laws<blackhole>	= %!blackhole-laws;
	%!laws<star>			= %!star-laws;
	}

#	method star($/) 	{ make %!laws<star> = $/.Str	}

	method value($/) 	{ make $/.Str	}

}
