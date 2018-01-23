<?php
   header('Access-Control-Allow-Origin: *');
   
   function picture($path,$width=-1,$height=-1,$href=""){
	   if ($width===-1){
			return "<img src='$path'>";
	   }else{
			if ($href===""){
				return "<img src='$path' width='$width' height='$height'>";
			}else{
				return "<a href='$href'>
				<img src='$path' width='$width' height='$height'>
				</a>";
				
			}
	   }
   }
   function htmlHead($h){
	   $str=file_get_contents("head.txt");
	   $str.="<!-- Head -->
		<div class='back'>
			<br></br> <br></br>
			<h1>$h</h1>
			<br></br> <br></br>
		</div>";
		return $str;
   }
   function htmlFoot(){
	   $str=file_get_contents("foot.txt");
	   return $str;
   }
   
   function htmlPicture($p){
	   $str=file_get_contents("profilePicture.txt");
	   $str.="<div class='noBack'><img src=$p></div>";
	   $str.="</div>";
	   return $str;
   }
   function htmlStat($b,$g,$c0,$c1){
	   $str=file_get_contents("profileStats.txt");
	   $str.="<p>Birthday: $b</p>";
	   if ($g==="F"){
		   $g="Female";
	   }else{
		   $g="Male";
	   }
	   $str.="<p>Gender: $g</p>";
	   $str.="<p>Games Owned: $c0</p>";
	   $str.="<p>Number of Friends: $c1</p>";
	   $str.="</div>";
	   return $str;
   }
   
   function htmlFriends($user){
	   $str=file_get_contents("profileFriends.txt");
	   $sql="SELECT users.UserID,users.FirstName,users.LastName,users.ProfilePicture FROM friends
			JOIN users ON friends.FriendID = users.UserID
			WHERE friends.UserID=$user
			LIMIT 12;";
		$result = query($sql);
		foreach($result as &$result2) {
			$id=$result2["UserID"];
			$str.="<a href='user.php?act=show&user=$id'>
				<div style='width=150px;height:100px;overflow:hidden;
				display:inline-block; margin:15px;float:center;margin-bottom:50px' class='noBack'>";
			
			$str.="<p style='width:100px;margin:0px;float:left;position:absolute;overflow:hidden;'>".$result2["FirstName"]."</p>";
			$str.=picture($result2["ProfilePicture"],100,100);
			$str.="</div></a>";
			
		}
		$str.="</div>";
	   return $str;
   }
   function htmlGames($user){
	   $str=file_get_contents("profileGames.txt");
	   $sql="SELECT DISTINCT games.GameID, games.Name, gamepictures.Picture, gamesowned.HoursPlayed FROM games
			INNER JOIN gamesowned ON gamesowned.GameID = games.GameID
			INNER JOIN users ON gamesowned.UserID = users.UserID
			INNER JOIN gamepictures ON gamepictures.GameID = games.GameID
			WHERE users.UserID=$user
			GROUP BY games.GameID
			ORDER BY gamesowned.HoursPlayed DESC
			LIMIT 12;";
		$result = query($sql);
		foreach($result as &$result2) {
			$id=$result2["GameID"];
			$str.="<a href='game.php?act=show&game=$id'>
				<div style='width=150px;height:100px;overflow:hidden;
				display:inline-block; margin:15px;float:center;margin-bottom:50px' class='noBack'>";
			
			$str.="<p style='width:100px;margin:0px;float:left;position:absolute;overflow:hidden;'>".$result2["Name"]."</p>";
			
			$str.=picture($result2["Picture"],100,100);
			$str.="<p style='width:100px;margin-top:-35px;float:left;position:absolute;overflow:hidden;'>Hours: ".$result2["HoursPlayed"]."</p>";
			
			$str.="</div></a>";
		}
		$str.="</div>";
	   return $str;
   }
   
   
   function htmlBuy($game){
	   $str=file_get_contents("gameBuy.txt");
		$sql="SELECT * FROM games WHERE GameID=$game";
		$result = query($sql);
		
		$rate=$result[0]["Rating"];
		$pic="";
		switch($rate){
			case "eC":
			case "E":
			case "E10+":
			case "T":
			case "M":
			case "A":
				$pic="pictures/ratings/$rate.png";
			break;
			
			default:
				$pic="pictures/ratings/RP.png";
			break;
			
		}
		
		$sql="SELECT gamesowned.GameID, AVG(gamesowned.Rating) as Rating from gamesowned
			WHERE gamesowned.GameID=$game;";
		$result2=query($sql);
		
		$str.="<img src='$pic' width='84' height='128' style='float:left;margin-left:50px;margin-bottom:100px;'>";
		$str.="<ul style='width:300px;margin:0px;float:top;margin-left:125px;'>";
		$str.="<li><p style='width=100px;margin:0px;'>Price: ".$result[0]["Price"]."</p></li>";
		$str.="<li><p style='width=100px;margin:0px;'>Developer: ".$result[0]["Developer"]."</p></li>";
		$str.="<li><p style='width=100px;margin:0px;'>Publisher: ".$result[0]["Publisher"]."</p></li>";
		$str.="<li><p style='width=100px;margin:0px;'>Rating: ".$result2[0]["Rating"]." / 5</p></li>";
		$str.="<li><p style='width=100px;margin:0px;'>Release Date: ".$result[0]["ReleaseDate"]."</p></li>";
		$str.="</ul>";
	   $str.="</div>";
	   return $str;
   }
   
   function htmlPictures($game){
		$str=file_get_contents("gamePictures.txt");
		$sql="SELECT Picture FROM gamepictures WHERE GameID=$game";
		$result = query($sql);
		foreach($result as &$result2) {
			$pic=$result2["Picture"];
			$str.="<div class='noBack' style='display:none;'><img src='$pic'/></div>";
		}
		$str.= "</div>
			</div>";
		return $str;
   }
   
   
   function htmlComments($game){
	   $str=file_get_contents("gameComments.txt");
	   $sql="SELECT users.UserID,gamesowned.Comments,users.ProfilePicture,users.FirstName FROM gamesowned
		INNER JOIN users ON users.UserID = gamesowned.UserID
		WHERE gamesowned.GameID=1 AND gamesowned.Comments IS NOT NULL;";
	   $result=query($sql);
	   if (count($result) > 0){
		   $str.="<ul style='display:inline-block;width:100%;'>";
		   foreach($result as &$result2) {
			   $str.="<li style='width:450px;height:250px;margin:50px;display: inline-block;'><div style='display: inline-block;'>";
			   $id=$result2["UserID"];
			   $str.="<a href='user.php?act=show&user=$id'>
				<div style='width=150px;height:100px;overflow:hidden;
				display:inline-block; margin:15px;float:center;margin-bottom:50px' class='noBack'>";
				$str.="<p style='width:100px;margin:0px;float:left;position:absolute;overflow:hidden;'>".$result2["FirstName"]."</p>";
				$str.=picture($result2["ProfilePicture"],100,100);
				$str.="</div></a>";
			   $str.="<p style='float:right;'>".$result2["Comments"]."</p>";
			   $str.="</div></li>";
		   }
		   $str.="</ul>";
	   }else{
		   $str.="<p>There are no users comments</p>";
	   }
	   return $str;
   }
   
   
?>