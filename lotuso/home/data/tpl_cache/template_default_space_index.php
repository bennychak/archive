<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_index|template/default/header|template/default/space_status|template/default/space_feed_li|template/default/space_comment_li|template/default/footer', '1283180438', 'template/default/space_index');?><?php $_TPL['nosidebar']=1; ?>
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


<?php if($narrowlist || $widelist) { ?>
<script type="text/javascript" src="source/script_swfobject.js"></script>
<?php } ?>

<div id="space_page">

<div id="ubar">

<div id="space_avatar">
<?php if($space['magicstar'] && $space['magicexpire']>$_SGLOBAL['timestamp']) { ?>
<div class="magicstar">
<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,45,0" width="200" height="250">
<param name="movie" value="image/magic/star/<?=$space['magicstar']?>.swf" />
<param name="quality" value="high" />
<param NAME="wmode" value="transparent">
<embed src="image/magic/star/<?=$space['magicstar']?>.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash"  wmode="transparent" width="200" height="250"></embed>
</object>
</div>

<div class="magicavatar"><?php } else { ?><div><?php } ?><?php echo avatar($space[uid],big); ?></div>

</div>

<?php if($space['self'] && $_SGLOBAL['magic']['superstar']) { ?>
<div class="borderbox">
<div style="width:100%; overflow:hidden;">
<img src="image/magic/superstar.small.gif" class="magicicon" />
<?php if($space['magicstar'] && $space['magicexpire']>$_SGLOBAL['timestamp']) { ?>
<a id="a_magic_superstar" href="cp.php?ac=magic&op=cancelsuperstar" onclick="ajaxmenu(event, this.id)">ȡ����������</a>
<?php } else { ?>
<a id="a_magic_superstar" href="magic.php?mid=superstar" onclick="ajaxmenu(event, this.id, 1)">��Ҫ�䳬������</a>
<?php } ?>
</div>
</div><br />
<?php } ?>

<div class="borderbox">
<ul class="spacemenu_list" style="width:100%; overflow:hidden;">
<?php if($space['self']) { ?>
<li><a href="cp.php?ac=avatar">�ҵ�ͷ��</a></li>
<li><a href="cp.php?ac=profile">��������</a></li>
<li><a href="cp.php?ac=theme">��ҳ���</a></li>
<li><a href="cp.php?ac=credit">�ҵĻ���</a></li>
<?php if($_SCONFIG['sendmailday']) { ?>
<li><a href="cp.php?ac=sendmail">�ʼ�����</a></li>
<?php } ?>
<li><a href="cp.php?ac=privacy">��˽ɸѡ</a></li>
<?php } else { ?>
<?php if(!$space['isfriend']) { ?>
<li><img src="image/icon/friend.gif"><a href="cp.php?ac=friend&op=add&uid=<?=$space['uid']?>" id="a_friend_li" onclick="ajaxmenu(event, this.id, 1)">��Ϊ����</a></li>
<?php } ?>
<li><img src="image/icon/wall.gif"><a href="#comment">��������</a></li>
<li><img src="image/icon/poke.gif"><a href="cp.php?ac=poke&op=send&uid=<?=$space['uid']?>" id="a_poke" onclick="ajaxmenu(event, this.id, 1)">����к�</a></li>
<li><img src="image/icon/pm.gif"><a href="cp.php?ac=pm&uid=<?=$space['uid']?>" id="a_pm" onclick="ajaxmenu(event, this.id, 1)">������Ϣ</a></li>
<?php if($space['isfriend']) { ?>
<li><img src="image/icon/friend.gif"><a href="cp.php?ac=friend&op=ignore&uid=<?=$space['uid']?>" id="a_ignore" onclick="ajaxmenu(event, this.id)">�������</a></li>
<?php } ?>
<li><img src="image/icon/report.gif"><a href="cp.php?ac=common&op=report&idtype=uid&id=<?=$space['uid']?>" id="a_report" onclick="ajaxmenu(event, this.id, 1)">Υ��ٱ�</a></li>
<?php if(checkperm('managename')||checkperm('managespacegroup')||checkperm('managespaceinfo')||checkperm('managespacecredit')||checkperm('managespacenote')) { ?>
<li><img src="image/icon/profile.gif"><a href="admincp.php?ac=space&op=manage&uid=<?=$space['uid']?>" id="a_manage">�����û�</a></li>
<?php } ?>
<?php } ?>
</ul>
</div><br />

