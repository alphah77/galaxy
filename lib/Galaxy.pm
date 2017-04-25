use Alien;
use Nebula;
use Star;
use Gravity;
use Blackhole;

class Galaxy {
	has $.name		=	chomp qx{hostname};
	#	has $.origin	=	"";
	has $.bulge		= '/etc/galaxy/';
	has $.disk		= self.bulge	~	'stars/';
	has $.halo		=	'/var/galaxy/';
	has $.physics	= self.bulge	~ 'physics'; # Arch, Nebula, ..
	has $.core		= chomp qx{uname -m};
	has Nebula $.nebula;
	has Star $.star;
	has Gravity $.gravity;
	has Blackhole $.blackhole;
	has Alien $.alien;

}
