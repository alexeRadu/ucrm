DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS activity_type;
DROP TABLE IF EXISTS activity;

CREATE TABLE user (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	username	TEXT UNIQUE NOT NULL,
	password	TEXT NOT NULL,
	accounttype	TEXT NOT NULL
);

CREATE TABLE activity_type (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name		TEXT UNIQUE NOT NULL
);

CREATE TABLE activity (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	userid		INTEGER NOT NULL,
	activityid	INTEGER NOT NULL,
	time		TEXT NOT NULL,
	duration	INTEGER NOT NULL,
	details		TEXT
);

INSERT INTO user(username, password, accounttype) VALUES("George", "1234", "admin");
INSERT INTO user(username, password, accounttype) VALUES("Anca", "qwer", "normal");

INSERT INTO activity_type(name) VALUES("activity1");
INSERT INTO activity_type(name) VALUES("activity2");
INSERT INTO activity_type(name) VALUES("activity3");

