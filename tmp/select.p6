#!/usr/bin/env perl6

use DBIish;

my %dep;

my $db = DBIish.connect('SQLite', database => </var/galaxy/galaxy.db>);

my $st = $db.prepare(q:to/STATEMENT/);
	SELECT  xyzname, depname , depage
	FROM dep;
	STATEMENT

$st.execute;

my @rows = $st.allrows(:array-of-hash);


@rows.map: -> $row { %dep.push: $row<xyzname> => { :name($row<depname>), :age($row<depage>) } };

%dep.say;
