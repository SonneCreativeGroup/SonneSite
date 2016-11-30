<?
/*************************************************************
* SonneSite - A fully customizable, fully responsive website *
**************************************************************
	version 1.0
	Copyright (c) 2016
	
	Andrew J Becker <Andrew.Becker@SonneCreativeGroup.com>
	Sonne Creative Group, LLC.
	http://www.SonneCreativeGroup.com/SonneSite/overview

	Bethany - My daughter, My soul, My life ♥ I love you
	
**************************************************************
* Import MySql Database
*************************************************************/
	include('functions.php');
	define("MYSQL_CONN_ERROR", "Unable to connect to database."); 

	// Ensure reporting is setup correctly 
	mysqli_report(MYSQLI_REPORT_STRICT); 

	// Connect function for database access 

if($_POST['DB_USER'] == '' || $_POST['DB_PASS'] == '' || $_POST['DB_NAME'] == '' || $_POST['DB_HOST'] == ''){
	echo 'ALL fields must be filled out';
}else{
	try { 
		$mysqli = new mysqli($_POST['DB_HOST'],$_POST['DB_USER'],$_POST['DB_PASS'],$_POST['DB_NAME']); 

			if(sqlImport('SonneDB.sql')){
				$siteConf = "<?\n
				define ('SS_DBH','localhost');\n
				define ('SS_DBN','');\n
				define ('SS_DBU','');\n
				define ('SS_DBP','');\n
				?>";
				file_put_contents(SS_INCLUDES."sonne-conf.php",$siteConf,FILE_APPEND);
				echo 'SUCCESS';
			}else{
				echo 'ERROR';
			}
	} catch (Exception $e) { 
	  echo $e->errorMessage(); 
	} 
}
?>