<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/network|template/default/header|template/default/footer', '1283180478', 'template/default/network');?><?php $_TPL['nosidebar']=1; ?>
<?php if(empty($_SGLOBAL['inajax'])) { ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?=$_SC['charset']?>" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title><?php if($_TPL['titles']) { ?><?php if(is_array($_TPL['titles'])) { foreach($_TPL['titles'] as $value) { ?><?php if($value) { ?><?=$value?> - <?php } ?><?php } } ?><?php } ?><?php if($_SN[$space['uid']]) { ?><?=$_SN[$space['uid']]?> - <?php } ?><?=$_SCONFIG['sitename']?> - Powered by UCenter Home</title>
<script language="javascript" type="text/javascript" src="source/script_cookie.js"></script>
<script language="javascript" type="text/javascript" src="source/script_common.js"></script>
<script language="javascript" type="text/javascript" src="source/script_menu.js"></script>
<script language="javascript" type="text/javascript" src="source/script_ajax.js"></script>
<script language="javascript" type="text/javascript" src="source/script_face.js"></script>
<script language="javascript" type="text/javascript" src="source/script_manage.js"></script>
<style type="text/css">
@import url(template/default/style.css);
<?php if($_TPL['css']) { ?>
@import url(template/default/<?=$_TPL['css']?>.css);
<?php } ?>
<?php if(!empty($_SGLOBAL['space_theme'])) { ?>
@import url(theme/<?=$_SGLOBAL['space_theme']?>/style.css);
<?php } elseif($_SCONFIG['template'] != 'default') { ?>
@import url(template/<?=$_SCONFIG['template']?>/style.css);
<?php } ?>
<?php if(!empty($_SGLOBAL['space_css'])) { ?>
<?=$_SGLOBAL['space_css']?>
<?php } ?>
</style>
<link rel="shortcut icon" href="image/favicon.ico" />
<link rel="edituri" type="application/rsd+xml" title="rsd" href="xmlrpc.php?rsd=<?=$space['uid']?>" />
</head>
<body>

<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="header">
<?php if($_SGLOBAL['ad']['header']) { ?><div id="ad_header"><?php adshow('header'); ?></div><?php } ?>
<div class="headerwarp">
<h1 class="logo"><a href="index.php"><img src="template/<?=$_SCONFIG['template']?>/image/logo.gif" alt="<?=$_SCONFIG['sitename']?>" /></a></h1>
<ul class="menu">
<?php if($_SGLOBAL['supe_uid']) { ?>
<li><a href="space.php?do=home">��ҳ</a></li>
<li><a href="space.php">������ҳ</a></li>
<li><a href="space.php?do=friend">����</a></li>
<li><a href="network.php">��㿴��</a></li>
<?php } else { ?>
<li><a href="index.php">��ҳ</a></li>
<?php } ?>

<?php if($_SGLOBAL['appmenu']) { ?>
<?php if($_SGLOBAL['appmenus']) { ?>
<li class="dropmenu" id="ucappmenu" onclick="showMenu(this.id)">
<a href="javascript:;">վ�ڵ���</a>
</li>
<?php } else { ?>
<li><a target="_blank" href="<?=$_SGLOBAL['appmenu']['url']?>" title="<?=$_SGLOBAL['appmenu']['name']?>"><?=$_SGLOBAL['appmenu']['name']?></a></li>
<?php } ?>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
<li><a href="space.php?do=pm<?php if(!empty($_SGLOBAL['member']['newpm'])) { ?>&filter=newpm<?php } ?>">��Ϣ<?php if(!empty($_SGLOBAL['member']['newpm'])) { ?>(��)<?php } ?></a></li>
<?php if($_SGLOBAL['member']['allnotenum']) { ?><li class="notify" id="membernotemenu" onmouseover="showMenu(this.id)"><a href="space.php?do=notice"><?=$_SGLOBAL['member']['allnotenum']?>������</a></li><?php } ?>
<?php } else { ?>
<li><a href="help.php">����</a></li>
<?php } ?>
</ul>

<div class="nav_account">
<?php if($_SGLOBAL['supe_uid']) { ?>
<a href="space.php?uid=<?=$_SGLOBAL['supe_uid']?>" class="login_thumb"><?php echo avatar($_SGLOBAL[supe_uid]); ?></a>
<a href="space.php?uid=<?=$_SGLOBAL['supe_uid']?>" class="loginName"><?=$_SN[$_SGLOBAL['supe_uid']]?></a>
<?php if($_SGLOBAL['member']['credit']) { ?>
<a href="cp.php?ac=credit" style="font-size:11px;padding:0 0 0 5px;"><img src="image/credit.gif"><?=$_SGLOBAL['member']['credit']?></a>
<?php } ?>
<br />
<?php if(empty($_SCONFIG['closeinvite'])) { ?>
<a href="cp.php?ac=invite">����</a> 
<?php } ?>
<a href="cp.php?ac=task">����</a> 
<a href="cp.php?ac=magic">����</a>
<a href="cp.php">����</a> 
<a href="cp.php?ac=common&op=logout&uhash=<?=$_SGLOBAL['uhash']?>">�˳�</a>
<?php } else { ?>
<a href="do.php?ac=<?=$_SCONFIG['register_action']?>" class="login_thumb"><?php echo avatar($_SGLOBAL[supe_uid]); ?></a>
��ӭ��<br>
<a href="do.php?ac=<?=$_SCONFIG['login_action']?>">��¼</a> | 
<a href="do.php?ac=<?=$_SCONFIG['register_action']?>">ע��</a>
<?php } ?>
</div>
</div>
</div>

<div id="wrap">

<?php if(empty($_TPL['nosidebar'])) { ?>
<div id="main">
<div id="app_sidebar">
<?php if($_SGLOBAL['supe_uid']) { ?>
<ul class="app_list" id="default_userapp">
<li><img src="image/app/doing.gif"><a href="space.php?do=doing">��¼</a></li>
<li><img src="image/app/album.gif"><a href="space.php?do=album">���</a><em><a href="cp.php?ac=upload" class="gray">�ϴ�</a></em></li>
<li><img src="image/app/blog.gif"><a href="space.php?do=blog">��־</a><em><a href="cp.php?ac=blog" class="gray">����</a></em></li>
<li><img src="image/app/poll.gif"/><a href="space.php?do=poll">ͶƱ</a><em><a href="cp.php?ac=poll" class="gray">����</a></em></li>
<li><img src="image/app/mtag.gif"><a href="space.php?do=mtag">Ⱥ��</a><em><a href="cp.php?ac=thread" class="gray">����</a></em></li>
<li><img src="image/app/event.gif"/><a href="space.php?do=event">�</a><em><a href="cp.php?ac=event" class="gray">����</a></em></li>
<li><img src="image/app/share.gif"><a href="space.php?do=share">����</a></li>
<li><img src="image/app/topic.gif"><a href="space.php?do=topic">����</a></li>
</ul>

<ul class="app_list topline" id="my_defaultapp">
<?php if($_SCONFIG['my_status']) { ?>
<?php if(is_array($_SGLOBAL['userapp'])) { foreach($_SGLOBAL['userapp'] as $value) { ?>
<li><img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><a href="userapp.php?id=<?=$value['appid']?>"><?=$value['appname']?></a></li>
<?php } } ?>
<?php } ?>
</ul>

<?php if($_SCONFIG['my_status']) { ?>
<ul class="app_list topline" id="my_userapp">
<?php if(is_array($_SGLOBAL['my_menu'])) { foreach($_SGLOBAL['my_menu'] as $value) { ?>
<li id="userapp_li_<?=$value['appid']?>"><img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><a href="userapp.php?id=<?=$value['appid']?>" title="<?=$value['appname']?>"><?=$value['appname']?></a></li>
<?php } } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['my_menu_more']) { ?>
<p class="app_more"><a href="javascript:;" id="a_app_more" onclick="userapp_open();" class="off">չ��</a></p>
<?php } ?>

<?php if($_SCONFIG['my_status']) { ?>
<div class="app_m">
<ul>
<li><img src="image/app_add.gif"><a href="cp.php?ac=userapp&my_suffix=%2Fapp%2Flist" class="addApp">���Ӧ��</a></li>
<li><img src="image/app_set.gif"><a href="cp.php?ac=userapp&op=menu" class="myApp">����Ӧ��</a></li>
</ul>
</div>
<?php } ?>

<?php } else { ?>
<div class="bar_text">
<form id="loginform" name="loginform" action="do.php?ac=<?=$_SCONFIG['login_action']?>&ref" method="post">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<p class="title">��¼վ��</p>
<p>�û���</p>
<p><input type="text" name="username" id="username" class="t_input" size="15" value="" /></p>
<p>����</p>
<p><input type="password" name="password" id="password" class="t_input" size="15" value="" /></p>
<p><input type="checkbox" id="cookietime" name="cookietime" value="315360000" checked /><label for="cookietime">��ס��</label></p>
<p>
<input type="submit" id="loginsubmit" name="loginsubmit" value="��¼" class="submit" />
<input type="button" name="regbutton" value="ע��" class="button" onclick="urlto('do.php?ac=<?=$_SCONFIG['register_action']?>');">
</p>
</form>
</div>
<?php } ?>
</div>

<div id="mainarea">

<?php if($_SGLOBAL['ad']['contenttop']) { ?><div id="ad_contenttop"><?php adshow('contenttop'); ?></div><?php } ?>
<?php } ?>

<?php } ?>

