

/*Find games that are tagged with NSFW and rated E  lol*/
SELECT games.GameID,games.Name as GameName,tag.Name as TagName,games.Rating FROM gametag
INNER JOIN games ON gametag.GameID = games.GameID
INNER JOIN tag ON tag.TagID = gametag.TagID
WHERE  tag.Name LIKE "%NSFW%" AND (games.Rating LIKE "%E%" OR games.Rating LIKE "%e%");


/*Find people with no games :(*/
SELECT users.UserID,users.FirstName,users.LastName from Users
LEFT JOIN gamesowned ON users.UserID=gamesowned.UserID
WHERE gamesowned.UserID IS NULL;


/*People with the most friends*/
SELECT users.UserID,users.FirstName,COUNT(friends.UserID) FROM users
INNER JOIN friends ON users.UserID = friends.UserID
GROUP BY users.UserID
ORDER BY COUNT(friends.UserID) DESC
LIMIT 10;

/*People with the most games*/
SELECT users.UserID, users.FirstName, COUNT(gamesowned.UserID) FROM users
INNER JOIN gamesowned ON gamesowned.UserID = users.UserID
GROUP BY users.UserID
ORDER BY COUNT(gamesowned.UserID) DESC
LIMIT 10;

/*People who rate games the highest/lowest*/
SELECT users.UserID,users.FirstName,AVG(gamesowned.Rating) FROM users
INNER JOIN gamesowned ON gamesowned.UserID = users.UserID
GROUP BY users.UserID
ORDER BY AVG(gamesowned.Rating) DESC
LIMIT 10;

/*Get people who rate the most games*/
SELECT users.UserID, users.FirstName, COUNT(gamesowned.Rating) FROM users
INNER JOIN gamesowned ON gamesowned.UserID = users.UserID
WHERE gamesowned.Rating IS NOT NULL
GROUP BY users.UserID
ORDER BY COUNT(gamesowned.Rating) DESC
LIMIT 10;


/*Search games and include thier thumbnail + other information*/
SELECT games.GameID,games.Name,games.Price,games.Rating,gamepictures.Picture FROM games
LEFT JOIN gamepictures ON gamepictures.GameID = games.GameID
WHERE Name LIKE '%hi%'
GROUP BY games.GameID;

/*Search games*/
SELECT * FROM games
WHERE Name LIKE '%$search%';


/*Search games by Tag. Include thumbnail + other information*/
SELECT games.GameID,games.Name,games.Price,games.Rating,gamepictures.Picture,tag.Name as Tag FROM games
INNER JOIN gamepictures ON gamepictures.GameID = games.GameID
INNER JOIN gametag ON games.GameID = gametag.GameID
INNER JOIN tag ON tag.TagID = gametag.TagID
WHERE  tag.Name LIKE "%zombie%"
GROUP BY games.GameID


/*Search games by Tag*/
SELECT games.GameID,games.Name FROM gametag
INNER JOIN games ON gametag.GameID = games.GameID
INNER JOIN tag ON tag.TagID = gametag.TagID
WHERE  tag.Name LIKE "%zombie%";

/*Gets the average rating of a game*/
SELECT gamesowned.GameID, AVG(gamesowned.Rating) as Rating from gamesowned
WHERE gamesowned.GameID=1;

/*Gets all the comments on a game*/
SELECT users.UserID,gamesowned.Comments,users.ProfilePicture,users.FirstName FROM gamesowned
INNER JOIN users ON users.UserID = gamesowned.UserID
WHERE gamesowned.GameID=1 AND gamesowned.Comments IS NOT NULL;

/*Order games by highest price*/
SELECT Name,Price,Rating FROM games
ORDER BY Price DESC
LIMIT 10;
/*Order games by lowest price*/
SELECT Name,Price,Rating FROM games
ORDER BY Price
LIMIT 10;

/*Game that is most owned*/
SELECT COUNT(gamesowned.GameID) as GameOwnedCount,gamesowned.GameID FROM gamesowned
GROUP BY gamesowned.GameID
ORDER BY COUNT(gamesowned.GameID) DESC
LIMIT 10;

/*Game that is most played*/
SELECT SUM(gamesowned.HoursPlayed),gamesowned.GameID FROM gamesowned
GROUP BY gamesowned.GameID
ORDER BY SUM(gamesowned.HoursPlayed) DESC
LIMIT 10;

/*Most valuable accounts*/
SELECT SUM(games.Price),users.UserID FROM games
INNER JOIN gamesowned ON gamesowned.GameID = games.GameID
INNER JOIN users ON gamesowned.UserID = users.UserID
GROUP BY users.UserID
ORDER BY SUM(games.Price) DESC
LIMIT 10;


/*Displays all the game information for a given GameID*/
SELECT * FROM games WHERE GameID=1;
SELECT Picture FROM gamepictures WHERE GameID=1;

/*Displays all games owned by a given UserID AND gets the "thumbnail" as well*/
SELECT DISTINCT games.GameID, games.Name, gamepictures.Picture, gamesowned.HoursPlayed FROM games
INNER JOIN gamesowned ON gamesowned.GameID = games.GameID
INNER JOIN users ON gamesowned.UserID = users.UserID
INNER JOIN gamepictures ON gamepictures.GameID = games.GameID
WHERE users.UserID=1
GROUP BY games.GameID
ORDER BY gamesowned.HoursPlayed DESC;


/*Displays all games owned by a given UserID*/
SELECT games.GameID,games.Name FROM games
JOIN gamesowned ON gamesowned.GameID = games.GameID
JOIN users ON gamesowned.UserID = users.UserID
WHERE users.UserID=1;


/*Counts the number of friends for a given UserID*/
SELECT COUNT(friends.UserID) FROM friends
WHERE friends.UserID=1;

/*Counts the number of games for a given UserID*/
SELECT COUNT(games.GameID) FROM games
JOIN gamesowned ON gamesowned.GameID = games.GameID
JOIN users ON gamesowned.UserID = users.UserID
WHERE users.UserID=1;



/*Gets the percentage of Males to Females*/
SET @Males=(SELECT COUNT(users.Gender) FROM users WHERE users.Gender="M");
SET @Females=(SELECT COUNT(users.Gender) FROM users WHERE users.Gender="F");
SET @Total=(SELECT COUNT(users.Gender) FROM users);
SET @PercentageMales=(@Males/@Total)*100;
SET @PercentageFemales=(@Females/@Total)*100;
SELECT @PercentageMales;
SELECT @PercentageFemales;



/*Displays everyone is is a friend for a given UserID*/
SELECT users.UserID,users.FirstName,users.LastName,users.ProfilePicture FROM friends
JOIN users ON friends.FriendID = users.UserID
WHERE friends.UserID=1;



/*Displays a friendship table*/
select users.UserID    as person,
       users.FirstName  as person_first_name,
       users.LastName  as person_last_name,
       usersf.UserID   as friend_id,
       usersf.FirstName as friend_first_name,
       usersf.LastName  as friend_last_name
  from users
  join friends
    on users.UserID = friends.UserID
    or users.UserID = friends.FriendID
  join users usersf
    on (usersf.UserID = friends.UserID and
       usersf.UserID <> users.UserID)
    or (usersf.UserID = friends.FriendID and
       usersf.UserID <> users.UserID)
 order by 2, 3,5,6
 