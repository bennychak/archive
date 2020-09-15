<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="Comsenz Inc." name="Copyright" />
<title>首页</title>
<style>
	body{margin:0;background:#FFF url(bg.jpg) repeat-x;color:#666; font:12px "Lucida Grande", Verdana, Lucida, Helvetica, Arial, "宋体" ,sans-serif; }
	#wrap{ width:800px; margin-top:50px; margin-left:auto; margin-right:auto;}
	#menu{ width:800px; height:439px; background:url(logo.gif)}
		#menu ul{ list-style:none;margin:0px;padding:0;}
		#menu li{ float:left;}
		#menu a{ display:block; width:800px; height:439px; text-indent:-999px; overflow:hidden; outline:none;}
	#copyright{text-align:center; line-height:30px; height:30px; }
		#copyright a{ color:#004B96; text-decoration:none;}
</style>
<?php

if(!file_exists('./install/install.lock') && is_dir('./install')) {
	echo '<script>location.href="install/index.php";</script>';
}
if(file_exists('./bbs/forumdata/index.lock')) {
	echo '<script>location.href="bbs/index.php";</script>';
}
if(file_exists('./home/data/index.lock')) {
	echo '<script>location.href="home/index.php";</script>';
}
?>
</head>
<body scroll="no">
<div id="wrap">
	<div id="menu"><!--
    	<ul>
        	<li><a href="home" title="网络家园">网络家园</a></li>
            <li><a href="bbs" title="交流论坛">交流论坛</a></li>
        </ul>-->
        <a href="bbs"></a>
    </div>
    <div id="copyright">
    	&copy; 2010 <a href="#" title="Comsenz Inc." target="_blank">夏の帆</a>
    </div>
</div>
</body>
</html>