<div id="network">

<script>
function setintro(type) {
var intro = '';
var bPosition = '';
if(type == 'doing') {
intro = '��һ�仰��¼�Լ������еĵ��ε�';
bPosition = '0';
} else if(type == 'mtag') {
intro = '�����Լ���СȦ�ӣ����ҽ�������Ȥ�Ļ���';
bPosition = '175px';
} else if(type == 'pic') {
intro = '�ϴ���Ƭ�����������еľ���˲��';
bPosition = '55px';
} else if(type == 'app') {
intro = '�����һ����ת��Ϸ����Ϸ�����Ӻ��Ѹ���';
bPosition = '118px';
} else {
intro = '����ע�ᣬ����ѷ�����־����Ƭ��һ����ת��Ϸ';
bPosition = '0';
}
$('guest_intro').innerHTML = intro + '......';
$('guest_intro').style.backgroundPosition = bPosition + ' 100%'
}
function scrollPic(e, LN, Width, Price, Speed) {
id = e.id;
if(LN == 'Last'){ scrollNum = Width; } else if(LN == 'Next'){ scrollNum = 0 - Width; }
scrollStart = parseInt(e.style.marginLeft, 10);
scrollEnd = parseInt(e.style.marginLeft, 10) + scrollNum;

MaxIndex = (e.getElementsByTagName('li').length / Price).toFixed(0);
sPicMaxScroll = 0 - Width * MaxIndex;

if(scrollStart == 0 && scrollEnd == Width){
scrollEnd = -1806;
e.style.marginLeft = parseInt(e.style.marginLeft, 10) - Speed + 'px';
} else if(scrollStart == sPicMaxScroll + Width && scrollEnd == sPicMaxScroll){
scrollEnd = 0;
e.style.marginLeft = parseInt(e.style.marginLeft, 10) + Speed + 'px';
}
scrollShowPic = setInterval(scrollShow, 1);

function scrollShow() {
if(scrollStart > scrollEnd) {
if(parseInt(e.style.marginLeft, 10) > scrollEnd) {
$(id + '_last').onclick = function(){ return false; };
$(id + '_next').onclick = function(){ return false; };
e.style.marginLeft = parseInt(e.style.marginLeft, 10) - Speed + 'px';
} else {
clearInterval(scrollShowPic);
$(id + '_last').onclick = function(){ scrollPic(e, 'Last', Width, Price, Speed);return false; };
$(id + '_next').onclick = function(){ scrollPic(e, 'Next', Width, Price, Speed);return false; };
}
} else {
if(parseInt(e.style.marginLeft, 10) < scrollEnd) {
$(id + '_last').onclick = function(){ return false; };
$(id + '_next').onclick = function(){ return false; };
e.style.marginLeft = parseInt(e.style.marginLeft, 10) + Speed + 'px';
} else {
clearInterval(scrollShowPic);
$(id + '_last').onclick = function(){ scrollPic(e, 'Last', Width, Price, Speed);return false; };
$(id + '_next').onclick = function(){ scrollPic(e, 'Next', Width, Price, Speed);return false; };
}					
}
}
}
function scrollShowNav(e, Width, Price, Speed) {
id = e.id;
$(id + '_last').onclick = function(){ scrollPic(e, 'Last', Width, Price, Speed);return false; };
$(id + '_next').onclick = function(){ scrollPic(e, 'Next', Width, Price, Speed);return false; };

}
function getUserTip(obj) {
var tipBox = $('usertip_box');
tipBox.childNodes[0].innerHTML = '<strong>' + obj.rel + ':<\/strong> ' + obj.rev + '...';

var showLeft;
if(obj.parentNode.offsetLeft > 730) {
showLeft = $('showuser').offsetLeft + obj.parentNode.offsetLeft - 148;
tipBox.childNodes[0].style.right = 0;
} else {
tipBox.childNodes[0].style.right = 'auto';
showLeft = $('showuser').offsetLeft + obj.parentNode.offsetLeft;
}
tipBox.style.left = showLeft + 'px';

var showTop; 
if(obj.className == 'uonline') {
showTop = $('showuser').offsetTop + obj.parentNode.offsetTop - tipBox.childNodes[0].clientHeight;
} else {
showTop = $('showuser').offsetTop + obj.parentNode.offsetTop + 48;
}
tipBox.style.top = showTop + 'px';

tipBox.style.visibility = 'visible';
}
</script>