<div id="space_mymenu">
<h2>���˲˵�</h2>
<ul class="line_list">
<li>
<?php if($space['self']) { ?>
<a href="cp.php?ac=profile" class="r_option" target="_blank">����</a>
<?php } ?>
<img src="image/icon/profile.gif"><a href="javascript:;" onclick="getindex('info');">��������</a>
</li>
<li>
<?php if($space['self']) { ?>
<a href="space.php?do=doing&view=me" class="r_option" target="_blank">��¼</a>
<?php } ?>
<img src="image/icon/doing.gif"><a href="javascript:;" onclick="getindex('doing');">��¼</a><?php if($space['doingnum']) { ?><em>(<?=$space['doingnum']?>)</em><?php } ?>
</li>
<li>
<?php if($space['self']) { ?>
<a href="cp.php?ac=blog" class="r_option" target="_blank">����</a>
<?php } ?>
<img src="image/icon/blog.gif"><a href="javascript:;" onclick="getindex('blog');">��־</a><?php if($space['blognum']) { ?><em>(<?=$space['blognum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=upload" class="r_option" target="_blank">�ϴ�</a>
<?php } ?>
<img src="image/icon/album.gif"><a href="javascript:;" onclick="getindex('album');">���</a><?php if($space['albumnum']) { ?><em>(<?=$space['albumnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=thread" class="r_option" target="_blank">����</a>
<?php } ?>
<img src="image/icon/thread.gif"><a href="javascript:;" onclick="getindex('thread');">����</a><?php if($space['threadnum']) { ?><em>(<?=$space['threadnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=poll" class="r_option" target="_blank">����</a>
<?php } ?>
<img src="image/icon/poll.gif"><a href="javascript:;" onclick="getindex('poll');">ͶƱ</a><?php if($space['pollnum']) { ?><em>(<?=$space['pollnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=event" class="r_option" target="_blank">����</a>
<?php } ?>
<img src="image/icon/event.gif"><a href="javascript:;" onclick="getindex('event');">�</a><?php if($space['eventnum']) { ?><em>(<?=$space['eventnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="space.php?do=share&view=me" class="r_option" target="_blank">���</a>
<?php } ?>
<img src="image/icon/share.gif"><a href="javascript:;" onclick="getindex('share');">����</a><?php if($space['sharenum']) { ?><em>(<?=$space['sharenum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=friend&op=search" class="r_option" target="_blank">Ѱ��</a>
<?php } ?>
<img src="image/icon/friend.gif"><a href="javascript:;" onclick="getindex('friend');">����</a><?php if($space['friendnum']) { ?><em>(<?=$space['friendnum']?>)</em><?php } ?></li>
</ul>
</div>

<?php if($guidelist) { ?>
<div id="space_app_guide">
<h2>Ӧ�ò˵�</h2>
<ul class="line_list">
<?php if(is_array($guidelist)) { foreach($guidelist as $value) { ?>
<li id="space_app_profilelink_<?=$value['appid']?>">
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>&type=profilelink" id="user_app_profile_<?=$value['appid']?>" class="r_option float_del" style="position: static;" onclick="ajaxmenu(event, this.id)" title="ɾ��">ɾ��</a>
<?php } ?>
<img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><?php eval($value[profilelink]); ?>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if(is_array($narrowlist)) { foreach($narrowlist as $value) { ?>
<div id="space_app_<?=$value['appid']?>">
<h2>
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>" id="user_app_<?=$value['appid']?>" class="r_option float_del" onclick="ajaxmenu(event, this.id)" title="ɾ��">ɾ��</a>
<?php } ?>
<a href="<?=$value['appurl']?>"><?=$value['appname']?></a>
</h2>
<?php if($value['myml']) { ?>
<div class="box">
<?php eval($value[myml]); ?>
</div>
<?php } ?>
</div>
<?php } } ?>

</div>

<div id="content">

<h3 id="spaceindex_name">
<?php if($_SCONFIG['realname']) { ?>
<?php if($space['name']) { ?><a href="space.php?uid=<?=$space['uid']?>"<?php g_color($space[groupid]); ?>><?=$space['name']?></a><?php } else { ?>δ��дʵ��<?php } ?>
&nbsp;<em>(�û���: <?=$space['username']?>)</em>
<?php } else { ?>
<a href="space.php?uid=<?=$space['uid']?>"<?php g_color($space[groupid]); ?>><?=$space['username']?></a>
<?php if($space['name']) { ?>&nbsp;<em>(����: <?=$space['name']?>)</em><?php } ?>
<?php } ?>

<?php if($_SCONFIG['realname']) { ?>
<?php if($space['namestatus']) { ?>
&nbsp;<img src="image/realname_yes.gif" align="absmiddle" alt="��ͨ��ʵ����֤">
<?php } else { ?>
&nbsp;<img src="image/realname_no.gif" align="absmiddle" alt="δͨ��ʵ����֤"> <span class="gray">ʵ��δ��֤</span>
<?php } ?>
<?php } ?>

<?php if($_SCONFIG['videophoto']) { ?>	
<?php if($space['videostatus']) { ?>
&nbsp;<img src="image/videophoto_yes.gif" align="absmiddle" alt="��ͨ����Ƶ��֤"> <a id="a_space_videophoto" href="space.php?uid=<?=$space['uid']?>&do=videophoto" onclick="ajaxmenu(event, this.id, 1)"><span style="color:red;font-weight:bold;font-size:12px;">�鿴��Ƶ��֤��</span></a>
<?php } else { ?>
&nbsp; <img src="image/videophoto_no.gif" align="absmiddle" alt="δͨ����Ƶ��֤"> <span class="gray"><a href="cp.php?ac=videophoto">��Ƶδ��֤</a></span>
<?php } ?>
<?php } ?>
</h3>


<div id="spaceindex_note">
<a href="cp.php?ac=share&type=space&id=<?=$space['uid']?>" class="a_share" id="a_share" onclick="ajaxmenu(event, this.id, 1)">����</a>
<a href="rss.php?uid=<?=$space['uid']?>" id="i_rss" title="���� RSS">����</a>

<ul class="note_list">
<li>���� <?=$space['viewnum']?> �˴η���, <?=$space['credit']?> ������, <?=$space['experience']?> ������ <?=$space['star']?></li>
<li>�û����<a href="cp.php?ac=credit&op=usergroup"><?=$_SGLOBAL['grouptitle'][$space['groupid']]['grouptitle']?></a> <?php g_icon($space[groupid]); ?></li>
<li>��ҳ��ַ��<a href="<?=$space['domainurl']?>" onclick="javascript:setCopy('<?=$space['domainurl']?>');return false;" class="spacelink domainurl"><?=$space['domainurl']?></a></li>

<?php if(!$space['self'] && $space['spacenote']) { ?>
<li><?=$space['spacenote']?> <a href="space.php?uid=<?=$space['uid']?>&do=doing">&raquo;</a></li>
<?php } ?>
</ul>

<?php if($space['self']) { ?>
<div id="mood_mystatus">
<?=$space['spacenote']?>
</div>

<div id="mood_form">
<form method="post" action="cp.php?ac=doing" id="mood_addform">
<div id="mood_statusinput" class="statusinput"><textarea name="message" id="mood_message" onclick="statusFace();" onkeydown="if(event.keyCode == 13 ){ event.returnValue=false;event.cancel = true;$('mood_add').click();$('mood_message').value='';this.blur(); };" >����Ը���״̬, �ú�����֪��������ʲô...</textarea></div>
<div class="statussubmit">
<input type="button" id="mood_add" name="add" value="����" class="submit" style="display:none;" onclick="ajaxpost('mood_addform', 'reloadMood');$('mood_message').value='';" />
<input type="hidden" name="addsubmit" value="true" />
<input type="hidden" name="spacenote" value="true" />
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</div>

</form>
</div>


<script type="text/javascript">
function statusFace() {
if($('mood_message').value == '����Ը���״̬, �ú�����֪��������ʲô...'){
$('mood_message').value = '';
}
$('mood_statusinput').style.zIndex = '20005';
$('mood_statusinput').className = 'statusinput2';
$('mood_add').style.display = 'block';


var div = $('mood_face_bg');
if(div) {
div.parentNode.removeChild(div);
}
div = document.createElement('div');
div.id = 'mood_face_bg';
div.style.position = 'absolute';
div.style.left = div.style.top = '0px';
div.style.width = '100%';
div.style.height = document.body.scrollHeight + 'px';
div.style.backgroundColor = '#000';
div.style.zIndex = 10000;
div.style.display = 'none';
div.style.filter = 'alpha(opacity=0)';
div.style.opacity = 0;
div.onclick = function() {
hiddenstatus();
}
$('append_parent').appendChild(div);


if($('mood_message_menu') != null) {
$('mood_message_menu').style.display = '';
$('mood_add').style.display = '';
} else {
var faceDiv = document.createElement("div");
faceDiv.id = 'mood_message_menu';
faceDiv.className = 'facebox';
faceDiv.style.position = 'absolute';
var faceul = document.createElement("ul");
for(i=1; i<31; i++) {
getStatusFace(i, faceul);	
}
faceDiv.appendChild(faceul);
$('append_parent').appendChild(faceDiv);
}
//��λ�˵�
setMenuPosition('mood_message', 0);
div.style.display = '';
}

function hiddenstatus() {
$('mood_message_menu').style.display = 'none';
$('mood_face_bg').style.display = 'none';
$('mood_add').style.display = 'none';
$('mood_statusinput').className = 'statusinput';
if($('mood_message').value == ''){
$('mood_message').value = '����Ը���״̬, �ú�����֪��������ʲô...';
}
$('mood_statusinput').style.zIndex = '1';
}

function getStatusFace(i, faceul) {
var faceli = document.createElement("li");
faceli.innerHTML = '<img src="image/face/'+i+'.gif" style="cursor:pointer; position:relative;" />';
faceli.getElementsByTagName('img').item(0).onclick = function(){var faceText = '[em:'+i+':]'; if($('mood_message') != null) { insertContent('mood_message', faceText); }};
faceul.appendChild(faceli);
}

function reloadMood(showid, result) {
var x = new Ajax();
x.get('cp.php?ac=doing&op=getmood', function(s){
$('mood_mystatus').innerHTML = s;
});
//��ʾ��û���
showreward();
hiddenstatus();
}
</script>
<?php } ?>
</div>

<div id="maincontent">

<?php if(!$space['isfriend']) { ?>
<div class="borderbox">
<p style="padding-bottom:10px;">�������ʶ<?=$_SN[$space['uid']]?>�����Ը�TA�����ԣ����ߴ���к����������Ϊ���ѡ�<br />��Ϊ���Ѻ����Ϳ��Ե�һʱ���ע��TA�ĸ��¶�̬��</p>
<a href="cp.php?ac=friend&op=add&uid=<?=$space['uid']?>" id="a_friend_notice" onclick="ajaxmenu(event, this.id, 1)" class="submit">��Ϊ����</a></p>
</div><br>
<?php } ?>

<div id="space_info">
<h3 class="feed_header">
<?php if($space['self']) { ?>
<a href="cp.php?ac=profile" class="r_option">��������</a>
<?php } ?>
��������
</h3>
<ul class="spacemenu_list">
<li><em>����:</em><?php echo sgmdate('Y-m-d',$space[dateline],1); ?></li>
<li><em>��¼:</em><?php if($space['lastlogin']) { ?><?php echo sgmdate('Y-m-d',$space[lastlogin],1); ?><?php } ?></li>
<?php if($isonline) { ?>
<li><em>��Ծ:</em><?=$isonline?> (��ǰ����)</li>
<?php } ?>
<?php if($space['sex']) { ?>
<li><em>�Ա�:</em><?=$space['sex']?></li>
<?php } ?>
<?php if($space['birth']) { ?>
<li><em>����:</em><?=$space['birth']?></li>
<?php } ?>
<?php if($space['blood']) { ?>
<li><em>Ѫ��:</em><?=$space['blood']?></li>
<?php } ?>
<?php if($space['marry']) { ?>
<li><em>����:</em><?=$space['marry']?></li>
<?php } ?>
<?php if($space['residecity']) { ?>
<li><em>��ס:</em><?=$space['residecity']?></li>
<?php } ?>
<?php if($space['birthcity']) { ?>
<li><em>����:</em><?=$space['birthcity']?></li>
<?php } ?>
<?php if($space['mobile']) { ?>
<li><em>�ֻ�:</em><?=$space['mobile']?></li>
<?php } ?>
<?php if($space['qq']) { ?>
<li><em>QQ:</em><?=$space['qq']?></li>
<?php } ?>
<?php if($space['msn']) { ?>
<li><em>MSN:</em><?=$space['msn']?></li>
<?php } ?>
</ul>
<p class="info_more"><a href="javascript:;" onclick="getindex('info');">&raquo; �鿴ȫ����������</a></p>
</div>

<?php if($feedlist) { ?>
<?php $_TPL['hidden_hot']=1; ?>
<div id="space_feed" class="feed">
<h3 class="feed_header">
<span class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=feed&view=me" class="action">ȫ��</a>
</span>
<span class="entry-title">���˶�̬</span>
</h3>
<div class="box_content">
<ul>
<?php if(is_array($feedlist)) { foreach($feedlist as $value) { ?>
<li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="��ʾ����ѡ��" style="display:none;">�˵�</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="ֻ�����ද̬"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">�ظ�</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">����</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="image/vd.gif" alt="�������" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="image/music.gif" alt="�������" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="image/flash.gif" alt="����鿴" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; ���ද̬(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
<?php } } ?>
</ul>
</div>
</div>
<?php } ?>

<?php if($albumlist) { ?>
<div id="space_photo">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=album&view=me" class="r_option">ȫ��</a>
���
</h3>
<table cellspacing="4" cellpadding="4" width="100%">
<tr>
<?php if(is_array($albumlist)) { foreach($albumlist as $key => $value) { ?>
<td width="85" align="center"><a href="space.php?uid=<?=$space['uid']?>&do=album&id=<?=$value['albumid']?>" target="_blank"><img src="<?=$value['pic']?>" alt="<?=$value['albumname']?>" width="70" /></a></td>
<td width="165">
<h6><a href="space.php?uid=<?=$space['uid']?>&do=album&id=<?=$value['albumid']?>" target="_blank" title="<?=$value['albumname']?>"><?=$value['albumname']?></a></h6>
<p class="gray"><?=$value['picnum']?> ����Ƭ</p>
<p class="gray">������ <?php echo sgmdate('m-d',$value[dateline],1); ?></p>
</td>
<?php if($key%2==1) { ?></tr><tr><?php } ?>
<?php } } ?>
</tr>
</table>
</div>
<?php } ?>

<?php if($bloglist) { ?>
<div id="space_blog" class="feed">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=blog&view=me" class="r_option">ȫ��</a>
��־
</h3>
<ul class="line_list">
<?php if(is_array($bloglist)) { foreach($bloglist as $value) { ?>
<li>

<h4>
<span class="gray r_option"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<a href="space.php?uid=<?=$space['uid']?>&do=blog&id=<?=$value['blogid']?>" target="_blank"><?=$value['subject']?></a>
</h4>
<div class="detail">
<?=$value['message']?>
</div>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>


<?php if(is_array($widelist)) { foreach($widelist as $value) { ?>
<?php if($value['myml']) { ?>
<div id="space_app_<?=$value['appid']?>" class="appbox">
<h3 class="feed_header">
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>" id="user_app_<?=$value['appid']?>" class="r_option float_del" onclick="ajaxmenu(event, this.id)" title="ɾ��">ɾ��</a>
<?php } ?>
<a href="<?=$value['appurl']?>"><?=$value['appname']?></a>
</h3>
<div class="box" style="margin: 0 0 20px;">
<?php eval($value[myml]); ?>
</div>
</div>
<?php } ?>
<?php } } ?>

</div>

<div id="comment" class="comments_list">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=wall&view=me" class="r_option">ȫ��</a>
���԰�
</h3>

<div class="box">
<form action="cp.php?ac=comment" id="quick_commentform_<?=$space['uid']?>" name="quick_commentform_<?=$space['uid']?>" method="post" style="padding:0 0 0 5px;">
<a href="###" id="editface" onclick="showFace(this.id, 'comment_message');return false;"><img src="image/facelist.gif" align="absmiddle" /></a>
<?php if($_SGLOBAL['magic']['doodle']) { ?>
<a id="a_magic_doodle" href="magic.php?mid=doodle&showid=comment_doodle&target=comment_message" onclick="ajaxmenu(event, this.id, 1)"><img src="image/magic/doodle.small.gif" class="magicicon" />Ϳѻ��</a>
<?php } ?>
<br />
<textarea name="message" id="comment_message" rows="4" cols="60" style="width:98%;" onkeydown="ctrlEnter(event, 'commentsubmit_btn');"></textarea><br>
<input type="hidden" name="refer" value="space.php?uid=<?=$space['uid']?>" />
<input type="hidden" name="id" value="<?=$space['uid']?>" />
<input type="hidden" name="idtype" value="uid" />
<input type="hidden" name="commentsubmit" value="true" />
<input type="button" id="commentsubmit_btn" name="commentsubmit_btn" class="submit" value="����" onclick="ajaxpost('quick_commentform_<?=$space['uid']?>', 'wall_add')" />
<span id="__quick_commentform_<?=$space['uid']?>"></span>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>

<div class="box_content">
<ul class="post_list a_list justify_list" id="comment_ul">
<?php if(is_array($walllist)) { foreach($walllist as $value) { ?>
<?php if(empty($ajax_edit)) { ?><li id="comment_<?=$value['cid']?>_li"><?php } ?>
<?php if($value['author']) { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['authorid']?>"><?php echo avatar($value[authorid],small); ?></a></div>
<?php } else { ?>
<div class="avatar48"><img src="image/magic/hidden.gif" class="avatar" /></div>
<?php } ?>
<div class="title">
<div class="r_option">

<?php if($value['authorid'] != $_SGLOBAL['supe_uid'] && $value['author'] == "" && $_SGLOBAL['magic']['reveal']) { ?>
<a id="a_magic_reveal_<?=$value['cid']?>" href="magic.php?mid=reveal&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id,1)"><img src="image/magic/reveal.small.gif" class="magicicon"><?=$_SGLOBAL['magic']['reveal']?></a>
<span class="pipe">|</span>
<?php } ?>

<?php if($value['authorid']==$_SGLOBAL['supe_uid']) { ?>
<?php if($_SGLOBAL['magic']['anonymous']) { ?>
<img src="image/magic/anonymous.small.gif" class="magicicon">
<a id="a_magic_anonymous_<?=$value['cid']?>" href="magic.php?mid=anonymous&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id, 1)"><?=$_SGLOBAL['magic']['anonymous']?></a>
<span class="pipe">|</span>
<?php } ?>
<?php if($_SGLOBAL['magic']['flicker']) { ?>
<img src="image/magic/flicker.small.gif" class="magicicon">
<?php if($value['magicflicker']) { ?>
<a id="a_magic_flicker_<?=$value['cid']?>" href="cp.php?ac=magic&op=cancelflicker&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id)">ȡ��<?=$_SGLOBAL['magic']['flicker']?></a>
<?php } else { ?>
<a id="a_magic_flicker_<?=$value['cid']?>" href="magic.php?mid=flicker&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id, 1)"><?=$_SGLOBAL['magic']['flicker']?></a>
<?php } ?>
<span class="pipe">|</span>
<?php } ?>

<a href="cp.php?ac=comment&op=edit&cid=<?=$value['cid']?>" id="c_<?=$value['cid']?>_edit" onclick="ajaxmenu(event, this.id, 1)">�༭</a>
<?php } ?>
<?php if($value['authorid']==$_SGLOBAL['supe_uid'] || $value['uid']==$_SGLOBAL['supe_uid'] || checkperm('managecomment')) { ?>
<a href="cp.php?ac=comment&op=delete&cid=<?=$value['cid']?>" id="c_<?=$value['cid']?>_delete" onclick="ajaxmenu(event, this.id)">ɾ��</a>
<?php } ?>
<?php if($value['authorid']!=$_SGLOBAL['supe_uid'] && ($value['idtype'] != 'uid' || $space['self'])) { ?>
<a href="cp.php?ac=comment&op=reply&cid=<?=$value['cid']?>&feedid=<?=$feedid?>" id="c_<?=$value['cid']?>_reply" onclick="ajaxmenu(event, this.id, 1)">�ظ�</a>
<?php } ?>
<a href="cp.php?ac=common&op=report&idtype=comment&id=<?=$value['cid']?>" id="a_report_<?=$value['cid']?>" onclick="ajaxmenu(event, this.id, 1)">�ٱ�</a>
</div>

<?php if($value['author']) { ?>
<a href="space.php?uid=<?=$value['authorid']?>" id="author_<?=$value['cid']?>"><?=$_SN[$value['authorid']]?></a> 
<?php } else { ?>
����
<?php } ?>
<span class="gray"><?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></span>

</div>

<div class="detail<?php if($value['magicflicker']) { ?> magicflicker<?php } ?>" id="comment_<?=$value['cid']?>"><?=$value['message']?></div>

<?php if(empty($ajax_edit)) { ?></li><?php } ?>
<?php } } ?>
</ul>
<?php if($walllist) { ?>
<p class="r_option" style="padding:5px 0 10px 0;"><a href="space.php?uid=<?=$space['uid']?>&do=wall&view=me">&raquo; ��������</a></p>
<?php } ?>
</div>
</div>
</div>

<div id="obar">
<?php if(!$space['self']) { ?>

<?php if($space['magiccredit']) { ?>
<div class="magichongbao" id="div_magic_gift">
<a id="a_magic_gift" href="cp.php?&ac=magic&op=receive&uid=<?=$space['uid']?>" onclick="ajaxmenu(event, this.id)">���� <span><?=$space['magiccredit']?></span> ���ִ���</a>
</div>
<?php } ?>

<?php if($_SGLOBAL['magic']['viewmagiclog'] || $_SGLOBAL['magic']['viewmagic'] || $_SGLOBAL['magic']['viewvisitor']) { ?>
<div class="indexmagic">
<?php if(is_array(array('viewmagiclog','viewmagic','viewvisitor'))) { foreach(array('viewmagiclog','viewmagic','viewvisitor') as $mid) { ?>
<?php if($_SGLOBAL['magic'][$mid]) { ?>
<a id="a_magic_<?=$mid?>" href="magic.php?mid=<?=$mid?>&idtype=uid&id=<?=$space['uid']?>" onclick="ajaxmenu(event,this.id,1)">
<img src="image/magic/<?=$mid?>.small.gif" title="<?=$_SGLOBAL['magic'][$mid]?>" alt="<?=$_SGLOBAL['magic'][$mid]?>">
</a>
<?php } ?>
<?php } } ?>
</div>
<?php } ?>
<?php } else { ?>
<?php if($_SGLOBAL['magic']['gift']) { ?>
<div class="magichongbao" id="div_magic_gift">				
<?php if($space['magiccredit']) { ?>
<a id="a_magic_retrieve" href="cp.php?ac=magic&op=retrieve" onclick="ajaxmenu(event,this.id)">�������µĻ���</a>
<?php } else { ?>
<a id="a_magic_gift" href="magic.php?mid=gift" onclick="ajaxmenu(event,this.id,1)">��������������</a>
<?php } ?>				
</div>
<?php } ?>
<?php } ?>


<?php if($visitorlist) { ?>
<div class="sidebox">
<h2 class="title">
<a href="space.php?uid=<?=$space['uid']?>&do=friend&view=visitor" class="r_option">ȫ��</a>
�������
<?php if(!$space['self'] && $_SGLOBAL['magic']['anonymous']) { ?>
<span class="gray"><img title="<?=$_SGLOBAL['magic']['anonymous']?>" src="image/magic/anonymous.small.gif"/><a id="a_magic_anonymous" href="magic.php?mid=anonymous&idtype=uid&id=<?=$space['uid']?>" onclick="ajaxmenu(event,this.id,1)">����</a></span>
<?php } ?>
</h2>
<ul class="avatar_list">
<?php if(is_array($visitorlist)) { foreach($visitorlist as $key => $value) { ?>
<li>
<?php if($value['vusername'] == '') { ?>
<div class="avatar48"><img src="image/magic/hidden.gif" alt="����" /></div>
<p>����</p>
<p class="gray"><?php echo sgmdate('n��j��',$value[dateline],1); ?></p>
<?php } else { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['vuid']?>"><?php echo avatar($value[vuid],small); ?></a></div>
<p<?php if($ols[$value['vuid']]) { ?> class="online_icon_p"<?php } ?>><a href="space.php?uid=<?=$value['vuid']?>" title="<?=$_SN[$value['vuid']]?>"><?=$_SN[$value['vuid']]?></a></p>
<p class="gray"><?php echo sgmdate('n��j��',$value[dateline],1); ?></p>
<?php } ?>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>


<?php if($friendlist) { ?>
<div class="sidebox">
<h2 class="title">
<span class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=friend&view=me" class="action">ȫ��(<?=$space['friendnum']?>)</a>
</span>
����
</h2>
<ul class="avatar_list">
<?php if(is_array($friendlist)) { foreach($friendlist as $value) { ?>
<li>
<div class="avatar48"><a href="space.php?uid=<?=$value['fuid']?>"><?php echo avatar($value[fuid],small); ?></a></div>
<p<?php if($ols[$value['fuid']]) { ?> class="online_icon_p"<?php } ?>><a href="space.php?uid=<?=$value['fuid']?>"><?=$_SN[$value['fuid']]?></a></p>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

</div>

</div>

<?php if($_GET['theme']) { ?><div class="nn">���Ƿ���ʹ�������Է��?<br /><a href="cp.php?ac=theme&op=use&dir=<?=$_GET['theme']?>">[Ӧ��]</a><a href="cp.php?ac=theme">[ȡ��]</a></div><?php } ?>
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
<?php } ?>

<script>
function getindex(type) {
var plus = '';
if(type == 'event') plus = '&type=self';
ajaxget('space.php?uid=<?=$space['uid']?>&do='+type+'&view=me'+plus+'&ajaxdiv=maincontent', 'maincontent');
}

//�ʺ���
var elems = selector('div[class~=magicflicker]'); 
for(var i=0; i<elems.length; i++){
magicColor(elems[i]);
}

</script><?php ob_out();?>