#unit module Universe;
# Class to create Universe which will hold Alien, Galaxy, Nebula if their laws set by Alien are consistent;
use Galaxy;
use Nebula;

class Universe {
	has $.name;
	has @.laws;
	has %.physics;
	#	has %!physics;
	has Galaxy $.galaxy;
	has Nebula @.nebula;

	submethod TWEAK() {
		my $physics = '/etc/galaxy/physics';
		for $physics.IO.lines.grep: {! (/^\# | ^\s*$/)} -> $law {
				my @law = $law.trim.split(/\s+/);
				given @law {
					when @law.head ~~ /:i Galaxy/	{}; 
				}
		}

		enum Power <A B>;
		my @power = <gravity blackhole telescope>;
		while @!laws {
			my $law = @!laws.shift;
			given $law {
				#when $law eq 'origin'			{ %!physics{'origin'}		= @!laws.shift };
				when Power $law 				{ %!physics{'core'}			= @!laws.shift };
				when $law eq 'core'				{ %!physics{'core'}			= @!laws.shift };
				when $law eq 'nebula'			{ %!physics{'nebula'}		= @!laws.shift };
				when $law eq 'yolo'				{ %!physics{'yolo'}			= 'yolo' };
				when $law eq 'nocolor'		{ %!physics{'nocolor'}	= 'nocolor' };
				when $law eq any(@power)	{ %!physics{'power'} 		= $law; %!physics{$law} = @!laws; return };
				default {say "Usage: "; exit};	
			}
		}
	}

		
	method create() {

	}
}