<?php if(empty($_SGLOBAL['supe_uid'])) { ?>
<div id="guestbar" class="nbox">
<div class="nbox_c">
<p id="guest_intro">����ע�ᣬ����ѷ�����־����Ƭ��һ����ת��Ϸ......</p>
<a href="do.php?ac=<?=$_SCONFIG['register_action']?>" id="regbutton" onmouseover="setintro('register');">����ע��</a>
<p id="guest_app">
<a href="javascript:;" class="appdoing" onmouseover="setintro('doing');">��¼</a>
<a href="javascript:;" class="appphotos" onmouseover="setintro('pic');">��Ƭ</a>
<a href="javascript:;" class="appgames" onmouseover="setintro('app');">��Ϸ</a>
<a href="javascript:;" class="appgroups" onmouseover="setintro('mtag');">Ⱥ��</a> 
</p>
</div>	
<div class="nbox_s side_rbox" id="nlogin_box">
<h3 class="ntitle">���¼</h3>
<div class="side_rbox_c">
<form name="loginform" action="do.php?ac=<?=$_SCONFIG['login_action']?>&<?=$url_plus?>&ref" method="post">
<p><label for="username">�û���</label> <input type="text" name="username" id="username" class="t_input" value="<?=$membername?>" /></p>
<p><label for="password">�ܡ���</label> <input type="password" name="password" id="password" class="t_input" value="<?=$password?>" /></p>
<p class="checkrow"><input type="checkbox" id="cookietime" name="cookietime" value="315360000" <?=$cookiecheck?> style="margin-bottom: -2px;" /><label for="cookietime">�´��Զ���¼</label></p>
<p class="submitrow">
<input type="hidden" name="refer" value="space.php?do=home" />
<input type="submit" id="loginsubmit" name="loginsubmit" value="��¼" class="submit" />
<a href="do.php?ac=lostpasswd">��������?</a>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</p>
</form>
</div>
</div>
</div>
<?php } ?>

