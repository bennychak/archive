<?php /* Smarty version 2.6.25, created on 2010-09-12 10:11:44
         compiled from admin/system.htm */ ?>
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
/editor/jquery.wysiwyg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/editor/jquery-1.3.2.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/editor/jquery.wysiwyg.js"></script>
<?php echo ' 
<script type="text/javascript">
  $(function()
  {
      $(\'#companyinfos\').wysiwyg();
  });
</script>
'; ?>
 
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

.box1 ul li {
  height:30px;
  line-height:30px;
  padding-left:20px;
  margin-left:38px;
  background: url('; ?>
<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/images/edit2.gif<?php echo ') left center no-repeat;
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
/images/undo.gif" style="float:right;" /></a>当前位置：系统管理
</div>
<div class="padding10">
<img src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/images/wj.gif" style="margin-right:10px;" />欢迎来到系统管理页面。您可以对客服系统进行配置。
</div>

<div class="blank10"></div>


<div class="box" style="width:95%;">   

<div class="box1">
<!--<ul>
  <li><a href="system.php?action=systeminfo" target="I2">系统配置</a><?php echo $this->_tpl_vars['up_sys_success']; ?>
</li>
  <li><a href="system.php?action=companyinfos" target="I2">企业简介</a></li>
  <li><a href="system.php?action=departments" target="I2">部门管理</a></li>
  <li><a href="system.php?action=operators" target="I2">客服管理</a></li>
  <li><a href="system.php?action=assigns" target="I2">任务管理</a></li>
  <li><a href="system.php?action=createcode" target="I2">生成代码</a></li>
  </ul>-->
</div>

  <?php if ($this->_tpl_vars['ifadmin'] == '1'): ?>  
  <?php if ($this->_tpl_vars['companyinfos']): ?>
  <form action="system.php?action=companyinfos" method="post" name="companyinfos1">
   <div class="blank30"></div>        
   <textarea name="companyinfos" id="companyinfos" rows="10" cols="70"><?php echo $this->_tpl_vars['conf']['companyinfos']; ?>
</textarea>   
  <?php echo $this->_tpl_vars['c_up_sys_success']; ?>
<input type="hidden" name="_companyinfos" value="_companyinfos" /><input type="submit" name="submit" value="保存" />    
  </form>
   <?php endif; ?>
  <?php if ($this->_tpl_vars['system']): ?>
  <form action="system.php?action=systeminfo" method="post" name="systeminfo">
  <table cellspaing="0" cellpadding="3" class="border" cellpadding="4" class="list" name="table" id="table">
    <tr class="light">
      <td align="right" width="10%"><?php echo $this->_tpl_vars['lang']['url']; ?>
:</td>
      <td align="left" width="90%"><input type="text" name="url" value="<?php echo $this->_tpl_vars['conf']['url']; ?>
" size="30" /></td>
    </tr>

    <tr class="light">
      <td align="right"><?php echo $this->_tpl_vars['lang']['company_name']; ?>
:</td>
      <td align="left"><input type="text" name="company" value="<?php echo $this->_tpl_vars['conf']['company']; ?>
" size="20" /></td>
    </tr>
     <tr class="light">
      <td align="right"><?php echo $this->_tpl_vars['lang']['if_customer_info']; ?>
:</td>
      <td align="left">
      <select name="customer_info">           
          <option value="1" <?php if ($this->_tpl_vars['conf']['customer_info'] == true): ?>selected="selected"<?php endif; ?>>是</option>
          <option value="0" <?php if ($this->_tpl_vars['conf']['customer_info'] == false): ?>selected="selected"<?php endif; ?>>否</option> 
        </select>
      </td>
    </tr>
    <tr class="light">
      <td align="right"><?php echo $this->_tpl_vars['lang']['tracker_refresh']; ?>
:</td>
      <td align="left"><input type="text" name="tracker_refresh" value="<?php echo $this->_tpl_vars['conf']['tracker_refresh']; ?>
" size="20" /></td>
    </tr>
    <tr class="light">
      <td align="right"><?php echo $this->_tpl_vars['lang']['template']; ?>
:</td>
      <td align="left">
        <select name="template">
        <?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['template']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
          <option value="<?php echo $this->_tpl_vars['template'][$this->_sections['i']['index']]['dir']; ?>
"<?php if ($this->_tpl_vars['template'][$this->_sections['i']['index']]['dir'] == $this->_tpl_vars['template_dir']): ?> selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['template'][$this->_sections['i']['index']]['name']; ?>
</option>
        <?php endfor; endif; ?>
        </select>
      </td>
    </tr>
    <tr class="light">
      <td align="right"><?php echo $this->_tpl_vars['lang']['select_lang']; ?>
:</td>
      <td align="left">
        <select name="language">
        <?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['language']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
          <option value="<?php echo $this->_tpl_vars['language'][$this->_sections['i']['index']]['file']; ?>
"<?php if ($this->_tpl_vars['language'][$this->_sections['i']['index']]['file'] == $this->_tpl_vars['lang_file']): ?> selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['language'][$this->_sections['i']['index']]['name']; ?>
</option>
        <?php endfor; endif; ?>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="hidden" name="systeminfo" value="systeminfo" /><input type="submit" name="submit" value="<?php echo $this->_tpl_vars['lang']['submit']; ?>
" /></td>
    </tr>
  </table>
</form>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['departments']): ?>
         <form action="system.php?action=departments" method="post" name="departments">
  <table cellspaing="0" cellpadding="3" class="border" class="list" name="table" id="table">
    <tr class="light">
      <td align="right" width="10%">部门名称:</td>
      <td align="left" width="90%"><input type="text" name="name" size="20" /><input type="submit" name="add" value="添加" /><input type="hidden" name="do" value="add" /></td>
    </tr>

    <tr class="light">
      <td align="right"></td>
      <td align="left"></td>
    </tr>
    <tr>
      <td align="right" >部门名称</td>
      <td align="left" >操作</td>
    </tr>
     <?php echo $this->_tpl_vars['list']; ?>

  </table>
</form>
            <?php endif; ?>
       <?php if ($this->_tpl_vars['operators']): ?>
         <form action="system.php?action=operators" method="post" name="operators">
  <table cellspaing="0" cellpadding="1" class="border" class="list" name="table" id="table">
    <tr class="light">
      <td align="right" width="10%"><strong>客服添加</strong></td>
      <td align="left" width="90%"></td>
    </tr>

    <tr class="light">
      <td align="right"></td>
      <td align="left"></td>
    </tr>
    <tr class="light">
      <td align="right">用户</td>
      <td align="left"><input type="text" name="username" size="20" /></td>
    </tr>
    <tr class="light">
      <td align="right">密码</td>
      <td align="left"><input type="text" name="password" size="20" /></td>
    </tr>
    <tr class="light">
      <td align="right">姓名</td>
      <td align="left"><input type="text" name="realname" size="20" /></td>
    </tr>
    <tr class="light">
      <td align="right">类型</td>
      <td align="left"><select name="level">
        <option value="0">管理</option>
        <option value="1" selected="selected">客服</option>
      </select></td>
    </tr>
    <tr class="light">
      <td align="right"></td>
      <td align="left"><input type="submit" name="add" value="添加" /><input type="hidden" name="do" value="add" /></td>
    </tr>
    <tr class="light">
      <td align="right"></td>
      <td align="left"></td>
    </tr>
    <tr>
      <td align="right" >客服信息</td>
      <td align="left" >操作<?php echo $this->_tpl_vars['isadmin']; ?>
</td>
    </tr>
     <?php echo $this->_tpl_vars['list']; ?>

  </table>
</form>
            <?php endif; ?>
      <?php if ($this->_tpl_vars['assigns']): ?>
         
  <table cellspaing="0" cellpadding="3" class="border" class="list" name="table" id="table">
    <tr class="light">
      <td align="right" width="10%"><strong>任务分配</strong></td>
      <td align="left" width="10%">&nbsp;</td>
      <td align="left" width="80%"></td>
    </tr>

    <tr class="light">
      <td align="right"></td>
      <td align="right"></td>
      <td align="left"></td>
    </tr>   
     <?php echo $this->_tpl_vars['list']; ?>

  </table>

            <?php endif; ?>
      <?php if ($this->_tpl_vars['createcode']): ?>
 <form action="system.php?action=createcode" method="post" name="createcode">        
  <table cellspaing="0" cellpadding="3" class="border" class="list" name="table" id="table">
    <tr class="light">
      <td align="right"  ><strong>选择部门</strong></td>
      <td align="left"  >
      <select name="departmentid">
        <option value="0"><?php echo $this->_tpl_vars['lang']['all_departments']; ?>
</option>
        <?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['cel_departments']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
        <option value="<?php echo $this->_tpl_vars['cel_departments'][$this->_sections['i']['index']]['id']; ?>
"<?php if ($this->_tpl_vars['departmentid'] == $this->_tpl_vars['cel_departments'][$this->_sections['i']['index']]['id']): ?> selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['cel_departments'][$this->_sections['i']['index']]['name']; ?>
</option>
        <?php endfor; endif; ?>
      </select>
      <select name="ifimages">
        <option value="0"><?php echo $this->_tpl_vars['lang']['createcode_mode']; ?>
</option>
        <option value="images" <?php if ($this->_tpl_vars['mode'] == 'images'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['createcode_mode_images']; ?>
</option>
        <option value="text" <?php if ($this->_tpl_vars['mode'] == 'text'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['createcode_mode_text']; ?>
</option>
      </select>
      QQ客服号码:<input type="text" name="qq" value="" size="30" />(示例:123456,100086)
      </td>
    </tr>
    <tr class="light">
      <td align="right"></td>
      <td align="left"><input type="submit" name="submit" value="<?php echo $this->_tpl_vars['lang']['generate_code']; ?>
"></td>
    </tr> 
    <tr class="light">
      <td align="right"></td>
      <td align="left"> 
      <?php if ($this->_tpl_vars['departmentid'] !== ''): ?>

<textarea name="all" cols="50" rows="5" id="all">
<!-- BEGIN CmsEasy Live Code, Copyright (c) 2009 CmsEasy.cn. All Rights Reserved -->
<script type="text/javascript" language="javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/include.php?cmseasylive<?php if ($this->_tpl_vars['mode'] == 'text'): ?>&text<?php endif; ?><?php if ($this->_tpl_vars['departmentid'] !== '0'): ?>&departmentid=<?php echo $this->_tpl_vars['departmentid']; ?>
<?php endif; ?><?php if ($this->_tpl_vars['qq'] !== ''): ?>&qq=<?php echo $this->_tpl_vars['qq']; ?>
<?php endif; ?>"></script>
<!-- END CmsEasy Live Code, Copyright (c) 2009 CmsEasy.cn. All Rights Reserved -->
</textarea>

<?php endif; ?>
</td>
    </tr>
    
    <tr class="light">
      <td align="right">[所有部门]图片模式</td>
      <td align="left"><a href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/imageModeDemo.html" target="_blank">查看演示</a></td>
    </tr> 
    <tr class="light">
      <td align="right">[所有部门]文字模式</td>
      <td align="left">
      <!-- BEGIN CmsEasy Live Code, Copyright (c) 2009 CmsEasy.cn. All Rights Reserved -->
<script type="text/javascript" language="javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/include.php?cmseasylive&text"></script>
<!-- END CmsEasy Live Code, Copyright (c) 2009 CmsEasy.cn. All Rights Reserved -->

</td>
    </tr>   

   <tr class="light">
      <td align="right"></td>
      <td align="left"></td>
    </tr>
    
  </table>
  </form>
  <?php endif; ?>
<?php endif; ?>
</div>
</body>
</html>