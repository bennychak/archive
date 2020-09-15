<?php /* Smarty version 2.6.25, created on 2010-09-12 09:57:47
         compiled from admin/left.htm */ ?>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $this->_tpl_vars['lang']['charset']; ?>
" />
<link href="<?php echo $this->_tpl_vars['conf']['url']; ?>
/templates/<?php echo $this->_tpl_vars['conf']['template']; ?>
/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['conf']['url']; ?>
/js/system.js"></script>

<div id="menu" class="sdmenu">
<div class="collapsed">
<span>客服中心</span>
<a href="monitor.php" target="I2">接通客户</a><a href="chatlist.php" target="I2">交谈记录</a><a href="<?php echo $this->_tpl_vars['gotocmseasy']; ?>
" target="I2">客户留言</a></div>
<?php if ($this->_tpl_vars['ifadmin'] == '1'): ?>
<div class="collapsed">
<span>系统管理</span>
<a href="system.php?action=systeminfo" target="I2">系统配置</a><a href="system.php?action=departments" target="I2">部门管理</a><a href="system.php?action=operators" target="I2">客服管理</a><a href="system.php?action=assigns" target="I2">任务管理</a></div>
<?php endif; ?>
<div class="collapsed">
<span>个人管理</span>
<a href="details.php" target="I2">资料修改</a></div>
</div>