<?
ini_set('memory_limit', '5120M');
set_time_limit ( 0 );
error_reporting(E_ERROR | E_PARSE);
include('functions.php');
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
$_POST['DB_USER'],$_POST['DB_PASS'],$_POST['DB_NAME'],$_POST['DB_HOST']
if(passthru("nohup mysql -u ".$_POST['DB_USER']." -p ".$_POST['DB_PASS']." ".$_POST['DB_NAME']." < sonnedb.sql")){
*************************************************************/
//echo __DIR__;
$dbms_schema = __DIR__.'/sonnedb.sql';

$sql_query = @fread(@fopen($dbms_schema, 'r'), @filesize($dbms_schema)) or die('problem ');
$sql_query = remove_remarks($sql_query);
$sql_query = split_sql_file($sql_query, ';');

$host = $_POST['DB_HOST'];
$user = $_POST['DB_USER'];
$pass = $_POST['DB_PASS'];
$db = $_POST['DB_NAME'];

//In case mysql is deprecated use mysqli functions. 
mysql_connect($host,$user,$pass) or die('error connection');
mysql_select_db($db) or die('error database selection');

$i=1;
foreach($sql_query as $sql){
mysql_query($sql) or die('error in query');
}

$siteConf = "<?
define ('SS_FACADE','http://".$_SERVER['HTTP_HOST']."/');
define ('SS_ROOT','".$_SERVER['DOCUMENT_ROOT']."/');
define ('SS_INCLUDES',SS_ROOT.'ss-includes/');
define ('SS_CLASSES',SS_ROOT.'ss-classes/');
define ('SS_FLARES',SS_ROOT.'ss-flares/');
define ('SS_IMAGES',SS_ROOT.'ss-images/');
define ('SS_BRIDGE',SS_ROOT.'ss-bridge/');
define ('SS_DBH','".$_POST['DB_HOST']."');
define ('SS_DBN','".$_POST['DB_NAME']."');
define ('SS_DBU','".$_POST['DB_USER']."');
define ('SS_DBP','".$_POST['DB_PASS']."');
?>";
if(file_put_contents($_SERVER['DOCUMENT_ROOT']."/ss-includes/sonne-conf.php",$siteConf)){
		echo '<div class="alert alert-success">Your database has been imported successfuly.</div>';
}else{
	echo 'Error';
}

?>