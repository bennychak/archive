<?php /* Smarty version 2.6.25, created on 2010-08-28 17:00:13
         compiled from admin/live.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7"> 
<title><?php echo $this->_tpl_vars['conf']['company']; ?>
 企业在线客服平台 - Powered by CElive</title>
</head>

<frameset rows="100,285,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="header.php?chatid=<?php echo $this->_tpl_vars['chatid']; ?>
" id="chat_top" name="chat_top" scrolling="no" noresize="noresize">
  <frame src="mainbox.php?chatid=<?php echo $this->_tpl_vars['chatid']; ?>
&name=<?php echo $this->_tpl_vars['name']; ?>
" id="chat_display" name="chat_display" scrolling="no">
  <frame src="send.php?chatid=<?php echo $this->_tpl_vars['chatid']; ?>
" id="chat_send" name="chat_send" scrolling="no" noresize="noresize">
</frameset>
<noframes><body></body></noframes>
</html>