<?php /* Smarty version 2.6.25, created on 2010-09-12 09:57:44
         compiled from admin/header.htm */ ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div id="top">
<div id="top_left">
<div id="top_right">
<div id="logo"><a href="<?php echo $this->_tpl_vars['base_url']; ?>
/index.php?case=index&act=index&=&admin_dir=admin" title="后台首页"><span>后台首页</span></a></div>
<div class="top">
<span class="floatright"><a href="<?php echo $this->_tpl_vars['base_url']; ?>
/" target="_blank">网站首页</a>	| <a href="http://www.cmseasy.org" target="_blank">论坛</a>	| <a href="http://www.cmseasy.org/forum-10-1.html" target="_blank">报错</a> | <a href="http://www.cmseasy.org/forum-9-1.html" target="_blank">在线教程</a></span>	
<span class="floatleft">欢迎您，<?php echo $this->_tpl_vars['username']; ?>
</span>	 <a href="logout.php" class="logout">退出</a>
<div id="nav">
<ul>
<li><a class=on href="index.php">管理首页</a> </li>
<?php if ($this->_tpl_vars['ifadmin'] == '1'): ?> 
<li><a class=no href="system.php?action=systeminfo" target="I2">系统管理</a></li>
<?php endif; ?>
<li><a class=no href="index.php?action=clearcache"><?php if ($this->_tpl_vars['clear_cache']): ?><?php echo $this->_tpl_vars['clear_cache']; ?>
<?php else: ?>更新缓存<?php endif; ?></a></li>
<li><a class=no href="<?php echo $this->_tpl_vars['gotocmseasy']; ?>
">客户留言</a></li>
<li><a class=no href="chatlist.php" target="I2">交谈记录</a></li>
<li><a class=no href="monitor.php" target="I2">接通客户</a></li>
<li><a class=no href="system.php?action=createcode" target="I2">生成代码</a></li>
<?php if ($this->_tpl_vars['ifadmin'] == '1'): ?> 
<li><a class=no href="../../admin" target="_self">网站后台</a></li>
<?php endif; ?>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>