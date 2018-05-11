role Galaxy::Physics::Object::Galaxy {

	rule	galaxy-laws	{ <galaxy-law>+ }	

	proto rule galaxy-law	{ * }
	rule galaxy-law:sym<core>			{ <sym> <value> }
	rule galaxy-law:sym<yolo>			{ <sym> }
	rule galaxy-law:sym<nocolor>	{ <sym> }

}
