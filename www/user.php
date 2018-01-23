<?php
   header('Access-Control-Allow-Origin: *');
   include 'database.php';
   include 'html.php';
   
   
   $temp=$_GET["act"];
	if ($temp==""){
		header("Location: index.htm");
	}
	switch($temp) {
		case "show":
			dbConnect();
			
			$user=mysqli_real_escape_string($dbCon,$_GET["user"]);
			
			$sql="SELECT * FROM users WHERE UserID=$user";
			$result = query($sql);
			$sql2="SELECT COUNT(games.GameID) FROM games
				JOIN gamesowned ON gamesowned.GameID = games.GameID
				JOIN users ON gamesowned.UserID = users.UserID
				WHERE users.UserID=$user;";
			$result2 = query($sql2);
			
			$sql3="SELECT COUNT(friends.UserID) FROM friends
				WHERE friends.UserID=$user;";
			$result3 = query($sql3);
			
			echo htmlHead($result[0]['FirstName']." ".$result[0]['LastName']);
			echo htmlPicture($result[0]['ProfilePicture']);
			echo htmlStat($result[0]['DateOfBirth'],$result[0]['Gender'],$result2[0]["COUNT(games.GameID)"],
				$result3[0]["COUNT(friends.UserID)"]);
			
			echo htmlGames($user);
			echo htmlFriends($user);
			
			echo htmlFoot();
			
			dbClose();
		break;
	}
   
   
?>