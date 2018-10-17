use Star::Dep;

role Star::Xyz {

  has Str     $.name is required;
  has Version $.age;
  has Str     $.core is rw;
  has Int     $.form;
  has Str     $.tag;
  has Str     $.tail;
	has Any     $.chksum;   # Chksum
  has Any     $.location; # Url

	has Star::Xyz @.cluster;

  submethod BUILD (
    Str :$!name;
        :$age;
    Str :$!core;
    Int :$!form;
    Str :$!tag;
    Str :$!tail;
    Any :$!chksum;
    Any :$!location;
		    :@cluster;
    ) {

    $!age  := Version.new: $age if $age;

		@!cluster  = @cluster.map: -> %h { Star::Xyz.new: |%h } if @cluster;
	}
}
