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

INSERT INTO user(username, password, accounttype) VALUES("Ensar Duman", "1234", "admin");
INSERT INTO user(username, password, accounttype) VALUES("George", "1234", "normal");
INSERT INTO user(username, password, accounttype) VALUES("Anca", "1234", "normal");

INSERT INTO activity_type(name) VALUES("Programare Pacienti");
INSERT INTO activity_type(name) VALUES("Incasare Bani");
INSERT INTO activity_type(name) VALUES("Organizare Documente");

INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-20 days'), 30);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-19 days'), 180);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-19 days'), 120);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-18 days'), 160);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-17 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-16 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-15 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-14 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-13 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-12 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-11 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-10 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-9 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-8 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-7 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-6 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-5 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now', '-4 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-3 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now', '-2 days'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now', '-1 day'), 60);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 3, DATE('now'), 240);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 1, DATE('now'), 210);
INSERT INTO activity(userid, activityid, time, duration) VALUES(2, 2, DATE('now'), 120);

