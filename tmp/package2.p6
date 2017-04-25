grammar Pkg {
        rule TOP {
        |       <package-name> <version> <arch> <build> <tag> <ext> # Can probably be written cleaner
        |       <package-name> <version> <arch> <build> <ext>
        |       <package-name> <version> <arch> <build> <tag>
        |       <package-name> <version> <arch> <build>
        |       <package-name> <version>
        |       <package-name>
        }
        token package-name { \w+ '-' \w+ }
        token version { '-' \d+ '.' \d+ }
        token arch { '-' 'x86_64' }
        token build { '-' \d+ }
        token ext { '.pkg' }
        token tag { '-' \w+ }
}    

use Test;
ok Pkg.parse('rakudo-star'), 'name';
ok Pkg.parse('rakudo-star-0.7'), 'name-ver';
ok Pkg.parse('rakudo-star-0.7-x86_64-0'), 'name-ver-arch-build';
ok Pkg.parse('rakudo-star-0.7-x86_64-0.pkg'), 'name-ver-arch-build-ext';
ok Pkg.parse('rakudo-star-0.7-x86_64-0-tag'), 'name-ver-arch-build-tag';
ok Pkg.parse('rakudo-star-0.7-x86_64-0-tag.pkg'), 'name-ver-arch-build-tag.ext';
nok Pkg.parse('rakudo-star-0.7-0'), 'build must come after arch';
nok Pkg.parse('rakudo-star-0.7.pkg'),'ext must come after build or tag';