<div class="nbox">
<div class="nbox_c">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=blog&view=all">������־</a></span> ��־ &raquo;</h2>
<ul class="bloglist">
<?php if(is_array($bloglist)) { foreach($bloglist as $key => $value) { ?>
<li <?php if($key%2==1) { ?>class="list_r"<?php } ?>>
<h3><a href="space.php?uid=<?=$value['uid']?>&do=blog&id=<?=$value['blogid']?>" target="_blank"><?=$value['subject']?></a></h3>
<div class="d_avatar avatar48"><a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>" target="_blank"><?php echo avatar($value[uid],small); ?></a></div>
<p class="message"><?=$value['message']?> ...</p>
<p class="nhot"><a href="space.php?uid=<?=$value['uid']?>&do=blog&id=<?=$value['blogid']?>"><?=$value['hot']?> ���Ƽ�</a></p>
<p class="gray"><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a> ������ <?php echo sgmdate('m-d H:i',$value[dateline],1); ?></p>
</li>
<?php } } ?>
</ul>
</div>
<div class="nbox_s side_rbox side_rbox_w">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=doing&view=all">�����¼</a></span> ��¼ &raquo;</h2>
<div class="side_rbox_c">
<ul class="side_rbox_c doinglist">
<?php if(is_array($dolist)) { foreach($dolist as $value) { ?>
<li>
<p>
<a href="space.php?uid=<?=$value['uid']?>&do=doing&doid=<?=$value['doid']?>" target="_blank" class="gray r_option dot" style="margin:0;background-position-y: 0;"><?php echo sgmdate('H:i',$value[dateline],1); ?></a>
<a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>" class="s_avatar"><?php echo avatar($value[uid],small); ?></a>
<a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a>
</p>
<p class="message" title="<?=$value['title']?>"><?=$value['message']?></p>
</li>
<?php } } ?>
</ul>
</div>
</div>
</div>



