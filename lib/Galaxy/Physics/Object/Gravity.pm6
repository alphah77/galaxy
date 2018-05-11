role	Galaxy::Physics::Object::Gravity	{

	rule	gravity-laws	{ <gravity-law>+ }

	proto rule gravity-law	{ * }
	rule gravity-law:sym<core>		{ <sym> <value> }
	rule gravity-law:sym<origin>	{ <sym> <value> }
	rule gravity-law:sym<cluster>	{ <sym> }

}	
