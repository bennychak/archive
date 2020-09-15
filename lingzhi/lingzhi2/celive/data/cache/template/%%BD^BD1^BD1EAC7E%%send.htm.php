<?php /* Smarty version 2.6.25, created on 2010-08-28 17:00:15
         compiled from admin/live/send.htm */ ?>
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
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/ajaxfileupload.js"></script>
<title><?php echo $this->_tpl_vars['conf']['company']; ?>
 企业在线客服平台 - Powered by CElive</title>
<?php echo $this->_tpl_vars['xajax_live']; ?>

<?php echo $this->_tpl_vars['ctrlenter']; ?>

<?php echo ' 
<script type="text/javascript">
function putValue() {
	var now=new Date();
	parent.window.chat_display.document.getElementById(\'ChatHistory\').innerHTML+=\'<font color=green>\'+document.form1.name.value+\' \'+now.getHours()+\':\'+now.getMinutes()+\':\'+now.getSeconds()+\'</font><br />\'+document.form1.detail.value+\'<br />\';
	document.form1.detail.value="";
	document.form1.detail.focus();
}

function set_t_value(value)
{
	document.getElementById("detail").value=value;
	document.getElementById("detail").focus();
}

function ajaxFileUpload()
{
	$("#loading")
	.ajaxStart(function(){
		$(this).show();
	})
	.ajaxComplete(function(){
		$(this).hide();
	});

	$.ajaxFileUpload
	(
		{
			url:\'doajaxfileupload.php\',
			secureuri:false,
			fileElementId:\'fileToUpload\',
			dataType: \'json\',
			success: function (data, status)
			{
				if(typeof(data.error) != \'undefined\')
				{
					if(data.error != \'\')
					{
						alert(data.error);
					}else
					{						
						set_t_value(data.msg);
						xajax_AdminPostdata(xajax.getFormValues(form1));putValue();document.form1.detail.focus();
					}
				}
			},
			error: function (data, status, e)
			{
				alert(e);
			}
		}
	)
	
	return false;

}

</script>
'; ?>

</head>
<body onLoad="form1.detail.focus();">
<div style="margin-left:auto; margin-right:auto">
<div id="main">
<div style="padding:0px 10px; margin:0;">
<div class="foot">
<div class="foot_l">
<div class="foot_r">
<form id="form1" name="form1">
<input type="hidden" name="name" id="name" value="<?php echo $this->_tpl_vars['name']; ?>
" />
<input type="hidden" name="chatid" id="chatid" value="<?php echo $this->_tpl_vars['chatid']; ?>
" />
<div class="se">
<div class="f_r" id="__send_box_info">
<div style="padding:3px;">
<select name="hot_chat" onChange="set_t_value(this.value);">
  <option value="">常用语句</option>
  <option value="您好!请问有什么需要帮忙的吗?">您好!请问有什么需要帮忙的吗?</option>
  <option value="您好!请问贵姓?">您好!请问贵姓?</option>
  <option value="您好!这边有点忙,请您稍等!">您好!这边有点忙,请您稍等!</option>
  <option value="您的建议我们已经记录!">您的建议我们已经记录!</option>
  <option value="感谢您的咨询!">感谢您的咨询!</option>
</select>
<script language="javascript" type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/common1.js"></script>
</div>
</div>
<div class="ft_l">
<div class="ft_l_box">
<input type="button" class="send" value="" onClick="xajax_AdminPostdata(xajax.getFormValues(form1));putValue();document.form1.detail.focus();" />
<textarea id="detail" style="overflow-y:auto;" name="detail" class="s_box" onKeyUp="javascript:return ctrlEnter(event);"></textarea>

<div style="clear:both;">	 </div>
</div>



<a href="javascript:void(0)" onClick="JavaScript:document.getElementById('ts_file').style.display='block';" id="ts_img"><img style="margin:5px 0px 0px 10px;float:left;" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/skin/files.gif" /></a>
<div id="ts_file" style="display:none">
  <img id="loading" src="loading.gif" style="display:none;">
  <form name="upload_form" action="" method="POST" enctype="multipart/form-data">
  <input id="fileToUpload" type="file" size="30" name="fileToUpload" class="sinput">
  <button id="buttonUpload" onclick="return ajaxFileUpload();">传输</button>
  </form>
  </div>


 <div style="clear:both;">	 </div>
</div>

</div>
</div>
</div>
</div>

</div>

<div style="display:none"><div id="footer"><!--非商业用户,请勿删除和修改-->
<div class="copy">Copyright &copy; 2010 CmsEasy.CN, All rights reserved. <A href="http://www.cmseasy.cn" target=_blank>Powered&nbsp;by&nbsp;<STRONG><SPAN style="COLOR:#F93">CmsEasy</SPAN></STRONG></A></div>
</div></div>
</body>
</html>