<div class="nbox" id="photolist">
<h2 class="ntitle">
<a href="space.php?do=album&view=all" class="r_option">����ͼƬ</a>
ͼƬ &raquo;
</h2>
<div id="p_control">
<a href="javascript:;" id="spics_last">��һҳ</a>
<a href="javascript:;" id="spics_next">��һҳ</a>
<ul id="p_control_pages">
<li>��һҳ</li>
<li>�ڶ�ҳ</li>
<li>����ҳ</li>
<li>����ҳ</li>
</li>
</div>
<div id="spics_wrap">
<ul id="spics" style="margin-left: 0;">
<?php if(is_array($piclist)) { foreach($piclist as $key => $value) { ?>
<li class="spic_<?=$key?>">
<div class="spic_img"><a href="space.php?uid=<?=$value['uid']?>&do=album&picid=<?=$value['picid']?>" target="_blank"><strong><?=$value['hot']?></strong><img src="<?=$value['pic']?>" alt="<?=$value['albumname']?>" /></a></div>
<p><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a></p>
<p><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></p>
</li>
<?php } } ?>
</ul>
</div>
</div>
<script type="text/javascript">
scrollShowNav($('spics'), 903, 7, 43);
</script>

<div id="searchbar" class="nbox s_clear">
<div class="floatleft">
<form method="get" action="cp.php">
<input name="searchkey" value="" size="15" class="t_input" type="text" style="padding:5px;">
<input name="searchsubmit" value="����" class="submit" type="submit"> &nbsp;
���ң�<a href="cp.php?ac=friend&op=search&view=sex" target="_blank">��Ů����</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=search&view=reside" target="_blank">ͬ��</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=search&view=birth" target="_blank">����</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=search&view=birthyear" target="_blank">ͬ��ͬ��ͬ����</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=search&view=edu" target="_blank">ͬѧ</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=search&view=work" target="_blank">ͬ��</a><span class="pipe">|</span>
<a href="space.php?do=top&view=online" target="_blank">���߻�Ա(<?=$olcount?>)</a>
<input type="hidden" name="searchmode" value="1" />
<input type="hidden" name="ac" value="friend" />
<input type="hidden" name="op" value="search" />
</form>
</div>
<div class="floatright">
<form method="get" action="space.php">
<input name="searchkey" value="" size="15" class="t_input" type="text" style="padding:5px;">
<select name="do">
<option value="blog">��־</option>
<option value="album">���</option>
<option value="thread">����</option>
<option value="poll">ͶƱ</option>
<option value="event">�</option>
</select>
<input name="searchsubmit" value="����" class="submit" type="submit">
<input type="hidden" name="view" value="all" />
<input type="hidden" name="orderby" value="dateline" />
</form>
</div>
</div>

<div id="showuser" class="nbox">
<div id="user_recomm">
<h2>վ���Ƽ�</h2>
<?php if(is_array($star)) { foreach($star as $value) { ?>
<div class="s_avatar"><a href="space.php?uid=<?=$value['uid']?>" target="_blank"><?php echo avatar($value[uid],middle); ?></a></div>
<div class="s_cnts">
<h3><a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>"><?=$_SN[$value['uid']]?></a></h3>
<p>����: <?=$value['viewnum']?></p>
<p>����: <?=$value['credit']?></p>
<hr />
<p>����: <?=$value['friendnum']?></p>
<p>����: <?php echo sgmdate('H:i',$value[updatetime],1); ?></p>
</div>
<?php } } ?>
</div>
<div id="user_wall" onmouseout="javascript:$('usertip_box').style.visibility = 'hidden';">
<div id="user_pay" class="s_clear">
<h2><a href="space.php?do=top">��������</a></h2>
<ul>
<?php if(is_array($showlist)) { foreach($showlist as $value) { ?>
<li><a href="space.php?uid=<?=$value['uid']?>" target="_blank" rel="<?=$_SN[$value['uid']]?>" rev="<?=$value['note']?>" onmouseover="getUserTip(this)"><?php echo avatar($value[uid],small); ?></a></li>
<?php } } ?>
</ul>
<p><a href="space.php?do=top">��Ҫ�ϰ�</a></p>
</div>
<div id="user_online" class="s_clear">
<h2><a href="space.php?do=top&view=online">���߻�Ա</a></h2>
<ul>
<?php if(is_array($onlinelist)) { foreach($onlinelist as $value) { ?>
<li><a href="space.php?uid=<?=$value['uid']?>" target="_blank" rel="<?=$_SN[$value['uid']]?>" rev="<?=$value['note']?>" class="uonline" onmouseover="getUserTip(this)"><?php echo avatar($value[uid],small); ?></a></li>
<?php } } ?>
</ul>
</div>
</div>
</div>
<div id="usertip_box"><div></div></div>

