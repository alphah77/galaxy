PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE star (
name     TEXT PRIMARY KEY NOT NULL,
age      TEXT             NOT NULL,
core     TEXT             NOT NULL,
tag      TEXT             NOT NULL,
form     INT              NOT NULL,
tail     TEXT             NOT NULL,
location TEXT,
chksum   TEXT);
INSERT INTO star VALUES('galaxy','0.0.7','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES('rakudo','0.0.4','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES('perl6','0.0.9','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES('rakudo-star','0.0.2','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES('perl7','0.0.4','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES('nebula','0.0.1','x86_64','glx',0,'xyz',NULL,NULL);
CREATE TABLE planet (
type    TEXT NOT NULL,
path    TEXT NOT NULL,
perm    TEXT NOT NULL,
chksum  TEXT,
xyzname TEXT NOT NULL);
INSERT INTO planet VALUES('f','/etc/galaxy/law','644',NULL,'galaxy');
INSERT INTO planet VALUES('f','/var/galaxy/galaxy.db','644',NULL,'galaxy');
CREATE TABLE dep (
xyzname TEXT NOT NULL,
depname TEXT NOT NULL,
depage  TEXT);
INSERT INTO dep VALUES('rakudo','galaxy','0.0.7+');
INSERT INTO dep VALUES('perl6','rakudo',NULL);
INSERT INTO dep VALUES('perl7','rakudo','0.0.4+');
INSERT INTO dep VALUES('perl7','rakudo-star','0.0.2+');
COMMIT;
