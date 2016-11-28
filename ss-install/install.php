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
* Installation
*************************************************************/
require('inc/functions.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>SonneSite Installation</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="inc/bootstrap.css" rel="stylesheet" />
	<link href="inc/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>

<div class="modal fade" id="GetSonne" tabindex="-1" role="dialog" aria-labelledby="GetSonneLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="GetSonneLabel" style="color:#050B4E; font-size: 36px;"><b class="fa fa-gears fa-lg" style="color:#eb9316;"></b> <b>SonneSite Installation</b></h4>
      </div>
      <div class="modal-body">
       <div id="serverTestWelcome">
		   <p>First, let us check the server settings to make sure it can host SonneSite. This should only take a few seconds ...</p>
		   <div style="text-align: center;"><b class="fa fa-cog fa-spin fa-4x" style="color:#202970;"></b></div>
		  </div>
       <div id="serverTestResults" style="display:none;">
      		<div id="installProcessWindow">
				<? $reqErr = false; ?>
				<h1>Installation Progress</h1>
				<div class="progress">
					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 33%;">
						33%
					</div>
				</div>
				<ul class="list-group">
					<li class="list-group-item <?=(PHP_VERSION_ID >= 50200 ? 'list-group-item-success' : 'list-group-item-danger');?>">
						<b class="fa <?=(PHP_VERSION_ID >= 50200 ? 'fa-check' : 'fa-remove');?> fa-2x pull-left"></b>
						<b>PHP Version 5.2 or higher.</b><br />
						<i>You are currently running version <?=phpversion();?></i>
						<?
						if(PHP_VERSION_ID < 50200){$reqErr = true;}
						?>
					</li>
					<li class="list-group-item <?=(function_exists('mysqli_connect') ? 'list-group-item-success' : 'list-group-item-danger');?>">
						<b class="fa <?=(function_exists('mysqli_connect') ? 'fa-check' : 'fa-remove');?> fa-2x pull-left"></b>
						<b>mysqli</b><br />
						The MySQLi Extension (MySQL Improved) is a relational database driver used in the PHP programming language to provide an interface with MySQL databases.
						<?
						if(!function_exists('mysqli_connect')){$reqErr = true;}
							?>
					</li>
					<li class="list-group-item <?=(is_mod_rewrite_enabled() ? 'list-group-item-success' : 'list-group-item-danger');?>">
						<b class="fa <?=(is_mod_rewrite_enabled() ? 'fa-check' : 'fa-remove');?> fa-2x pull-left"></b>
						<b>MOD_REWRITE</b><br />
						<?
						if(!is_mod_rewrite_enabled()){$reqErr = true;}
						?>
					</li>
				</ul>
				<?
				if($reqErr){
				?>
					<div class="alert alert-danger">
						SonneSite cannot be installed until the required prerequisites are enabled on the hosting server. Contact your hosting service to resolve these issues. OR Sonne has servers that are already configured for optimal performance. Contact Us and we can get you all setup.
					</div>
				<?
				}else{
				?>
					<div class="alert alert-warning"><h3>CONGRATULATIONS - You are all ready to get rolling.</h3></div>
					<p><b>1st things 1st</b> ...</p>
					<p>let's get the database installed. You will need your database credentials for this step.</p>
					
					<form>
					<label for="DB_HOST">Database Host</label>
					<div class="input-group">
					  <span class="input-group-addon" id="db-host"><i class="fa fa-server fa-fw"></i></span>
					  <input type="text" class="form-control" name="DB_HOST" id="DB_HOST" aria-describedby="db-host" />
					</div>

					<label for="DB_HOST">Database Name</label>
					<div class="input-group">
					  <span class="input-group-addon" id="db-name"><i class="fa fa-database fa-fw"></i></span>
					  <input type="text" class="form-control" name="DB_NAME" id="DB_NAME" aria-describedby="db-name" />
					</div>

					<label for="DB_USER">User</label>
					<div class="input-group">
						<span class="input-group-addon" id="db-user"><i class="fa fa-user fa-fw"></i></span>
					  <input type="text" class="form-control" name="DB_USER" id="DB_USER" aria-describedby="db-user" />
					</div>

					<label for="DB_PASS">Password</label>
					<div class="input-group">
					  <span class="input-group-addon" id="db-pass"><i class="fa fa-lock fa-fw"></i></span>
					  <input type="text" class="form-control" name="DB_PASS"id="DB_PASS" aria-describedby="db-pass" />
					</div>
					</form>
				<button class="btn btn-primary" id="installDatabase">Continue <i class="fa fa-send fa-lg"></i></button>
				   <div id="databaseResults" style="display:none;"> </div>
				<?
				}
				?>
		  </div>
      		<div id="configurationWindow" style="display:none;">
				<h1>Installation Progress</h1>
				<div class="progress">
					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 67%;">
						67%
					</div>
				</div>
		    </div>
		    <div id="TheEnd">
				<h1>Installation Progress</h1>
				<div class="progress">
					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 100%;">
						100% - Achievement unlocked: You've gone Full Sonne.
					</div>
				</div>
		   </div>
       </div>
     </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><b class="fa fa-remove fa-lg"></b> Cancel Installation</button>
      </div>
    </div>
  </div>
</div>

<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-3">
	
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3">
		<img src="img/SonneSiteSplash.png" class="img-responsive" />
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3">
		<br />
		<h3 style="text-align: center; color:#202970;">
			<i class="fa fa-gears fa-3x" style="color:#eb9316;"></i><br />
			Your site, Your way.
			<br /><br />
			<button type="button" class="btn btn-warning btn-lg" id="StartInstall">
			  Begin Installation
			</button>
		</h3>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3">
	
	</div>
</div>
<div class="row">
	<div class="col-lg-4 col-md-4 col-sm-4"><div class="panel panel-default" style="margin:5px; padding:10px;">
		<h3 class="list-group-item-heading">Bootstrap</h3>
			<p>Bootstrap v3.3.7 - <a href="http://getbootstrap.com" class="link">http://getbootstrap.com</a>
			<img src="img/bootstrap-feature.png" class="img-responsive" /><br />
			<strong>Full of features</strong>
			<p>With Bootstrap, you get extensive and beautiful documentation for common HTML elements, dozens of custom HTML and CSS components, and awesome jQuery plugins.</p>
	</div></div>
	<div class="col-lg-4 col-md-4 col-sm-4"><div class="panel panel-default" style="margin:5px; padding:10px;">
		<h3 class="list-group-item-heading"><b class="fa fa-flag"></b> FontAwesome</h3>
			<p>Font Awesome v4.7.0 - <a href="http://fontawesome.io" class="link">http://fontawesome.io</a></p>
			<b class="fa fa-gears fa-4x"></b>&nbsp;&nbsp;&nbsp;
			<b class="fa fa-spinner fa-spin fa-3x" style="color:#202970;"></b> &nbsp;&nbsp;&nbsp;
			<b class="fa fa-home fa-2x" style="color:#eb9316;"></b> &nbsp;&nbsp;&nbsp;
			<a href="../SonneInstall/javascript.void();" class="btn btn-success btn-sm"><b class="fa fa-shopping-cart"></b> Cart</a>
			<br />
			<b>The Iconic Font &amp; CSS Toolkit</b><br />
			<p>Font Awesome gives you scalable vector icons that can instantly be customized — size, color, drop shadow, and anything that can be done with the power of CSS.</p>
	</div></div>
	<div class="col-lg-4 col-md-4 col-sm-4"><div class="panel panel-default" style="margin:5px; padding:10px;">
		<h3 class="list-group-item-heading">Payment Gateway Integration</h3>
			<p>
				<img src="img/AuthorizeNet-logo.png" style="height: 30px;" />&nbsp;&nbsp;&nbsp;
				<img src="img/PayPal-logo.png" style="height: 30px;" />&nbsp;&nbsp;&nbsp;
				<img src="img/Square-logo.png" style="height: 30px;" />
			</p>
			<p>Take payments by one of the pre-integrated processors. Give your customers options and activate two or more options. (Gateways may charge for services) </p>
	</div></div>
</div>
<footer id="footer">
	<div class="footer" style="text-align:center; padding:20px; border-top:1px solid #e7e7e7;">
		Copyright &copy; <?= date("Y"); ?>, Sonne Creative Group, LLC. All rights reserved. <br />
		Powered By: <a href="http://www.SonneCreativeGroup.com/SonneSite/overview" target="_blank">SonneSite</a>
	</div>
</footer>

<script src="inc/jquery-3.1.1.min.js"></script>
<script src="inc/plugins.js"></script>
<script>
	$('#StartInstall').click(function(){
		window.setTimeout(function() {
			document.getElementById('serverTestWelcome').style.display = "none";
			document.getElementById('serverTestResults').style.display = "block";
		}, 10000);				
		$('#GetSonne').modal();
	});
	
	$('#installDatabase').click(function(){
			$.post('inc/install-database.php',$("form").serialize(), function(data) {
				document.getElementById('databaseResults').style.display = "block";
				$('#databaseResults').empty();
				$('#databaseResults').append(data);
				if(data == 'SUCCESS'){
					document.getElementById('installProcessWindow').style.display = "none";
					document.getElementById('configurationWindow').style.display = "block";
				}
				console.log(data);
			});
	 });
</script>
</body>
</html>