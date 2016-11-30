<?php
session_start();
ob_start(ob_gzhandler);
require(__DIR__.'/ss-includes/sonne-conf.php');
require("ss-classes/class.sonne-site.php");
/*************************************************************
* SonneSite - A fully customizable, fully responsive website *
**************************************************************
	version 1.0
	Copyright (c) 2016
*/
$_SS = new SonneSite(SS_DBH ,SS_DBU, SS_DBP, SS_DBN);
$_SS->wakeup();
/*
	Andrew J Becker <Andrew.Becker@SonneCreativeGroup.com>
	Sonne Creative Group, LLC.
	http://www.SonneCreativeGroup.com/SonneSite/overview

**************************************************************
* Your site ... Your way
*************************************************************/
session_write_close();
ob_flush();
ob_end_clean();

?>