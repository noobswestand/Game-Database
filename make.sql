CREATE DATABASE games;

USE games;

DROP TABLE IF EXISTS dlc;
DROP TABLE IF EXISTS gamesowned;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS gamepictures;
DROP TABLE IF EXISTS gametag;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS games;


CREATE TABLE users(
	UserID			INT unsigned	NOT NULL auto_increment,
	FirstName		VARCHAR(255)	NOT NULL,
	LastName		VARCHAR(255)	NOT NULL,
	DateOfBirth		DATE			NOT NULL,
	Gender			CHAR(1)			NOT NULL,
	ProfilePicture 	VARCHAR(255),
	Salt			VARCHAR(255)	NOT NULL,
	HashPass		VARCHAR(255)	NOT NULL,
	RegDate			DATE			NOT NULL,
	PRIMARY KEY (UserID)
);


CREATE TABLE friends(
	UserID		INT unsigned	NOT NULL,
	FriendID	INT unsigned	NOT NULL,
	FOREIGN KEY (UserID) 	REFERENCES users(UserID),
	FOREIGN KEY (FriendID)	REFERENCES users(UserID)
);


CREATE TABLE games(
	GameID			INT unsigned		NOT NULL auto_increment,
	Price           decimal(10,2) 		NOT NULL,
	Name			VARCHAR(255)		NOT NULL,
	Description		VARCHAR(1024)		NOT NULL,
	Rating			VARCHAR(5),
	Publisher		VARCHAR(255)		NOT NULL,
	Developer		VARCHAR(255)		NOT NULL,
	ReleaseDate		DATE				NOT NULL,
	PRIMARY KEY (GameID)
);


CREATE TABLE dlc(
	DLCID			INT unsigned		NOT NULL auto_increment,
	GameID			INT unsigned		NOT NULL,
	Price           decimal(10,2) 		NOT NULL,
	Name			VARCHAR(255)		NOT NULL,
	Description		VARCHAR(1024)		NOT NULL,
	PRIMARY KEY (DLCID)
);


CREATE TABLE gamepictures(
	PictureID	INT unsigned			NOT NULL auto_increment,
	GameID		INT unsigned			NOT NULL,
	Picture		VARCHAR(255)	 		NOT NULL,
	PRIMARY KEY (PictureID),
	FOREIGN KEY (GameID)	REFERENCES games(GameID)
);


CREATE TABLE gamesowned(
	UserID		INT unsigned	NOT NULL,
	GameID		INT unsigned	NOT NULL,
	BoughtDate	DATE			NOT NULL,
	Comments	VARCHAR(1024),
	HoursPlayed	INT unsigned,
	Rating		INT unsigned CHECK ((testing >= 1 AND testing <=5) OR NULL),
	FOREIGN KEY (UserID)	REFERENCES users(UserID),
	FOREIGN KEY (GameID)	REFERENCES games(GameID)
);



CREATE TABLE tag(
	TagID	INT unsigned			NOT NULL auto_increment,
	Name	VARCHAR(255),
	PRIMARY KEY (TagID)
);

CREATE TABLE gametag(
	GameID		INT unsigned	NOT NULL,
	TagID		INT unsigned	NOT NULL,
	FOREIGN KEY (GameID) 	REFERENCES games(GameID),
	FOREIGN KEY (TagID)		REFERENCES tag(TagID)
);