<div class="nbox">
<div class="nbox_c">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=thread&view=all">���໰��</a></span>���� &raquo;</h2>
<div class="tlist">
<table cellpadding="0" cellspacing="1">
<tbody>
<?php if(is_array($threadlist)) { foreach($threadlist as $key => $value) { ?>
<tr <?php if($key%2==1) { ?>class="color_row"<?php } ?>>
<td class="ttopic"><div class="ttop"><div><span><?=$value['hot']?></span></div></div><a href="space.php?uid=<?=$value['uid']?>&do=thread&id=<?=$value['tid']?>" target="_blank"><?=$value['subject']?></a></td>
<td class="tuser"><a href="space.php?uid=<?=$value['uid']?>" target="_blank"><?php echo avatar($value[uid],small); ?></a> <a href="space.php?uid=<?=$value['uid']?>" target="_blank"><?=$_SN[$value['uid']]?></a></td>
<td class="tgp"><a href="space.php?do=mtag&tagid=<?=$value['tagid']?>"><?=$value['tagname']?></a></td>
</tr>
<?php } } ?>
</tbody>
</table>
</div>
</div>
<div id="npoll" class="nbox_s side_rbox side_rbox_w">
<div class="side_rbox_c">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=poll">����ͶƱ</a></span>ͶƱ &raquo;</h2>
<ul>
<?php if(is_array($polllist)) { foreach($polllist as $key => $value) { ?>
<li class="poll_<?=$key?>"><a href="space.php?uid=<?=$value['uid']?>&do=poll&pid=<?=$value['pid']?>" target="_blank"><?=$value['subject']?></a><?php if($key == 0) { ?><p><a href="">���� <?=$value['voternum']?> λ��ԱͶƱ</a></p><?php } ?></li>
<?php } } ?>
</ul>
</div>
</div>
</div>

<?php if($myappcount) { ?>
<div class="nbox">
<div class="nbox_c" style="border: none;">
<ul class="applist">
<?php if(is_array($myapplist)) { foreach($myapplist as $value) { ?>
<li>
<p class="aimg"><a href="userapp.php?id=<?=$value['appid']?>" target="_blank"><img src="http://appicon.manyou.com/logos/<?=$value['appid']?>" alt="<?=$value['appname']?>" /></a></p>
<p><a href="userapp.php?id=<?=$value['appid']?>" target="_blank"><?=$value['appname']?></a></p>
</li>
<?php } } ?>
</ul>
</div>
<div class="susb">
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<div class="appmo">
<p>���� <span><?=$myappcount?></span> ����Ϸ</p>
<p class="appmobutton"><a href="cp.php?ac=userapp&my_suffix=%2Fapp%2Flist">�鿴����Ӧ��</a></p>
</div>
</div></div></div></div>	
</div>
</div>
<?php } ?>

<div class="nbox">
<div class="nbox_c">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=event&view=recommend">����</a></span> � &raquo; 
<?php if(is_array($_SGLOBAL['eventclass'])) { foreach($_SGLOBAL['eventclass'] as $value) { ?>
&nbsp; <a href="space.php?do=event&view=all&type=going&classid=<?=$value['classid']?>"><?=$value['classname']?></a></li>
<?php } } ?>
</h2>
<ul class="elist">
<?php if(is_array($eventlist)) { foreach($eventlist as $value) { ?>
<li>
<h3><a href="space.php?do=event&id=<?=$value['eventid']?>" target="_blank"><?=$value['title']?></a></h3>
<p class="eimage"><a href="space.php?do=event&id=<?=$value['eventid']?>" target="_blank"><img src="<?=$value['pic']?>" alt=""/></a></p>
<p><span class="gray">ʱ��:</span> <?php echo sgmdate('n-j H:i',$value[starttime]); ?> - <?php echo sgmdate('n-j H:i',$value[endtime]); ?></p>
<p><span class="gray">�ص�:</span> <?=$value['province']?> <?=$value['city']?> <?=$value['location']?></p>
<p><span class="gray">����:</span> <a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a></p>
<p class="egz"><?=$value['membernum']?> �˲μ�<span class="pipe">|</span><?=$value['follownum']?> �˹�ע</p>
</li>
<?php } } ?>
</ul>
</div>
<div id="nshare" class="nbox_s side_rbox side_rbox_w">
<h2 class="ntitle"><span class="r_option"><a href="space.php?do=share&view=all">�������</a></span>���� &raquo;</h2>
<div class="side_rbox_c">
<ul>
<?php if(is_array($sharelist)) { foreach($sharelist as $value) { ?>
<li><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a> <em><a href="space.php?uid=<?=$value['uid']?>&do=share&view=me"><?=$value['title_template']?></a></em></li>
<?php } } ?>
</ul>
</div>
</div>
</div>

