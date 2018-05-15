role Galaxy::Physics::Galaxy {

	token galaxy { 'galaxy' }

	token	galaxy-laws	{ <galaxy-law>+ % <space> }	

	proto token galaxy-law	{ * }
	token galaxy-law:sym<core>    { <sym> <space>* <value> }
	token galaxy-law:sym<yolo>    { <<<sym>>> }
	token galaxy-law:sym<nocolor> { <<<sym>>> }

}
