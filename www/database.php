<?php
   header('Access-Control-Allow-Origin: *');
   
	// database variables
   $dbHost = "localhost";
   $dbName = "games";
   $dbUser = "root";
   $dbPass = "";
	// database connection functions
   function dbConnect() {
	  global $dbCon, $dbHost, $dbName, $dbUser, $dbPass;
	  $dbCon = mysqli_connect($dbHost,$dbUser,$dbPass,$dbName);
	  if(! $dbCon ){
		die('Could not connect: ' . mysql_error());
	  }
   }
   
   function dbClose() {
	  global $dbCon, $dbHost, $dbName, $dbUser, $dbPass;
	  mysqli_close($dbCon);
	  unset($dbCon);
   }
   
   function query($sql){
	   global $dbCon, $dbResult;
	   if ($dbResult){
		mysqli_free_result($dbResult);
	   }
	   $dbResult=mysqli_query ($dbCon,$sql);
	   if ($dbResult===FALSE){
			die ("Error in query: $sql. " .mysqli_error($dbCon));
	   }
	   return mysqli_fetch_all($dbResult,MYSQLI_ASSOC);
   }
   
?>