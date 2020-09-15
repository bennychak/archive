<?php
class Fun
{
	/**
	 * 特殊加密url,防止地址被解析不完全
	 *
	 * @param string $class
	 * @return string
	 */
	public static function iurlencode($key)
	{
		if(preg_match('/^apache/i', $_SERVER['SERVER_SOFTWARE']))
		{
			//Apache在重写情况下 “/” 需要加密两次，否则Url rewrite出错
			return rawurlencode(str_replace(array('/', '?', '&', '#'), array( Core_Config::get('seo', 'basic', 0) ? '%252F' : '%2F', '%3F', '%26', '%23'), $key));
		}
		else
		{
			return rawurlencode(str_replace(array('/', '?', '&', '#'), array('%2F', '%3F', '%26', '%23'), $key));
		}
	}
	
	/**
	 * 对节目名称进行正则匹配
	 *
	 * @param string $programName
	 * @return string
	 */
	 public static function formatProgram($programName = '')
	 {
	 	if (empty($programName)) return false;
		
		$tmpStr = $programName;
		//**集全角匹配
		if (preg_match("/[）]$/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, 0, strrpos($tmpStr, '（'));
		}
		
		//**集半角匹配
		if (preg_match("/[)]$/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, 0, strrpos($tmpStr, '('));
		}
		
		//**剧场全角匹配
		if (preg_match("/(剧场：)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '剧场：') + strlen('剧场：'));
		}
		
		//**剧场半角匹配
		if (preg_match("/(剧场:)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '剧场:') + strlen('剧场:'));
		}
		
		//**剧全角匹配
		if (preg_match("/(剧：)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '剧：') + strlen('剧：'));
		}
		
		//**场半角匹配
		if (preg_match("/(剧:)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '剧:') + strlen('剧:'));
		}
		
		//**集全角匹配
		if (preg_match("/(集：)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '集：') + strlen('集：'));
		}
		
		//**集半角匹配
		if (preg_match("/(集:)/", $tmpStr))
		{
			$tmpStr = substr($tmpStr, strrpos($tmpStr, '集:') + strlen('集:'));
		}
		
		return $tmpStr;
	 }
	
	
	/**
	 * 截取字符串
	 * @param string $string  input
	 * @param int  $length  length
	 * @param string $dot     后缀
	 * @param string $charset charset
	 * @return string    output
	 * */
	public function str_cut($string, $length, $dot = '...', $charset = 'utf-8', $strip_tags = 0)
	{
		if ($strip_tags) $string = strip_tags($string);
		$strlen = strlen($string);
		if($strlen <= $length) return $string;
		$specialchars = array('&amp;', '&quot;', '&#039;', '&lt;', '&gt;');
		$entities = array('&', '"', "'", '<', '>');
		$string = str_replace($specialchars, $entities, $string);
		$strcut = '';
		if(strtolower($charset) == 'utf-8')
		{
			$n = $tn = $noc = 0;
			while($n < $strlen)
			{
				$t = ord($string[$n]);
				if($t == 9 || $t == 10 || (32 <= $t && $t <= 126))
				{
					$tn = 1; $n++; $noc++;
				}
				else if(194 <= $t && $t <= 223) 
				{
					$tn = 2; $n += 2; $noc += 2;
				} 
				else if(224 <= $t && $t < 239) 
				{
					$tn = 3; $n += 3; $noc += 2;
				} 
				else if(240 <= $t && $t <= 247) 
				{
					$tn = 4; $n += 4; $noc += 2;
				} 
				else if(248 <= $t && $t <= 251) 
				{
					$tn = 5; $n += 5; $noc += 2;
				} 
				else if($t == 252 || $t == 253) 
				{
					$tn = 6; $n += 6; $noc += 2;
				} 
				else 
				{
					$n++;
				}
				if($noc >= $length) break;
			}
			if($noc > $length) $n -= $tn;
			$strcut = substr($string, 0, $n);
		}
		else
		{
			$dotlen = strlen($dot);
			$maxi = $length - $dotlen - 1;
			for($i = 0; $i < $maxi; $i++)
			{
				$strcut .= ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
			}
		}
		return $strcut.$dot;
	}
	
	/**
	 * 获取话题名称
	 * 
	 * @param string $str 当前节目名称
	 * @return string $topicName
	 * */
	public static function getTopicName($str)
	{
		$order = array('：', '(', '（', ' ', '[', '《');
		$need = false; $flag = false;
		foreach ($order as $val)
		{
			if(strpos($str, $val)){
				$need = true;
				($val==='（'||$val===':') && $flag = true;
				break;
			}
		}
		$topic = $str;
		if($need){
			$replace = str_replace($order, '\n\r', trim($str));
			$arr = explode('\n\r', $replace);
			$topic = $arr[0];
			if(!$flag){
				count($arr > 1) && $topic = $arr[1];
			}
		}
		return $topic;
	}

	/**
     * timestamp转换成显示时间格式
     * @param $timestamp
     * @return unknown_type
     */
    public static function TimeFormat($timestamp)
    {
        $curTime = time();
        $space = $curTime - $timestamp;
        //1分钟
        if($space < 60)
        {
            $string = "刚刚";
            return $string;
        }
        elseif($space < 3600) //一小时前
        {
            $string = floor($space / 60) . "分钟前";
            return $string;
        }
        $curtimeArray = getdate($curTime);
        $timeArray = getDate($timestamp);
        if($curtimeArray['year'] == $timeArray['year'])
        {
            if($curtimeArray['yday'] == $timeArray['yday'])
            {
                $format = "%H:%M";
                $string = strftime($format, $timestamp);
                return "今天 {$string}";
            }
            elseif(($curtimeArray['yday'] - 1) == $timeArray['yday'])
            {
                $format = "%H:%M";
                $string = strftime($format, $timestamp);
                return "昨天 {$string}";
            }
            else
            {
                $string = sprintf("%d月%d日 %02d:%02d", $timeArray['mon'], $timeArray['mday'], $timeArray['hours'], 
                $timeArray['minutes']);
                return $string;
            }
        }
        $string = sprintf("%d年%d月%d日 %02d:%02d", $timeArray['year'], $timeArray['mon'], $timeArray['mday'], 
        $timeArray['hours'], $timeArray['minutes']);
        return $string;
    }
}