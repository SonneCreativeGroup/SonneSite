<?
require(SS_CLASSES."class.sonne-db.php");
require(SS_INCLUDES."sonne-functions.php");
require(SS_FLARES."PHPMailer/PHPMailerAutoload.php");

/**
 * SonneSite exception handler
 */
class SonneException extends Exception
{
    public function errorMessage()
    {
        $errorMsg = '<b class="fa fa-warning"> ' . $this->getMessage() . "</b><br />\n";
        return $errorMsg;
    }
}

class SonneSite {
	
	protected $dbhost;
	protected $dbuser;
	protected $dbpass;
	protected $dbname;
	protected static $s_instance;
	public $sid;
	public $db;
	public $debug = false;
	public $sMail;
	public function __construct($dbhost,$dbuser,$dbpass,$dbname){
		$this->dbhost = $dbhost;
		$this->dbuser = $dbuser;
		$this->dbpass = $dbpass;
		$this->dbname = $dbname;
		self::$s_instance = $this;
	}
	
	public function wakeup(){
		$db = new MysqliDB($this->dbhost,$this->dbuser,$this->dbpass,$this->dbname);
		if($db->connect()){
		// GET SESSION ID
			$sid = $_SESSION['sid'];
			if($sid == ''){
				$sid = sha1($_SERVER['REMOTE_ADDR'].'-'.date("Ymdgis"));
				$debugStr .= "session initiated<br>";
				$_SESSION['sid'] = $sid;
			}
		}else{
			if(is_dir(SS_ROOT.'ss-install')){
				header('location:'.SS_FACADE.'ss-install/install.php');
			}else{
				die('could not connect to database');
			}
		}

		
		// LOAD DATABASE
		
	}
	
	public function getPage(){
		
		$this->pageName = $_GET['url'];
		if($this->pageName == ''){
			$this->pageName = '';
		}
		return $this->pageName;
	}

	// BUILT IN PHPMailer
	/*
	public function SonneMail($to, $subject, $text ,$html, $from, $replyTo, $CC, $BCC, $attachment){
		$this->sMail = new PHPMailer;
		//BASIC MAIL SETTINGS
			$this->sMail->isHTML(true);
			$this->sMail->isSMTP();
			$this->sMail->SMTPDebug = 0;
			$this->sMail->Debugoutput = 'html';
			$this->sMail->Host = SMTP_HOST;
			$this->sMail->Port = SMTP_PORT;
			$this->sMail->SMTPAuth = true;
			$this->sMail->Username = SMTP_USERNAME;
			$this->sMail->Password = SMTP_PASSWORD;
		//MESSAGE SETTINGS
			if(!is_array($from)){//Set who the message is to be sent from
				$this->sMail->setFrom($from, COMPANY);
			}else{
				$this->sMail->setFrom($from[0], $from[1]);
			}
			if($replyTo != ''){
				if(!is_array($replyTo)){
					$this->sMail->addReplyTo($replyTo, '');
				}else{
					$this->sMail->addReplyTo($replyTo[0], $replyTo[1]);
				}
			}
			$this->sMail->Subject = $subject;//Set the subject line
			$this->sMail->Body = $html;
			$this->sMail->AltBody = $text;//FOr NON HTML RECEIVERS
			if($attachment != ''){
				$this->sMail->addAttachment($attachment);//Attach file
			}
		//Set who the message is to be sent to
			if(!is_array($to)){
				$this->sMail->addAddress($to, '');
			}else{
				for($e=0;$e<count($to);$e++){
					if(is_array($to[$e])){
						$this->sMail->addAddress($to[$e][0], $to[$e][1]);
					}else{
						$this->sMail->addAddress($to[$e], '');
					}
				}
			}
			if($CC != ''){
				if(!is_array($CC)){
					$this->sMail->addCC($CC, '');
				}else{
					for($e=0;$e<count($CC);$e++){
						if(is_array($CC[$e])){
							$this->sMail->addCC($CC[$e][0], $CC[$e][1]);
						}else{
							$this->sMail->addCC($CC[$e], '');
						}
					}
				}
			}
			if($BCC != ''){
				if(!is_array($BCC)){
					$this->sMail->addBCC($BCC, '');
				}else{
					for($e=0;$e<count($BCC);$e++){
						if(is_array($BCC[$e])){
							$this->sMail->addBCC($BCC[$e][0], $BCC[$e][1]);
						}else{
							$this->sMail->addBCC($BCC[$e], '');
						}
					}
				}
			}
		//send the message, check for errors
			if (!$this->sMail->send()) {
				echo '<div class="alert alert-danger">'.$this->sMail->ErrorInfo.'</div>';
			}else{
				return true;
			}
	}
	////////////////////////////////////////////////////
	*/	

	public function debugger(){
		
		$_SESSION['session_data']['debug'] = $_SESSION['session_data']['debug'];
		if($_GET['debug'] == 'on'){
			$_SESSION['session_data']['debug'] = true;
		}
		if($_GET['debug'] == 'off'){
			$_SESSION['session_data']['debug'] = false;
		}
		if($_SESSION['session_data']['debug']){
			echo '<div class="debugger" id="debugger"><pre style="background:none; color:#fff; margin:0; padding:0;">';
			echo '<div><a class="btn btn-mini" href="javascript:void()" onclick="hideDebug()">Hide</a>';
			echo '<a class="btn btn-mini" href="javascript:void()" onclick="showDebug()">Show</a>';
			echo '<h3>DEBUGGER</h3></div><hr />';
			echo '<p>'.$debugStr.'</p>';
			echo '<h3>CONFIGURATION SETTINGS</h3>';
			print_r($this->config);
			echo '<h3>POST DATA</h3>';
			print_r($_POST);
			echo '<h3>GET DATA</h3>';
			print_r($_GET);
			echo '<h3>SESSION DATA</h3>';
			print_r($_SESSION['session_data']);
			echo '<h3>SERVER VARIABLES</h3>';
			print_r($_SERVER);
			echo '</pre></div>';
		}
	}
	
}
?>
