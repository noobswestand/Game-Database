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
			$game=mysqli_real_escape_string($dbCon,$_GET["game"]);
			$sql="SELECT * FROM games WHERE GameID=$game";
			$result = query($sql);
			echo htmlHead($result[0]['Name']);
			echo htmlBuy($game);
			echo htmlPictures($game);
			
			echo htmlComments($game);
			
			//echo htmlFoot();
			dbClose();
		break;
	}
	
?>