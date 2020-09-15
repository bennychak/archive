<?php /* Smarty version 2.6.25, created on 2010-08-28 17:00:15
         compiled from admin/live/mainbox.htm */ ?>
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
xajax_GetEndChat(\''; ?>
<?php echo $this->_tpl_vars['chatid']; ?>
<?php echo '\');
xajax_AdminChatHistory(\''; ?>
<?php echo $this->_tpl_vars['chatid']; ?>
<?php echo '\');
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
<ul>
<li>欢迎对CELive客服系统提出宝贵建议，请点击<a href="http://www.cmseasy.cn/index.php?case=guestbook&act=index" target="_blank" style="color:red;font-weight:bold;">留言</a>。 </li>
<li><strong>联系电话：</strong>0434-5226595</li>
<li><strong>传真号码：</strong>0434-5226595</li>
<li class="blank10"></li>
<li style="color:red;"><strong>服务QQ</strong></li>
<li><strong>购买咨询：</strong>871148347</li>
<li><strong>技术咨询：</strong>1121774038</li>
<li><strong>产品建议：</strong>576979762</li>
<li><strong>广告合作：</strong>592582493</li>
<li><strong>商务合作：</strong>625569327</li>
</ul>

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