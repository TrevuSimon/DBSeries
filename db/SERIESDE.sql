CREATE TABLE genres
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	description TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE contents
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	description TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE franchises
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE serietypes
(
	id INT NOT NULL AUTO_INCREMENT,
	type VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE series
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	score INT,
	released DATE,
	description TEXT,
	franchise INT,
	type INT,
	PRIMARY KEY(id),
	FOREIGN KEY(franchise) REFERENCES franchises(id),
	FOREIGN KEY(type) REFERENCES serietypes(id)
);

CREATE TABLE genresseries
(
	id INT NOT NULL AUTO_INCREMENT,
	gid int,
	sid int,
	PRIMARY KEY(id),
	FOREIGN KEY(gid) REFERENCES genres(id),
	FOREIGN KEY(sid) REFERENCES series(id)
);

CREATE TABLE contentsseries
(
	id INT NOT NULL AUTO_INCREMENT,
	cid int,
	sid int,
	PRIMARY KEY(id),
	FOREIGN KEY(cid) REFERENCES contents(id),
	FOREIGN KEY(sid) REFERENCES series(id)
);

CREATE TABLE traits
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	description TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE appearances
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	description TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE characters
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	img LONGBLOB,
	description TEXT,
	age INT,
	gender INT,
	main INT,
	PRIMARY KEY(id)
);

CREATE TABLE characterstraits
(
	id INT NOT NULL AUTO_INCREMENT,
	tid int,
	cid int,
	PRIMARY KEY(id),
	FOREIGN KEY(tid) REFERENCES traits(id),
	FOREIGN KEY(cid) REFERENCES characters(id)
);

CREATE TABLE charactersseries
(
	id INT NOT NULL AUTO_INCREMENT,
	cid int,
	sid int,
	PRIMARY KEY(id),
	FOREIGN KEY(cid) REFERENCES characters(id),
	FOREIGN KEY(sid) REFERENCES series(id)
);

CREATE TABLE charactersappearances
(
	id INT NOT NULL AUTO_INCREMENT,
	aid int,
	cid int,
	PRIMARY KEY(id),
	FOREIGN KEY(aid) REFERENCES appearances(id),
	FOREIGN KEY(cid) REFERENCES characters(id)
);