<?php /* Smarty version 2.6.25, created on 2010-08-28 16:59:55
         compiled from admin/status.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/jquery.js"></script>
<title><?php echo $this->_tpl_vars['conf']['company']; ?>
 企业在线客服管理平台 - Powered by CElive</title>
<?php echo $this->_tpl_vars['xajax_live']; ?>

</head>

<?php echo '
<style type="text/css">
.box {
  float:left;  
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
  padding-left:20px;
  margin-left:20px;
  background: url('; ?>
<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/images/edt.gif<?php echo ') left center no-repeat;
  float:left;
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
.border td {
	border:1px #F8F8F8 solid;
	padding:3px;
}
.top_status {
	background:#41C3E3;
	width:100%;
	height:100%;
	padding-left:20px;
	padding-bottom:4px;
	padding-top:3px;
}
.text_tips {
	color:red;
	font-size:11px;
}
.response_box_t {
	width:98%;
	border:solid 1px #B5D6E6;
	background:#DEF2FF;
	margin-left:auto;
	margin-right:auto;
	height:20px;
	line-height:20px;
}
.response_box_t span { 
    font-size: 12px;
	padding-left:13px;
}

.response_t {
	width:98%;
	border:solid 1px #B5D6E6;
	margin-left:auto;
	margin-right:auto;
	font-size: 12px;
	height:20px;
	line-height:20px;
}
.response_t span{
	float:right;	
	padding-right:13px;
}
</style>
'; ?>


<body>
<div class="top_status">
<a href="javascript:" onClick="xajax_ChangeStatus();" class="text" style="color:#FFF">在线/隐身</a><span id="status" class="text_tips"></span>
<a href="javascript:" onClick="xajax_AdminSound();" class="text" style="color:#FFF">声音开/关</a><span id="sounds" class="text_tips"></span>
</div>
</body>
</html>