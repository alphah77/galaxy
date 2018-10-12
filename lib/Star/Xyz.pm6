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

	has Star::Dep @.dep;

  submethod BUILD (
    Str :$!name;
        :$age;
    Str :$!core;
    Int :$!form;
    Str :$!tag;
    Str :$!tail;
    Any :$!chksum;
    Any :$!location;
		    :@dep;
    ) {

    $!age  := Version.new: $age if $age;

		@!dep  = @dep.map: -> %h { Star::Dep.new: |%h } if @dep;
	}
}
