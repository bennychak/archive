<?php /* Smarty version 2.6.25, created on 2010-08-28 17:02:01
         compiled from admin/chatlist.htm */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $this->_tpl_vars['lang']['charset']; ?>
" />
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/common.css" rel="stylesheet" type="text/css" />
<title>CElive</title>
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
</style>
'; ?>


<body>


<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/images/undo.gif" style="float:right;" /></a>当前位置：交谈列表
</div>
<div class="padding10">
<img src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/images/wj.gif" style="margin-right:10px;" />欢迎来到用户交谈列表页面。您可以查看客服与用户的交通记录。
</div>

<div class="blank10"></div>


<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
        <tr>
          <th align="center" width="20%"><!--userid-->状态提示</th>
          <th align="center" width="40%"><!--username-->选择客服</th>
          <th align="center" width="40%"><!--nickname-->选择客户</th>
        </tr>
</thead>
<tbody>

<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">


<td align="center">(<?php if (! $this->_tpl_vars['oname']): ?>客服<?php else: ?><?php echo $this->_tpl_vars['oname']; ?>
<?php endif; ?> 和 <?php if (! $this->_tpl_vars['name']): ?>访客<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>)</td>
<td align="center"><?php echo $this->_tpl_vars['namelist']; ?>
</td>
<td align="center"><?php echo $this->_tpl_vars['list']; ?>
</td>
</tr>


<tr>
            <td width="20%" bgcolor="#E2E7EF">
              <div align="center" style="font-weight:bold;">详细内容</div>
            </td>
            
            <td width="80%" bgcolor="#FFFFFF" colspan="2">
            <span style="font-size:12px; color:#06C"><?php echo $this->_tpl_vars['chat_info']; ?>
</span>
            <div align="left" style="margin-left:20px;"><span class="text1"><?php echo $this->_tpl_vars['chat_list']; ?>
</span></div></td>
            </tr> 

      </tbody>
    </table>


<div class="blank20"></div>

</body>
</html>