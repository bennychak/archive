<?php
/**
* CmsEasy Live http://www.cmseasy.cn 				  			 
* by CmsEasy Live Team 							  						
**
* Software Version: CmsEasy Live v 1.2.0 					  				  
* Software by: Aiens, UTA (http://www.aiens.cn) 		      
* Copyright 2009 by: CmsEasy, (http://www.cmseasy.cn) 	  
* Support, News, Updates at: http://www.cmseasy.cn 			  			  
**
* This program is not free software; you can't may redistribute it and modify it under	  
**
* This file contains configuration settings that need to altered                  
* in order for CE Live to work, and other settings that            
**/

include('../include/config.inc.php');
include_once(CE_ROOT.'/include/celive.class.php');
$ac=addslashes($_GET['action']);
if($ac=='1'){	  

  $live = new celive();
  $live->template();
  $live->xajax_live();
  
  $result=$db->query("SELECT COUNT(*) FROM `activity` WHERE `status`='2'");
  $status=$result[0]['COUNT(*)'];

  
   if($status == 0){
	  $GLOBALS['template']->assign('offline','您好!客服不在线,您可以留言!');
	  $GLOBALS['template']->assign('status',$status);
	  $GLOBALS['template']->assign('gotocmseasy','<a href="../../index.php?case=guestbook&act=index">马上去留言!</a>');
   }else{
	   if(isset($_GET['departmentid'])){		   
		   $departmentid=addslashes($_GET['departmentid']);	 
	  }else{
		   $sql = "SELECT `departmentid` FROM `".$config['prefix']."assigns` WHERE 1";
		   @$result = $GLOBALS['db']->my_fetch_array($sql);
		   $tatolr=count($result)-1;
		   $randomr=rand(0,$tatolr);
		   $departmentid = $result[$randomr]['departmentid']; 
	  }
	  $timestamp=time();
	  $name=addslashes($_POST['name']);
	  $email=addslashes($_POST['email']);
	  $phone=addslashes($_POST['phone']);
	  $name=(!empty($name)) ? $name : 'Guest';
	  $email=(!empty($email)) ? $email : '-';
	  $phone=(!empty($phone)) ? $phone : '0';
	  $ip=$_SERVER["REMOTE_ADDR"];
	  $ip=iconv('gb2312',$GLOBALS['lang']['charset'],$ip);
	  if(empty($departmentid)) $departmentid=0;
	  if($_SESSION['thislivetmp']==$_GET['thislive']){
		  $db->query("INSERT INTO `sessions` (`id` ,`name` ,`email` ,`phone` ,`departmentid` ,`timestamp` ,`ip` ,`status` ) VALUES (NULL , '".$name."', '".$email."', '".$phone."', '".$departmentid."', '".$timestamp."', '".$ip."', '0');");
		  $sessionid = mysql_insert_id();
		  $_SESSION['departmentid'] = $departmentid;
		  $_SESSION['sessionid'] = $sessionid;
		  $_SESSION['timestamp'] = $timestamp;
		  $_SESSION['name'] = $name;
	  }
	  $_SESSION['thislivetmp']=md5(time());
	  $GLOBALS['template']->assign('online','您好!请稍等片刻,客服马上开启对话窗口!');
	  $GLOBALS['template']->assign('xajax_live',$xajax_live->getJavascript(''));
   }
  
   $GLOBALS['template']->display('request.htm');


 
}elseif($ac=='0'){
	
	global $inc;
	$inc = new celive();
	$inc->template();
   
	$GLOBALS['template']->assign('action','?action=1&module=celive&thislive='.$_SESSION['thislive'].'&departmentid='.addslashes($_GET['departmentid']));
	$GLOBALS['template']->display('collect.htm');
	   
	$inc->finished();
	
}elseif($ac=='2'){
	
	global $clive;
	$clive = new celive();
	$clive->template();  
			
	$sessionid = $_SESSION['sessionid'];
	$timestamp = $_SESSION['timestamp'];

	$sql = "SELECT `id`,`operatorid` FROM `chat` WHERE `sessionid`='".$sessionid."' AND `timestamp`='".$timestamp."'";
	@$result = $db->query($sql);

	$chatid = $result[0]['id'];
	$_SESSION['chatid'] = $chatid;

	$operatorid = $result[0]['operatorid'];
	$sql = "SELECT `username` FROM `operators` WHERE `id`='".$operatorid."'";
	@$result = $db->query($sql);
	$operatorname = $result[0]['username'];
	$_SESSION['operatorname'] = $operatorname;
	$GLOBALS['template']->assign('','');
	$GLOBALS['template']->display('live.htm');
	  
}
?>