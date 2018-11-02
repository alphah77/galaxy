use Star::Planet;

class Star {

  has Str     $.name is required;
  has Version $.age;
  has Str     $.core is required;
  has Int     $.form;
  has Str     $.tag;
  has Str     $.tail;
	has Any     $.chksum;   # Chksum
  has Any     $.location; # Url

  has Star::Planet @.planet;
	has Star         @.cluster;

  submethod BUILD (
    Str :$!name;
        :$age;
    Str :$!core = 'x86_64';    #REV
    Int :$!form;
    Str :$!tag;
    Str :$!tail;
    Any :$!chksum;
    Any :$!location;
		    :@cluster;
    ) {

    $!age  := Version.new: $age if $age;

		@!cluster  = @cluster.map: -> %h { Star.new: |%h } if @cluster;
	}

	method Str () {
    #($!name, $!age, $!core, $!form, $!tag).join('-');
    ($!name, $!age).join('-');
	}

}
