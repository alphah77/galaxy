#use Op;
class Star::Dep {

  has Str     $.name is required;
  has Version $.age;

  submethod BUILD (
    Str :$!name;
        :$age;
    ) {

    $!age  := Version.new: $age if $age;
	}
}
