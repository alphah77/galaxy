#use Alien;
#use Nebula;
#use Star;
use Gravity;
use Blackhole;

class Galaxy {
	has $.name		=	chomp qx<hostname>;
	#	has $.origin	=	"";
	has $.bulge		= '/etc/galaxy/';
	has $.disk		= self.bulge	~	'stars/';
	has $.halo		=	'/var/galaxy/';
	has $.core		= chomp qx<uname -m>;
	has %.laws;
	has %.xyz;
	#	has Nebula $.nebula;
	#has Star $.star;
	has Gravity $.gravity;
	has Blackhole $.blackhole;
	#has Alien $.alien;

	method stable() {

	}
}
