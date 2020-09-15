<?php
/**
 * cmseasy: comment_act.php
 * ============================================================================
 * 版权所有 2008-2009 cmseasy，并保留所有权利。
 * -------------------------------------------------------
 * 这不是一个自由软件！也不是一个开源软件！您不能在任何目的的前提下对程序代码进行破解、修改和使用；
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 *
 * @version:    v1.7.091010
 * ---------------------------------------------
 * $Id: comment_act.php Sat Dec 06 09:43:17 CST 2008
 */

if (!defined('ROOT')) exit('Can\'t Access !');

class attachment_act extends act {
    function init() {
        //会员
        $this->view->usergroupid=0;

        front::check_type(cookie::get('login_username'),'safe');
        front::check_type(cookie::get('login_password'),'safe');

        if(cookie::get('login_username') && cookie::get('login_password')) {
            $user=new user();
            $user=$user->getrow(array('username'=>cookie::get('login_username')));
            if(is_array($user) && cookie::get('login_password')==front::cookie_encode($user['password'])) {
                $this->view->user=$user;
                $this->view->usergroupid=$user['groupid'];

            }
        }
    }
	
	function getBrowser(){
		$sys = $_SERVER['HTTP_USER_AGENT'];
		if(stripos($sys, "NetCaptor") > 0){
			$exp = "NetCaptor";
		}elseif(stripos($sys, "Firefox/") > 0){
			preg_match("/Firefox\/([^;)]+)+/i", $sys, $b);
			$exp = "Mozilla Firefox ".$b[1];
		}elseif(stripos($sys, "MAXTHON") > 0){
			preg_match("/MAXTHON\s+([^;)]+)+/i", $sys, $b);
			preg_match("/MSIE\s+([^;)]+)+/i", $sys, $ie);
			$exp = $b[0]." (IE".$ie[1].")";
		}elseif(stripos($sys, "MSIE") > 0){
			preg_match("/MSIE\s+([^;)]+)+/i", $sys, $ie);
			$exp = "Internet Explorer ".$ie[1];
		}elseif(stripos($sys, "Netscape") > 0){
			$exp = "Netscape";
		}elseif(stripos($sys, "Opera") > 0){
			$exp = "Opera";
		}else{
			$exp = "未知浏览器";
		}
		return $exp;
	}


    function attachment_js_action() {
        front::check_type(front::get('aid'));

        $aid=front::get('aid');
        $name=archive_attachment($aid,'intro');
        $path=archive_attachment($aid,'path');
        if(!$name) $name=preg_replace('%(.*)[\\\\\/](.*)_\d+(\.[a-z]+)$%i','$2',$path);

		if(!rank::arcget($aid,$this->view->usergroupid,'down')){
			$link="<a id='att' href='javascript:alert(\"未取得授权,无法下载!\");'>". $name."</a>";
			echo tool::text_javascript($link);
			exit;
		}else{
			if(config::get('verifycode')){
				$link="<a id='att' href='".url::create('attachment/downfile/aid/'.$aid.'/v/ce')."'>". $name."</a>";
				echo tool::text_javascript($link);
				exit;			
			}else{
				$link="<a id='att' href='".url::create('attachment/down/aid/'.$aid)."'>". $name."</a>";
				echo tool::text_javascript($link);
				exit;				
			}			
		}		
        
    }
	
	function downfile_action(){
		 if(front::post('submit')) {
            //verify
            if(!session::get('verify') || front::post('verify')<>session::get('verify')) {
                front::flash('验证码错误！');
                return;
            }else{
				front::check_type(front::get('aid'));
	
				$aid=front::get('aid');
				$name=archive_attachment($aid,'intro');
				$path=archive_attachment($aid,'path');
				if(!$name) $name=preg_replace('%(.*)[\\\\\/](.*)_\d+(\.[a-z]+)$%i','$2',$path);
				if(!rank::arcget($aid,$this->view->usergroupid,'down'))
				$link="<a id='att' href='javascript:alert(\"未取得授权,无法下载!\");'>". $name."</a>";
				else $link="<a id='att' href='".url::create('attachment/down/aid/'.$aid)."'>". $name."</a>";
			
				echo $link;
				cookie::set('allowdown',md5(url::create('attachment/downfile/aid/'.$aid.'/v/ce')));
				exit;
			}
		 }
	}


    function down_action() {
		if(config::get('verifycode')){
			if(cookie::get('allowdown')!=md5(url::create('attachment/downfile/aid/'.front::get('aid').'/v/ce'))){
				header("Location: index.php?case=attachment&act=downfile&aid=".front::get('aid')."&v=ce");
			}
		}
        front::check_type(front::get('aid'));

        if(!rank::arcget(front::get('aid'),$this->view->usergroupid,'down')) {
            $link="<script>alert(\"未取得授权,无法下载!\");</script>";
            exit($link);
        }

        $path=ROOT.'/'.archive_attachment(front::get('aid'),'path');
        $path=iconv('utf-8', 'gbk//ignore', $path);

        if (!is_readable($path))  {
            header("HTTP/1.1 404 Not Found");
            exit;
        }

        $size=filesize($path);

        $content=file_get_contents($path);
        $size=strlen($content);		
        $name=preg_replace('%(.*)[\\\\\/](.*)_\d+(\.[a-z]+)$%i','$2$3',$path);
		$name=substr($name,-7,7);
		$name='CmsEasy_file_'.$name;

        header('Content-Type: application/octet-stream');
        header("Content-Length: $size");
		header("Content-Disposition: attachment; filename=\"$name\"");
        header("Content-Transfer-Encoding: binary");
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');

        echo  $content;

        exit;
    }


    function end() {
        if(front::$debug)
        $this->render('style/index.html');
        else
        $this->render();
    }

}