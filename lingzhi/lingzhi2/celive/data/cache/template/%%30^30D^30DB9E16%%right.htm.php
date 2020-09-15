<?php /* Smarty version 2.6.25, created on 2010-09-12 09:57:46
         compiled from admin/right.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $this->_tpl_vars['lang']['charset']; ?>
" />
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/system.js"></script>
<title>CElive</title>
</head>

<body>

<?php echo '
<style type="text/css">
.box {
  float:left;
  width:40%;
  margin:5px 10px;
  font-size:12px;
}

body {background:#F7F8FD url(_bg.gif) left top;}

.box ul {
  margin-top:0px;
}

.box ul li {
  height:24px;
  line-height:24px;
  padding-left:40px;
  background: url(../skin/admin/icon3.gif) left top no-repeat;
}

.box h3,#center .box h3 a {
  line-height:14px;
  font-size:14px;
  padding-left:25px;
  background:url(rank_2.gif) left 10px no-repeat;
}
.box h3 {
	height:32px;overflow:hidden;
 line-height:32px;}
.box h4 {
  font-size:12px;
  color:#ccc;
  
}
</style>
'; ?>

<div id="info">
</div>
<div class="blank10"></div>


<!--请勿删除和修改,确保能够正常运作和获取重要信息-->
<div class="box">
<h3>系统信息</h3> 
<ul>
<li>PHP版本: <?php echo $this->_tpl_vars['phpv']; ?>
</li>
<li>ZEND版本: <?php echo $this->_tpl_vars['zendv']; ?>
</li>
<li>操作系统: <?php echo $this->_tpl_vars['sysos']; ?>
 / <?php echo $this->_tpl_vars['sysip']; ?>
</li>
<li>服务器信息: <?php echo $this->_tpl_vars['sysinf']; ?>
</li>
<li>开发团队: CmsEasy Team</li>
<li>程序版本: CmsEasy Live <span id="__version"><?php echo $this->_tpl_vars['version']; ?>
</span> <a href="http://www.cmseasy.cn/help/checkver.php?ver=<?php echo $this->_tpl_vars['version']; ?>
&type=celive" target="_blank"><span style="color:red; font-weight:bold">(检查更新)</span></a></li>
<li>程序信息: <span id="__domain"><?php echo $_SERVER['HTTP_HOST'];?></span> <span id="__buy"></span></li>
<li>版权所有: <?php echo $this->_tpl_vars['poweredby']; ?>
</li>
</ul>
<div class="blank10"></div>
</div>

<div class="box">
<h3>官方信息</h3> 
<ul id="officialinf">
</ul>
<div class="blank10"></div>
</div>
<!--请勿删除和修改,确保能够正常运作和获取重要信息-->

<div class="blank10"></div>

</body>
</html>