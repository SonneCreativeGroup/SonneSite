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
$mysqli = new mysqli($_POST['DB_HOST'], $_POST['DB_USER'], $_POST['DB_PASS'], $_POST['DB_NAME']);
$mysqli->set_charset("utf8");
header('Content-Type: text/html;charset=utf-8');

if(sqlImport('SonneDB.sql')){
	echo 'SUCCESS';
}else{
	echo 'ERROR';
	
}
?>