<div class="footerbar">
<div class="fbtop"></div>
<div class="nbox_c">
<div class="foobox">
<div class="fbox">
<h2 class="ntitle">����</h2>
<ul>
<li><a href="space.php?do=doing">��¼</a></li>
<li><a href="space.php?do=blog">��־</a></li>
<li><a href="space.php?do=album">���</a></li>
<li><a href="space.php?do=mtag">Ⱥ��</a></li>
<li><a href="space.php?do=poll">ͶƱ</a></li>
<li><a href="space.php?do=event">�</a></li>
<li><a href="space.php?do=share">����</a></li>
</ul>
</div>
<div class="fbox">
<h2 class="ntitle">Ӧ��</h2>
<ul>
<?php if($myappcount) { ?>
<?php if(is_array($myapplist)) { foreach($myapplist as $value) { ?>
<li><a href="userapp.php?id=<?=$value['appid']?>"><?=$value['appname']?></a></li>
<?php } } ?>
<li><a href="cp.php?ac=userapp&my_suffix=%2Fapp%2Flist" class="alink">�鿴ȫ�� <?=$myappcount?> ��Ӧ��</a></li>
<?php } else { ?>
<li><a href="#">��û��Ӧ��</a></li>
<?php } ?>
</ul>
</div>
<div class="fbox">
<h2 class="ntitle">����</h2>
<ul>
<li><a href="space.php?do=blog&view=all">��ҷ������־</a></li>
<li><a href="space.php?do=album&view=all">����ϴ���ͼƬ</a></li>
<li><a href="space.php?do=thread&view=all">��ҵĻ���</a></li>
</ul>
</div>
</div>
</div>
<div class="nbox_s">
<h2 class="ntitle">����</h2>
<ul>
<li><a href="cp.php?ac=invite">������Ѽ��룬�������ֽ���</a></li>
<li><a href="cp.php?ac=invite">QQ ����</a></li>
<li><a href="cp.php?ac=invite">163 ����</a></li>
<li><a href="cp.php?ac=invite">��������</a></li>
<li><a href="cp.php?ac=invite">�Ѻ�����</a></li>
<li><a href="cp.php?ac=invite">Google Gmail</a></li>
<li><a href="cp.php?ac=invite">MSN ��ϵ��</a></li>
<li><a href="cp.php?ac=invite">Yahoo! ����</a></li>
<li><a href="cp.php?ac=invite" class="alink">������ϵ�ˡ���</a></li>
</ul>
</div>
<div class="fbbottom"></div>
</div>

</div>

