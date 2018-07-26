PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE star (
id       INT  PRIMARY KEY NOT NULL,
name     TEXT             NOT NULL,
age      TEXT             NOT NULL,
core     TEXT             NOT NULL,
tag      TEXT             NOT NULL,
form     INT              NOT NULL,
tail     TEXT             NOT NULL,
location TEXT,
chksum   TEXT);
INSERT INTO star VALUES(0,'galaxy','0.0.7','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES(1,'rakudo','0.0.4','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES(2,'perl6','0.0.9','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES(3,'rakudo-star','0.0.2','x86_64','glx',0,'xyz',NULL,NULL);
INSERT INTO star VALUES(4,'perl7','0.0.4','x86_64','glx',0,'xyz',NULL,NULL);
CREATE TABLE planet (
id       INT  PRIMARY KEY NOT NULL,
type     TEXT             NOT NULL,
path     TEXT             NOT NULL,
perm     TEXT             NOT NULL,
chksum   TEXT,
starid   INT              NOT NULL);
INSERT INTO planet VALUES(0,'f','/etc/galaxy/law','644',NULL,0);
INSERT INTO planet VALUES(1,'f','/var/galaxy/galaxy.db','644',NULL,0);
CREATE TABLE cluster (
id    INT NOT NULL,
cid INT);
INSERT INTO cluster VALUES(0,NULL);
INSERT INTO cluster VALUES(1,0);
INSERT INTO cluster VALUES(2,1);
INSERT INTO cluster VALUES(3,NULL);
INSERT INTO cluster VALUES(4,1);
INSERT INTO cluster VALUES(4,0);
COMMIT;
