<?
	function is_mod_rewrite_enabled() {
		$content = file_get_contents('http://'.$_SERVER['HTTP_HOST'].'/SonneInstall/inc/test_mod_rewrite');
		if (strpos($content,'FoShizzle') ) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	function encrypt($str,$ky) {
		$eKey = $ky;
		$encString = md5($str);
		$rStr = right($encString,16);
		$encString = $encString.$rStr.md5($eKey);
		$encString = sha1($encString);
		return $encString;
	}
	
	function pass_gen($length){
	  $random= "";
	  srand((double)microtime()*1000000);
	  
	  $char_list = "ABCDEFGHJKMNPQRSTUVWXYZ";
	  $char_list .= "abcdefghjkmnpqrstuvwxyz";
	  $char_list .= "23456789";
	  $char_list .= "!@#$%&*";
	
	  for($i = 0; $i < $length; $i++){    
		$random .= substr($char_list,(rand()%(strlen($char_list))), 1);  
	  }
	  return $random;
	}










function sqlImport($file)
{

    $delimiter = ';';
    $file = fopen($file, 'r');
    $isFirstRow = true;
    $isMultiLineComment = false;
    $sql = '';

    while (!feof($file)) {

        $row = fgets($file);

        // remove BOM for utf-8 encoded file
        if ($isFirstRow) {
            $row = preg_replace('/^\x{EF}\x{BB}\x{BF}/', '', $row);
            $isFirstRow = false;
        }

        // 1. ignore empty string and comment row
        if (trim($row) == '' || preg_match('/^\s*(#|--\s)/sUi', $row)) {
            continue;
        }

        // 2. clear comments
        $row = trim(clearSQL($row, $isMultiLineComment));

        // 3. parse delimiter row
        if (preg_match('/^DELIMITER\s+[^ ]+/sUi', $row)) {
            $delimiter = preg_replace('/^DELIMITER\s+([^ ]+)$/sUi', '$1', $row);
            continue;
        }

        // 4. separate sql queries by delimiter
        $offset = 0;
        while (strpos($row, $delimiter, $offset) !== false) {
            $delimiterOffset = strpos($row, $delimiter, $offset);
            if (isQuoted($delimiterOffset, $row)) {
                $offset = $delimiterOffset + strlen($delimiter);
            } else {
                $sql = trim($sql . ' ' . trim(substr($row, 0, $delimiterOffset)));
                query($sql);

                $row = substr($row, $delimiterOffset + strlen($delimiter));
                $offset = 0;
                $sql = '';
            }
        }
        $sql = trim($sql . ' ' . $row);
    }
    if (strlen($sql) > 0) {
        query($row);
    }

    fclose($file);
	return true;
}

/**
 * Remove comments from sql
 *
 * @param string sql
 * @param boolean is multicomment line
 * @return string
 */
function clearSQL($sql, &$isMultiComment)
{
    if ($isMultiComment) {
        if (preg_match('#\*/#sUi', $sql)) {
            $sql = preg_replace('#^.*\*/\s*#sUi', '', $sql);
            $isMultiComment = false;
        } else {
            $sql = '';
        }
        if(trim($sql) == ''){
            return $sql;
        }
    }

    $offset = 0;
    while (preg_match('{--\s|#|/\*[^!]}sUi', $sql, $matched, PREG_OFFSET_CAPTURE, $offset)) {
        list($comment, $foundOn) = $matched[0];
        if (isQuoted($foundOn, $sql)) {
            $offset = $foundOn + strlen($comment);
        } else {
            if (substr($comment, 0, 2) == '/*') {
                $closedOn = strpos($sql, '*/', $foundOn);
                if ($closedOn !== false) {
                    $sql = substr($sql, 0, $foundOn) . substr($sql, $closedOn + 2);
                } else {
                    $sql = substr($sql, 0, $foundOn);
                    $isMultiComment = true;
                }
            } else {
                $sql = substr($sql, 0, $foundOn);
                break;
            }
        }
    }
    return $sql;
}

/**
 * Check if "offset" position is quoted
 *
 * @param int $offset
 * @param string $text
 * @return boolean
 */
function isQuoted($offset, $text)
{
    if ($offset > strlen($text))
        $offset = strlen($text);

    $isQuoted = false;
    for ($i = 0; $i < $offset; $i++) {
        if ($text[$i] == "'")
            $isQuoted = !$isQuoted;
        if ($text[$i] == "\\" && $isQuoted)
            $i++;
    }
    return $isQuoted;
}

function query($sql)
{
    global $mysqli;
    //echo '#<strong>SQL CODE TO RUN:</strong><br>' . htmlspecialchars($sql) . ';<br><br>';
    if (!$query = $mysqli->query($sql)) {
        throw new Exception("Cannot execute request to the database {$sql}: " . $mysqli->error);
    }
}
?>