<?php if(empty($_SGLOBAL['inajax'])) { ?>
<?php if(empty($_TPL['nosidebar'])) { ?>
<?php if($_SGLOBAL['ad']['contentbottom']) { ?><br style="line-height:0;clear:both;"/><div id="ad_contentbottom"><?php adshow('contentbottom'); ?></div><?php } ?>
</div>

<!--/mainarea-->
<div id="bottom"></div>
</div>
<!--/main-->
<?php } ?>

<div id="footer">
<?php if($_TPL['templates']) { ?>
<div class="chostlp" title="�л����"><img id="chostlp" src="<?=$_TPL['default_template']['icon']?>" onmouseover="showMenu(this.id)" alt="<?=$_TPL['default_template']['name']?>" /></div>
<ul id="chostlp_menu" class="chostlp_drop" style="display: none">
<?php if(is_array($_TPL['templates'])) { foreach($_TPL['templates'] as $value) { ?>
<li><a href="cp.php?ac=common&op=changetpl&name=<?=$value['name']?>" title="<?=$value['name']?>"><img src="<?=$value['icon']?>" alt="<?=$value['name']?>" /></a></li>
<?php } } ?>
</ul>
<?php } ?>

<p class="r_option">
<a href="javascript:;" onclick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="image/top.gif" alt="" style="padding: 5px 6px 6px;" /></a>
</p>

<?php if($_SGLOBAL['ad']['footer']) { ?>
<p style="padding:5px 0 10px 0;"><?php adshow('footer'); ?></p>
<?php } ?>

<?php if($_SCONFIG['close']) { ?>
<p style="color:blue;font-weight:bold;">
���ѣ���ǰվ�㴦�ڹر�״̬
</p>
<?php } ?>
<p>
<?=$_SCONFIG['sitename']?> - 
<a href="mailto:<?=$_SCONFIG['adminemail']?>">��ϵ����</a>
<?php if($_SCONFIG['miibeian']) { ?> - <a  href="http://www.miibeian.gov.cn" target="_blank"><?=$_SCONFIG['miibeian']?></a><?php } ?>
</p>
<p>
Powered by <a  href="http://u.discuz.net" target="_blank"><strong>UCenter Home</strong></a> <span title="<?php echo X_RELEASE; ?>"><?php echo X_VER; ?></span>
<?php if(!empty($_SCONFIG['licensed'])) { ?><a  href="http://license.comsenz.com/?pid=7&host=<?=$_SERVER['HTTP_HOST']?>" target="_blank">Licensed</a><?php } ?>
&copy; 2001-2009 <a  href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a>
</p>
<?php if($_SCONFIG['debuginfo']) { ?>
<p><?php echo debuginfo(); ?></p>
<?php } ?>
</div>
</div>
<!--/wrap-->

<?php if($_SGLOBAL['appmenu']) { ?>
<ul id="ucappmenu_menu" class="dropmenu_drop" style="display:none;">
<li><a href="<?=$_SGLOBAL['appmenu']['url']?>" title="<?=$_SGLOBAL['appmenu']['name']?>" target="_blank"><?=$_SGLOBAL['appmenu']['name']?></a></li>
<?php if(is_array($_SGLOBAL['appmenus'])) { foreach($_SGLOBAL['appmenus'] as $value) { ?>
<li><a href="<?=$value['url']?>" title="<?=$value['name']?>" target="_blank"><?=$value['name']?></a></li>
<?php } } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
<ul id="membernotemenu_menu" class="dropmenu_drop" style="display:none;">
<?php $member = $_SGLOBAL['member']; ?>
<?php if($member['notenum']) { ?><li><img src="image/icon/notice.gif" width="16" alt="" /> <a href="space.php?do=notice"><strong><?=$member['notenum']?></strong> ����֪ͨ</a></li><?php } ?>
<?php if($member['pokenum']) { ?><li><img src="image/icon/poke.gif" alt="" /> <a href="cp.php?ac=poke"><strong><?=$member['pokenum']?></strong> �����к�</a></li><?php } ?>
<?php if($member['addfriendnum']) { ?><li><img src="image/icon/friend.gif" alt="" /> <a href="cp.php?ac=friend&op=request"><strong><?=$member['addfriendnum']?></strong> ����������</a></li><?php } ?>
<?php if($member['mtaginvitenum']) { ?><li><img src="image/icon/mtag.gif" alt="" /> <a href="cp.php?ac=mtag&op=mtaginvite"><strong><?=$member['mtaginvitenum']?></strong> ��Ⱥ������</a></li><?php } ?>
<?php if($member['eventinvitenum']) { ?><li><img src="image/icon/event.gif" alt="" /> <a href="cp.php?ac=event&op=eventinvite"><strong><?=$member['eventinvitenum']?></strong> �������</a></li><?php } ?>
<?php if($member['myinvitenum']) { ?><li><img src="image/icon/userapp.gif" alt="" /> <a href="space.php?do=notice&view=userapp"><strong><?=$member['myinvitenum']?></strong> ��Ӧ����Ϣ</a></li><?php } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
<?php if(!isset($_SCOOKIE['checkpm'])) { ?>
<script language="javascript"  type="text/javascript" src="cp.php?ac=pm&op=checknewpm&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>
<?php if(!isset($_SCOOKIE['synfriend'])) { ?>
<script language="javascript"  type="text/javascript" src="cp.php?ac=friend&op=syn&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>
<?php } ?>
<?php if(!isset($_SCOOKIE['sendmail'])) { ?>
<script language="javascript"  type="text/javascript" src="do.php?ac=sendmail&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>

<?php if($_SGLOBAL['ad']['couplet']) { ?>
<script language="javascript" type="text/javascript" src="source/script_couplet.js"></script>
<div id="uch_couplet" style="z-index: 10; position: absolute; display:none">
<div id="couplet_left" style="position: absolute; left: 2px; top: 60px; overflow: hidden;">
<div style="position: relative; top: 25px; margin:0.5em;" onMouseOver="this.style.cursor='hand'" onClick="closeBanner('uch_couplet');"><img src="image/advclose.gif"></div>
<?php adshow('couplet'); ?>
</div>
<div id="couplet_rigth" style="position: absolute; right: 2px; top: 60px; overflow: hidden;">
<div style="position: relative; top: 25px; margin:0.5em;" onMouseOver="this.style.cursor='hand'" onClick="closeBanner('uch_couplet');"><img src="image/advclose.gif"></div>
<?php adshow('couplet'); ?>
</div>
<script type="text/javascript">
lsfloatdiv('uch_couplet', 0, 0, '', 0).floatIt();
</script>
</div>
<?php } ?>
<?php if($_SCOOKIE['reward_log']) { ?>
<script type="text/javascript">
showreward();
</script>
<?php } ?>
</body>
</html>
<?php } ?><?php ob_out();?>