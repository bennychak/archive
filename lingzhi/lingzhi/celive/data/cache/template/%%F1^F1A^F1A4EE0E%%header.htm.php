<?php /* Smarty version 2.6.25, created on 2010-08-28 17:00:16
         compiled from header.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7"> 
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/celive.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/jquery.js"></script>
<title><?php echo $this->_tpl_vars['conf']['company']; ?>
 企业在线客服 - Powered by CElive</title>
<?php echo $this->_tpl_vars['xajax_live']; ?>

<?php echo $this->_tpl_vars['ifexit']; ?>

</head>
<body onbeforeunload="chat_unload();">
<div id="main">
<div style="padding:10px 10px 0px;">
<div class="header">
<div>
<h1><a href="http://www.cmseasy.cn"  target="_blank">CmsEasy&nbsp;企业在线客服平台&nbsp;V1.2.0</a></h1>
<a href="#" onClick="javascript:xajax_EndChat();" class="btn_close"><span>关闭</span></a>
<p class="info">您现在正与 <strong><?php echo $this->_tpl_vars['operatorname']; ?>
</strong> 沟通</p>
<p class="title">咨询内容</p>
</div>
</div>
</div>
</div>
</body>
</html>