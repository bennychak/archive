<?php /* Smarty version 2.6.25, created on 2010-08-28 17:00:18
         compiled from mainbox.htm */ ?>
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
 企业在线客服平台 - Powered by CElive</title>
<?php echo $this->_tpl_vars['xajax_live']; ?>

<?php echo ' 
<script type="text/javascript">
var CEl = function()
{
xajax_GetAdminEndChat(\''; ?>
<?php echo $this->_tpl_vars['chatid']; ?>
<?php echo '\');
xajax_ChatHistory();
setTimeout(CEl, '; ?>
<?php echo $this->_tpl_vars['conf']['tracker_refresh']; ?>
<?php echo ');
}
CEl();
function scolldown() 
{ 
var e=document.getElementById("ChatHistory");
e.scrollTop=e.scrollHeight; 
}
</script>
'; ?>

</head>
<body>
<div id="main">
<div style="padding:0px 10px; height:280px">
<div class="c">
<div class="c_l pa10">
<div id="right">
<p>欢迎对我们提出宝贵建议，请点击<a href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/../index.php?case=guestbook&act=index" target="_blank" style="color:red;font-weight:bold;">留言</a>，留下您的建议。 </p>
<p class="blank10"></p>
<?php echo $this->_tpl_vars['conf']['companyinfos']; ?>

<div style="clear:both;"></div>
</div>
<div class="f_l">
<div id="middle">
<div style="padding:10px;margin-right:212px;">
<div id="ChatHistory"></div>
</div>
</div>
</div>
<div style="clear:both;"></div>
</div>
<div style="clear:both;"></div>
</div>
</div>
</div>
</body>
</html>