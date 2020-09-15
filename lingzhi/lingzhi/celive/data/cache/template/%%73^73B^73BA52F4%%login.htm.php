<?php /* Smarty version 2.6.25, created on 2010-09-12 09:57:39
         compiled from admin/login.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $this->_tpl_vars['lang']['charset']; ?>
" />
<title><?php echo $this->_tpl_vars['conf']['company']; ?>
 企业在线客服管理平台 - Powered by CElive</title>
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div style="height:150px;clear:both;overflow:hidden;"></div>

<div id="login">

  <div class="copy">
    <div style="clear:both;height:15px;"></div>
    CElive是一套免安装客户端,支持JS调用,支持多用户,多部门,任务分配等,能够自动生成多元化调用代码的多语言在线客服系统.
  </div>  

  <div style="float:left;margin:42px 0px 0px 100px;color:#FFF;">
  <span class="tips"><?php echo $this->_tpl_vars['login_text']; ?>
</span>
    <form name="admin_login" id="admin_login" method="post" action="<?php echo $this->_tpl_vars['action']; ?>
">
    <input type="hidden" name="submit" value="提交">
     <p>帐&nbsp;&nbsp;&nbsp;&nbsp;号: <input name="username" type="text" id="username" value="" class="input" tabindex="1" /></p>
     <p>密&nbsp;&nbsp;&nbsp;&nbsp;码: <input name="password" type="password" id="password" value="<?php //echo $password;?>" tabindex="2" class="input" /></p>     
     <p><input type="submit" name="submit" value=" 登 陆 " class="button" tabindex="4" /></p>
     </form>                      
   </div>
   <div style="clear:both;">&nbsp;</div>
</div>

</body>
</html>