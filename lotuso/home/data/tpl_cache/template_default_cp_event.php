<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/cp_event|template/default/header|template/default/cp_topic_menu|template/default/footer|template/default/space_topic_inc', '1283361482', 'template/default/cp_event');?><?php if(empty($_SGLOBAL['inajax'])) { ?>
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


<?php if(empty($topic) && in_array($op,array("edit", "pic", "thread", "members", "comment", "invite", "eventinvite"))) { ?>
<!--//����ҳҳͷ//-->
<style type="text/css">
.poster_pre{
max-width: 80px; max-height: 104px;}
.poster{
max-width: 200px; max-height: 260px;}
</style>
<div id="mainarea">
    <h2 class="title"><img src="image/app/event.gif" />� <?php if($eventid) { ?>- <a href="space.php?do=event&id=<?=$event['eventid']?>"><?=$event['title']?></a><?php } ?></h2>
    <div class="tabs_header">
        <ul class="tabs">
<?php if($eventid) { ?>
<?php if($allowmanage) { ?>
            <li <?=$menus['edit']?>><a href="cp.php?ac=event&op=edit&id=<?=$eventid?>"><span>�޸Ļ</span></a></li>
<?php } ?>
<?php if($_SGLOBAL['supe_userevent']['status'] > 1 && ($_SGLOBAL['supe_userevent']['status'] >= 3 || $event['allowinvite'])) { ?>
<li <?=$menus['invite']?>><a href="cp.php?ac=event&op=invite&id=<?=$eventid?>"><span>�������</span></a></li>
<?php } ?>
<?php if($_SGLOBAL['supe_userevent']['status'] >= 3) { ?>
<li <?=$menus['members']?>><a href="cp.php?ac=event&op=members&id=<?=$eventid?>"><span>��Ա����</span></a></li>
<?php } ?>
<?php if($allowmanage) { ?>
<li <?=$menus['pic']?>><a href="cp.php?ac=event&op=pic&id=<?=$eventid?>"><span>��Ƭ����</span></a></li>
<?php if($event['tagid']) { ?>
<li <?=$menus['thread']?>><a href="cp.php?ac=event&op=thread&id=<?=$eventid?>"><span>�������</span></a></li>
<?php } ?>
<?php } ?>
<?php } else { ?>
<?php if("eventinvite"==$op) { ?>
<li class="active"><a href="cp.php?ac=event&op=eventinvite"><span>�����</span></a></li>
<?php } else { ?>
<li class="active"><a href="cp.php?ac=event"><span>����</span></a></li>
<?php } ?>
<?php } ?>
<li><a href="space.php?do=event&id=<?=$eventid?>"><span>���ػ��ҳ</span></a></li>
        </ul>
        <?php if($menus['members']) { ?>
        <form action="cp.php" method="get" id="searchform" name="searchform">
<div style="margin: 0pt 6px 5px 0pt; float: right;">
<table cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td style="padding: 0pt;"><input type="text" style="border-right: medium none; width: 160px;" tabindex="1" class="t_input" onfocus="if(this.value=='������Ա')this.value='';" value="������Ա" name="key" id="key"/></td>
<td style="padding: 0pt;"><a href="javascript:$('searchform').submit();"><img alt="����" src="image/search_btn.gif"/></a></td>
</tr>
</tbody>
</table>
</div>
<input type="hidden" value="event" name="ac"/>
<input type="hidden" value="<?=$eventid?>" name="id"/>
<input type="hidden" value="members" name="op"/>
<input type="hidden" value="<?=$_GET['status']?>" name="status"/>
<input type="hidden" value="<?php echo formhash(); ?>" name="formhash"/>
</form>
        <?php } ?>
    </div>
<?php } ?>

<?php if("join"==$op) { ?>
<?php if($event['allowfellow'] || $event['template']) { ?>
<div>
<h1>��д������Ϣ</h1>
<form action="cp.php?ac=event&op=join&id=<?=$event['eventid']?>" method="post" style="padding: 5px 10px;">
<?php if($event['allowfellow']) { ?>
<p>
<span>Я������</span>
<input name="fellow" type="text" size="4" value="<?php if(empty($_SGLOBAL['supe_userevent']['fellow'])) { ?>0<?php } else { ?><?=$_SGLOBAL['supe_userevent']['fellow']?><?php } ?>" />
<span class="tiptext">�����������Ѳμӣ���ע��Я��������</span>
</p>
<?php } ?>
<?php if($event['template']) { ?>
<p>
<span>������Ϣ</span><span class="tiptext">���밴������߸�����ģ����д��</span><br />
<textarea name="template" rows="4" style="width: 320px;"><?php if(empty($_SGLOBAL['supe_userevent']['template'])) { ?><?=$event['template']?><?php } else { ?><?=$_SGLOBAL['supe_userevent']['template']?><?php } ?></textarea>
</p>
<?php } ?>
<p class="btn_line"><br />
<input type="submit" class="submit" name="joinsubmit" value="ȷ��" />
<input type="button" class="button" value="ȡ��" onclick="hideMenu()" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } else { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=join&id=<?=$eventid?>">
<h1>��ȷ��<?php if($event['verify']) { ?>����<?php } else { ?>�μ�<?php } ?>�˻��</h1>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="joinsubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } ?>
<?php } elseif($op == "follow") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=follow&id=<?=$eventid?>">
<h1>��ȷ����ע�˻��</h1>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>" />
<input type="submit" name="followsubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>">
</form>
</div>
<?php } elseif($op == "cancelfollow") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=cancelfollow&id=<?=$eventid?>">
<h1>��ȷ��ȡ����ע�˻��</h1>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="cancelfollowsubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "quit") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=quit&id=<?=$eventid?>">
<h1>��ȷ���˳��˻��</h1>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="quitsubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "delete") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=delete&id=<?=$eventid?>">
<h1>��ȷ��ȡ���˻��</h1>
<p>�ȡ����ɾ�����л�����Ϣ��<br />�˲������ɻָ���</p>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="deletesubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "member") { ?>
<div id="memberevent">
<div><a class="float_del" title="�ر�" href="javascript:hideMenu();">�ر�</a></div>
<br clear="both" />
<form method="post" name="eventform" id="eventmember_<?=$uid?>" action="cp.php?ac=event&op=member&id=<?=$eventid?>">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="hidden" name="uid" value="<?=$userevent['uid']?>">
<p>
��Ϊ��
<select name="status">
<option value="2">��ͨ��Ա</option>
<?php if($_SGLOBAL['supe_uid']==$event['uid']) { ?>
<option value="3">��֯��</option>
<?php } ?>
<?php if($event['verify']) { ?>
<option value="0">�����</option>
<?php } ?>
<option value="-1">�߳���Ա</option>
</select> &nbsp;
<input type="submit" name="membersubmit" value="�ύ" class="submit" />
</p>
</form>
</div>
<?php } elseif($op == "print") { ?>
<div>
<div><a class="float_del" title="�ر�" href="javascript:hideMenu();">�ر�</a></div>
<br clear="both" />
<form method="post" target="_blank" name="eventform" action="cp.php?ac=event&op=print&id=<?=$eventid?>">
<h2>���ô�ӡѡ��</h2>
<p>���ݣ�
<!--input type="checkbox" id="ckavatarbig" name="avatarbig" /> <lable for="ckavatarbig">��ͷ��</lable-->
<input type="checkbox" id="ckavatarbig" name="avatarsmall" checked="checked" /> <lable for="ckavatarsmall">ͷ��</lable>
<input type="checkbox" id="ckusername" name="username" checked="checked" /> <lable for="ckusername">����</lable>
<?php if($event['allowfellow']) { ?>
<input type="checkbox" id="ckfellow" name="fellow" checked="checked" /> <lable for="ckfellow">Я������</lable>
<?php } ?>
<?php if($event['template']) { ?>
<input type="checkbox" id="cktemplate" name="template" checked="checked" /> <lable for="cktemplate">������Ϣ</lable>
<?php } ?>
</p>
<p>ѡ�
<input type="checkbox" id="ckadmin" name="admin" /> <lable for="ckadmin">������֯��</lable>
</p>
<p class="btn_line">
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="printsubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "close") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=close&id=<?=$eventid?>">
<h1>��ȷ��Ҫ�رջ��</h1>
<p>��ر�֮��ֻ������������</p>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="closesubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "open") { ?>
<div>
<form method="post" name="eventform" action="cp.php?ac=event&op=open&id=<?=$eventid?>">
<h1>��ȷ��Ҫ���¿������</h1>
<p class="btn_line"><br />
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>">
<input type="submit" name="opensubmit" value="ȷ��" class="submit" />
<input type="button" name="btnclose" value="ȡ��" onclick="hideMenu();" class="button" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } elseif($op == "calendar") { ?>	
<div class="calendar">
<div id="calendar_pre" class="floatleft"><a href="#" onclick="showcalendar('<?=$premonth?>'); this.blur(); return false;">&lt;&lt;</a></div>
<div id="calendar_next" class="floatright"><a href="#" onclick="showcalendar('<?=$nextmonth?>'); this.blur(); return false;">&gt;&gt;</a></div>
<span id="thecalendar_year"><?=$year?></span>�� <span id="thecalendar_month"><?=$month?></span>��
<ul>
<li class="calendarli calendarweek">��</li>
<li class="calendarli calendarweek">һ</li>
<li class="calendarli calendarweek">��</li>
<li class="calendarli calendarweek">��</li>
<li class="calendarli calendarweek">��</li>
<li class="calendarli calendarweek">��</li>
<li class="calendarli calendarweek">��</li>	
<?php echo str_repeat('<li class="calendarblank">&nbsp;</li>', $week) ?>
<?php if(is_array($days)) { foreach($days as $key => $value) { ?>		
<?php if($value['count']) { ?>		
<li class="calendarli <?=$value['class']?>" onmouseover="$('day_<?=$key?>').style.display='block';" onmouseout="$('day_<?=$key?>').style.display='none';">
<a href="<?=$url?>&date=<?=$year?>-<?=$month?>-<?=$key?>"><?=$key?></a>
<div class="dayevents" id="day_<?=$key?>" style="display:none;">
<ul class="news_list">
<?php if(is_array($value['events'])) { foreach($value['events'] as $event) { ?>
<li class="dayeventsli"><a href="space.php?do=event&id=<?=$event['eventid']?>"><?=$event['title']?></a></li>
<?php } } ?>
</ul>
</div>
</li>
<?php } else { ?>
<li class="calendarli"><?=$key?></li>
<?php } ?>
<?php } } ?>
</ol>
</div>
<?php } elseif($op == "invite") { ?>
<?php if($event['grade'] == -2) { ?>
<div id="content">
<p>�����ڲ��ܸ����ѷ������룬��Ϊ�˻�Ѿ��رա�</p>
</div>
<?php } elseif($event['grade'] <= 0) { ?>	
<div id="content">
<p>�����ڲ��ܸ����ѷ������룬��Ϊ���δͨ����ˡ�</p>
</div>
<?php } elseif($_SGLOBAL['timestamp'] > $event['deadline']) { ?>
<div id="content">
<p>�����ڲ��ܸ����ѷ������룬��Ϊ��Ѿ���ֹ�����ˡ�</p>
</div>
<?php } elseif($event['limitnum']>0 && $event['limitnum']<=$event['membernum']) { ?>
<div id="content">
<p>�����ڲ��ܸ����ѷ������룬��Ϊ�����������</p>
</div>
<?php } else { ?>
<div id="content" style="width: 640px;">
<form id="edit_form" name="edit_form" class="c_form" method="post" action="cp.php?ac=event&op=invite&id=<?=$event['eventid']?>&group=<?=$_GET['group']?>&page=<?=$page?>">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<div class="h_status">
�����Ը�δ���뱾��ĺ����Ƿ������롣
</div>
<div class="h_status">
<?php if($list) { ?>
<ul class="avatar_list">
<?php if(is_array($list)) { foreach($list as $value) { ?>
<li><div class="avatar48"><a href="space.php?uid=<?=$value['fuid']?>" title="<?=$_SN[$value['fuid']]?>"><?php echo avatar($value[fuid],small); ?></a></div>
<p>
<a href="space.php?uid=<?=$value['fuid']?>" title="<?=$_SN[$value['fuid']]?>"><?=$_SN[$value['fuid']]?></a>
</p>
<p><?php if(empty($joins[$value['fuid']])) { ?><input type="hidden" name="names[]" value="<?=$value['fusername']?>"><input type="checkbox" name="ids[]" value="<?=$value['fuid']?>">ѡ��<?php } else { ?>������<?php } ?></p>
</li>
<?php } } ?>
</ul>
<div class="page"><?=$multi?></div>
<?php } else { ?>
<div class="c_form">��û�к��ѡ�</div>
<?php } ?>
</div>
<p>
<input type="checkbox" id="chkall" name="chkall" onclick="checkAll(this.form, 'ids')"><label for="chkall">ȫѡ</label> &nbsp;
<input type="hidden" name="invitesubmit" value="1" />
<input type="submit" name="bnt_invitesubmit" value="����" class="submit" />
</p>
</form>
</div>
<div id="sidebar" style="width: 150px;">
<div class="cat">
<h3>���ѷ���</h3>
<ul class="post_list line_list">
<li<?php if($_GET['group']==-1) { ?> class="current"<?php } ?>><a href="cp.php?ac=event&id=<?=$eventid?>&op=invite&group=-1">ȫ������</a></li>
<?php if(is_array($groups)) { foreach($groups as $key => $value) { ?>
<li<?php if($_GET['group']==$key) { ?> class="current"<?php } ?>><a href="cp.php?ac=event&id=<?=$eventid?>&op=invite&group=<?=$key?>"><?=$value?></a></li>
<?php } } ?>
</ul>
</div>
</div>
<?php } ?>
<?php } elseif($op == "members") { ?>
<div id="content" style="width: 640px;">
<form id="edit_form" name="edit_form" class="c_form" method="post" action="cp.php?ac=event&op=members&status=<?=$_GET['status']?>&id=<?=$event['eventid']?>">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />	
<div class="h_status">
ѡ����Ӧ���û������û�״̬�����
<?php if($event['limitnum']) { ?><span style="color:#f00">ʣ�� <?php echo $event[limitnum]-$event[membernum] ?>  �����Ա����</span><?php } ?>
</div>	
<div class="h_status">
<?php if($list) { ?>
<table >
<tbody>
<?php if(is_array($list)) { foreach($list as $value) { ?>
<tr>
<td width="40"><input type="checkbox" name="ids[]" value="<?=$value['uid']?>"></td>
<td width="80">
<div><a href="space.php?uid=<?=$value['uid']?>" target="_blank"><?php echo avatar($value[uid],small); ?></a></div>
<p><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a></p>
</td>
<td>
<?php if($event['allowfellow']) { ?><h2>Я��������<?php echo intval($value[fellow]) ?></h2><?php } ?>
<?php if($event['template']) { ?>
<h2>������Ϣ��</h2>
<p><?php echo nl2br(htmlspecialchars($value[template])) ?></p>
<?php } ?>
</td>
</tr>
<?php } } ?>
</tbody>
</table>
<div class="page"><?=$multi?></div>
<?php } else { ?>
<div class="c_form">��û����س�Ա��</div>
<?php } ?>
</div>
<p>
<input type="checkbox" id="chkall" name="chkall" onclick="checkAll(this.form, 'ids')"><label for="chkall">ȫѡ</label> &nbsp;
��Ϊ��
<select name="status">
<option value="2">��ͨ��Ա</option>
<?php if($_SGLOBAL['supe_uid']==$event['uid']) { ?>
<option value="3">��֯��</option>
<?php } ?>
<?php if($event['verify']) { ?>
<option value="0">�����</option>
<?php } ?>
<option value="-1">�߳���Ա</option>
</select>
<input type="submit" name="memberssubmit" value="�ύ" class="submit" />
</p>
</form>
</div>

<div id="sidebar" style="width: 150px;">
<div class="cat">
<h3>��Ա״̬</h3>
<ul class="post_list line_list">
<li<?php if($_GET['status']==0) { ?> class="current"<?php } ?>><a href="cp.php?ac=event&op=members&id=<?=$eventid?>&status=0">�����</a></li>
<li<?php if($_GET['status']==2) { ?> class="current"<?php } ?>><a href="cp.php?ac=event&op=members&id=<?=$eventid?>&status=2">��ͨ��Ա</a></li>
<li<?php if($_GET['status']==3) { ?> class="current"<?php } ?>><a href="cp.php?ac=event&op=members&id=<?=$eventid?>&status=3">��֯��</a></li>
</ul>
</div>
</div>
<?php } elseif($op == "thread") { ?>
<div id="d_edit_form">
<form id="edit_form" name="edit_form" class="c_form" method="post" action="cp.php?ac=event&op=thread&id=<?=$event['eventid']?>" onsubmit="return confirm('�˲������ɻָ���ȷ����?')">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<?php if($threadlist) { ?>
<div class="topic_list">
<table cellspacing="0" cellpadding="0">
<thead>
<tr>
<td width="30">ѡ��</td>
<td class="subject">����</td>
<td class="author">���� (��Ӧ/�Ķ�)</td>
<td class="lastpost">������</td>
</tr>
</thead>
<tbody>
<?php if(is_array($threadlist)) { foreach($threadlist as $key => $value) { ?>
<tr <?php if($key%2==1) { ?>class="alt"<?php } ?>>
<td>
<input type="checkbox" name="ids[]" value="<?=$value['tid']?>" />
</td>
<td class="subject">
<a href="space.php?uid=<?=$value['uid']?>&do=thread&id=<?=$value['tid']?>&eventid=<?=$eventid?>"><?=$value['subject']?></a>
</td>
<td class="author"><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a><br><em><?=$value['replynum']?>/<?=$value['viewnum']?></em></td>
<td class="lastpost"><a href="space.php?uid=<?=$value['lastauthorid']?>" title="<?=$_SN[$value['lastauthorid']]?>"><?=$_SN[$value['lastauthorid']]?></a><br><?php echo sgmdate('m-d H:i',$value[lastpost],1); ?></td>
</tr>
<?php } } ?>
</tbody>
</table>
<p>
<input type="checkbox" id="chkall" name="chkall" onclick="checkAll(this.form, 'ids')"><label for="chkall">ȫѡ</label> &nbsp;
<input type="submit" name="delthreadsubmit" value="ɾ��" class="submit" />
</p>
</div>
<?php } else { ?>
<div class="c_form" style="text-align:center;">��û����ػ��⡣</div>
<?php } ?>
</form>
</div>

<?php } elseif($op == 'edithot') { ?>

<h1>�����ȶ�</h1>
<a href="javascript:hideMenu();" class="float_del" title="�ر�">�ر�</a>
<div class="popupmenu_inner">
<form method="post" action="cp.php?ac=event&op=edithot&id=<?=$eventid?>">
<p class="btn_line">
�µ��ȶȣ�<input type="text" name="hot" value="<?=$event['hot']?>" size="5"> 
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>" />
<input type="hidden" name="hotsubmit" value="true" />
<input type="submit" name="btnsubmit" value="ȷ��" class="submit" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>

<?php } elseif($op == "pic") { ?>
<div id="d_edit_form">
<form id="edit_form" name="edit_form" class="c_form" method="post" action="cp.php?ac=event&op=pic&id=<?=$event['eventid']?>" onsubmit="return confirm('�˲������ɻָ���ȷ����?')">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<div id="album" class="article">
<?php if(sizeof($photolist) > 0) { ?>
<table width="100%" cellspacing="6" cellpadding="0" class="photo_list">
<tbody>
<tr>
<?php if(is_array($photolist)) { foreach($photolist as $key => $value) { ?>
<td>
<a href="space.php?do=event&id=<?=$eventid?>&view=pic&picid=<?=$value['picid']?>"><img src="<?=$value['pic']?>" alt="<?=$value['title']?>" /></a>
<br />
<input type="checkbox" value="<?=$value['picid']?>" name="ids[]"/>ѡ��
</td>
<?php if($key%4==3) { ?></tr><tr><?php } ?>
<?php } } ?>
</tr>
</tbody>
</table>
<div class="page"><?=$multi?></div>
<p>
<input type="checkbox" id="chkall" name="chkall" onclick="checkAll(this.form, 'ids')"><label for="chkall">ȫѡ</label> &nbsp;
<input type="submit" name="deletepicsubmit" value="ɾ��ѡ��" class="submit" />
</p>
<?php } else { ?>
<p align="center">��û�л��Ƭ</p>
<?php } ?>
</div>
</form>
</div>
<?php } elseif($op == "eventinvite") { ?>
<div class="h_status">
���ĺ����������������»
<?php if(!empty($eventinvites)) { ?>
<span class="pipe">|</span>
<a href="cp.php?ac=event&op=eventinvite&&r=1"><span>������������</span></a>
<?php } ?>
</div>

<div class="c_form">
<?php if(!empty($eventinvites)) { ?>
<table cellspacing="4" cellpadding="4" class="formtable">
<?php if(is_array($eventinvites)) { foreach($eventinvites as $value) { ?>
<tr>
<td width="100px">
<div>
<a href="space.php?do=event&id=<?=$value['eventid']?>" target="_blank">
<img src="<?=$value['pic']?>" alt="<?=$value['title']?>" class="poster_pre">
</a>
</div>
</td>
<td class="h_status">
<p><a href="space.php?do=event&id=<?=$value['eventid']?>" target="_blank" style="font-size:14px;font-weight:bold;">
<?=$value['title']?></a></p>
<br>�ʱ�䣺<?php echo sgmdate("n��d�� G:i", $value[starttime]) ?> - <?php echo sgmdate("n��d�� G:i", $value[endtime]) ?>
<?php if($value['endtime']<$_SGLOBAL['timestamp']) { ?>
<span class="event_state"> �ѽ���</span>
<?php } elseif($value['deadline']<$_SGLOBAL['timestamp']) { ?>
<span class="event_state"> ������ֹ</span>
<?php } ?>
<br>��ص㣺<?=$value['province']?> - <?=$value['city']?> <?=$value['location']?>
<br>�����ˣ�<a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a>
<div id="eventinvite_<?=$value['eventid']?>" style="padding:0.5em 0 0.5em 0;">
������ѣ�<a href="space.php?uid=<?=$value['uid']?>" target="_blank"><?=$_SN[$value['uid']]?></a>
<br>����ʱ�䣺<?php echo sgmdate('Y-m-d H:i', $value[invitetime], 1) ?>
<p style="padding:1em 0 0 0;">
<a id="a_accept" href="cp.php?ac=event&op=acceptinvite&id=<?=$value['eventid']?>" class="submit" onclick="ajaxget(this.href, 'eventinvite_<?=$value['eventid']?>'); return false;">��������</a>
<a href="cp.php?ac=event&op=eventinvite&id=<?=$value['eventid']?>&r=1" class="button">����</a>
</p>
</div>
</td>
</tr>
<?php } } ?>
</table>
<?php } else { ?>
��ʱû���µĻ���롣
<?php } ?>
</div>
<?php } else { ?>

<?php if($topic) { ?>
<h2 class="title">
<img src="image/app/topic.gif" />���� - <a href="space.php?do=topic&topicid=<?=$topicid?>"><?=$topic['subject']?></a>
</h2>
<div class="tabs_header">
<ul class="tabs">
<li class="active"><a href="javascript:;"><span>�ո�����</span></a></li>
<li><a href="space.php?do=topic&topicid=<?=$topicid?>"><span>�鿴����</span></a></li>
</ul>
<?php if(checkperm('managetopic') || $topic['uid']==$_SGLOBAL['supe_uid']) { ?>
<div class="r_option">
<a href="cp.php?ac=topic&op=edit&topicid=<?=$topic['topicid']?>">�༭</a> | 
<a href="cp.php?ac=topic&op=delete&topicid=<?=$topic['topicid']?>" id="a_delete_<?=$topic['topicid']?>" onclick="ajaxmenu(event,this.id);">ɾ��</a>
</p>
</div>
<?php } ?>
</div>


<div class="affiche">
<table width="100%">
<tr>
<?php if($topic['pic']) { ?>
<td width="160" id="event_icon" valign="top">
<img src="<?=$topic['pic']?>" width="150">
</td>
<?php } ?>
<td valign="top">
<h2>
<a href="space.php?do=topic&topicid=<?=$topic['topicid']?>"><?=$topic['subject']?></a>
</h2>

<div style="padding:5px 0;"><?=$topic['message']?></div>
<ul>
<li class="gray">��������: <a href="space.php?uid=<?=$topic['uid']?>"><?=$_SN[$topic['uid']]?></a></li>
<li class="gray">����ʱ��: <?=$topic['dateline']?></li>
<?php if($topic['endtime']) { ?><li class="gray">�����ֹ: <?=$topic['endtime']?></li><?php } ?>
<?php if($topic['joinnum']) { ?>
<li class="gray">�����˴�: <?=$topic['joinnum']?></li>
<?php } ?>
<li class="gray">������: <?=$topic['lastpost']?></li>
</ul>

<?php if($topic['allowjoin']) { ?>
<a href="<?=$topic['joinurl']?>" class="feed_po" id="hot_add" onmouseover="showMenu(this.id)">�ո�����</a>
<ul id="hot_add_menu" class="dropmenu_drop" style="display:none;">
<?php if(in_array('blog', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=blog&topicid=<?=$topicid?>">������־</a></li>
<?php } ?>
<?php if(in_array('pic', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=upload&topicid=<?=$topicid?>">�ϴ�ͼƬ</a></li>
<?php } ?>
<?php if(in_array('thread', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=thread&topicid=<?=$topicid?>">������</a></li>
<?php } ?>
<?php if(in_array('poll', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=poll&topicid=<?=$topicid?>">����ͶƱ</a></li>
<?php } ?>
<?php if(in_array('event', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=event&topicid=<?=$topicid?>">����</a></li>
<?php } ?>
<?php if(in_array('share', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=share&topicid=<?=$topicid?>">��ӷ���</a></li>
<?php } ?>
</ul>
<?php } else { ?>
<p class="r_option">�������Ѿ���ֹ</p>
<?php } ?>
</td>
</tr></table>
</div>

<?php } ?>

<div class="c_form">
<form id="edit_form" name="edit_form" method="post" enctype="multipart/form-data" action="cp.php?ac=event&op=edit&id=<?=$eventid?>">
<table class="infotable" width="100%" cellspacing="4" cellpadding="4">				
<tbody>					
<tr>
<th>����� *</th>
<td>
<input class="t_input" id="title" name="title" value="<?=$event['title']?>" size="56" type="text" maxlength="80">
</td>
</tr>
<tr>
<th>����� *</th>
<td id="citybox">
<script type="text/javascript" src="source/script_city.js" charset="<?=$_SC['charset']?>"></script>
                            <script type="text/javascript" charset="<?=$_SC['charset']?>">
showprovince('province', 'city', '<?=$event['province']?>', 'citybox');
                                showcity('city', '<?=$event['city']?>', 'province', 'citybox');
                            </script>
</td>
</tr>
<tr>
<th>��ص�</th>
<td>
<input class="t_input" id="location" name="location" value="<?=$event['location']?>" size="56" type="text" maxlength="80">
</td>
</tr>
<tr>
<th>�ʱ�� *</th>
<td>
<script type="text/javascript" src="source/script_calendar.js" charset="<?=$_SC['charset']?>"></script>
<input type="text" name="starttime" id="starttime" value="<?php echo sgmdate('Y-m-d H:i', $event[starttime]) ?>"  onclick="showcalendar(event,this,1,'<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp]) ?>', '<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp] + 3600 * 24 * 60) ?>')" />
 ��
<input type="text" name="endtime" id="endtime" value="<?php echo sgmdate('Y-m-d H:i', $event[endtime]) ?>"  onclick="showcalendar(event,this,1,'<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp]) ?>', '<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp] + 3600 * 24 * 60) ?>')" />
</td>
</tr>
<tr>
<th>������ֹ *</th>
<td>
<input type="text" name="deadline" id="deadline" value="<?php echo sgmdate('Y-m-d H:i', $event[deadline]) ?>"  onclick="showcalendar(event,this,1,'<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp]) ?>', '<?php echo sgmdate('Y-m-d H:i', $_SGLOBAL[timestamp] + 3600 * 24 * 60) ?>')" />
</td>
</tr>
<tr>
<th width="100" style="vertical-align: top;">����� *</th>
<td>
<select name="classid" id="classid" onchange="reset_eventclass(this.value)">
<option value="-1">
��ѡ������
</option>
<?php if(is_array($_SGLOBAL['eventclass'])) { foreach($_SGLOBAL['eventclass'] as $key => $value) { ?>
<option value="<?=$key?>" <?php if($event['classid'] == $key) { ?> selected<?php } ?> ><?=$value['classname']?></option>
<?php } } ?>
</select>
<div id="classid_info"></div>
</td>
</tr>
<tr>
<td colspan="2">
<a id="doodleBox" href="magic.php?mid=doodle&showid=blog_doodle&target=uchome-ttHtmlEditor&from=editor" style="display:none"></a>
<textarea class="userData" name="detail" id="uchome-ttHtmlEditor" style="height:100%;width:100%;display:none;border:0px"><?=$event['detail']?></textarea>
<iframe src="editor.php?charset=<?=$_SC['charset']?>&allowhtml=0&doodle=<?php if(isset($_SGLOBAL['magic']['doodle'])) { ?>1<?php } ?>" name="uchome-ifrHtmlEditor" id="uchome-ifrHtmlEditor" scrolling="no" border="0" frameborder="0" style="width:100%;border: 1px solid #C5C5C5;" height="400"></iframe></td>
</tr>
<tr>
<th style="vertical-align: top;">�����</th>
<td>
<input type="file" name="poster" /> ͼƬ���ϴ�������Ĭ����ᡣ<br />
<input type="checkbox" id="sharepic" name="sharepic" value="1" />
<label for="sharepic">ͬʱ�Ѻ�����������</label>
</td>
</tr>
<?php if($mtags) { ?>
<tr>
<th>����Ⱥ��</th>
<td>
<select name="tagid">
<option value="">ѡ�����Ⱥ��</option>
<?php if(is_array($mtags)) { foreach($mtags as $value) { ?>
<option value="<?=$value['tagid']?>" <?php if($value['tagid']==$event['tagid']) { ?>selected<?php } ?> ><?=$value['tagname']?></option>
<?php } } ?>
</select>
���������Լ�������Ⱥ�飬�����������ͬ������Ⱥ�顣
</td>
</tr>
<?php } ?>
</tbody>
</table>
<table class="infotable" width="100%" cellspacing="4" cellpadding="4">
<tbody>
<tr>
<td colspan="2">
<a id="toggle_advanced" href="#" onclick="toggle_advanced(); this.blur(); return false;">
չ���߼�����</a>						
</td>
</tr>
</tbody>
</table>
<table id="advanced_info" class="infotable" width="100%" cellspacing="4" cellpadding="4" style="display:none">
<tbody>
<tr>
<th width="100">�����</th>
<td>
<input name="limitnum" value="<?=$event['limitnum']?>" id="limitnum" type="text" size="4" maxlength="8">
                            <span class="tiptext">
                                ��μ��������ƣ���Ϊ 0 ��ʾ�����ơ�
                            </span>
</td>
</tr>
<tr>
<th width="100" style="vertical-align: top;">���˽</th>
<td>
<select name="public" id="public">
<option <?php if($event['public']==2) { ?>selected="selected"<?php } ?> value="2">������������˿ɼ��ɼ���</option>
<option <?php if($event['public']==1) { ?>selected="selected"<?php } ?> value="1">�빫����������˿ɼ�, ������ܼ���</option>
<option <?php if($event['public']==0) { ?>selected="selected"<?php } ?> value="0">˽�ܻ���������߿ɼ�</option>
</select>
</td>
</tr>
<tr>
<th width="100" style="vertical-align: top;">�ѡ��</th>
<td>
<input name="allowinvite" id="allowinvite" value="1" type="checkbox"<?php if($event['allowinvite']) { ?> checked="checked"<?php } ?>>
                            <label for="allowinvite">
                                ���������������ѣ��������߼�������Ҫ���
                            </label>
                            <br>
<input name="allowpic" id="allowpic" value="1" type="checkbox"<?php if($event['allowpic']) { ?> checked="checked"<?php } ?>>
                            <label for="allowpic">
                                ��������߹�����Ƭ
                            </label>
                            <br>
<input name="allowpost" id="allowpost" value="1" type="checkbox"<?php if($event['allowpost']) { ?> checked="checked"<?php } ?>>
                            <label for="allowpost">
                                ���������˷�������
                            </label>
                            <br>
                            <input name="verify" id="verify" value="1" type="checkbox"<?php if($event['verify']) { ?> checked="checked"<?php } ?>>
                            <label for="verify">
                                �μӻ��Ҫ����
                            </label>
<br>
                            <input name="allowfellow" id="allowfellow" value="1" type="checkbox"<?php if($event['allowfellow']) { ?> checked="checked"<?php } ?>>
                            <label for="allowfellow">
                                ����μ���Я�����ѣ�Я����������ռ�û����������
                            </label>
</td>
</tr>
<tr>
<th width="100" style="vertical-align: top;">������Ϣ</th>
<td>
���Ҫ��μ�����д������Ϣ�����255���ַ�����������ڴ˴�����һ����ʽģ�塣���ձ�ʾ��Ҫ����д��<br />
                            <textarea id="template" name="template" rows="4" cols="72"><?=$event['template']?></textarea>
</td>
</tr>
</tr>
</tbody>
</table>
<?php if(checkperm('seccode')) { ?>
<table class="infotable" width="100%" cellspacing="4" cellpadding="4">
<tbody>
<?php if($_SCONFIG['questionmode']) { ?>
<tr>
<th width="100" style="vertical-align: top;">��ش���֤����</th>
<td>
<p><?php question(); ?></p>
<input type="text" id="seccode" name="seccode" value="" size="15" class="t_input" />
</td>
</tr>
<?php } else { ?>
<tr>
<th width="100" style="vertical-align: top;">����д��֤��</th>
<td>
<script type="text/javascript" charset="<?=$_SC['charset']?>">seccode();</script>
<p>�����������4λ��ĸ�����֣��������<a href="javascript:updateseccode()">����һ��</a></p>
<input type="text" id="seccode" name="seccode" value="" size="15" class="t_input" />
</td>
</tr>
<?php } ?>
</tbody>
</table>
<?php } ?>
<table class="infotable" width="100%" cellspacing="4" cellpadding="4">
<tbody>
<?php if(empty($eventid)) { ?>
<tr>
<th width="100">��̬ѡ��</th>
<td>
<input type="checkbox" name="makefeed" id="makefeed" value="1"<?php if(ckprivacy('event', 1)) { ?> checked<?php } ?>> ������̬ (<a href="cp.php?ac=privacy#feed" target="_blank">����Ĭ������</a>)
</td>
</tr>
<?php } ?>
<tr>
<th width="100">&nbsp;</th>
<td>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
                            <input type="hidden" name="topicid" value="<?=$topicid?>" />
                            <input type="hidden" name="eventsubmit" value="1" />
                            <input class="submit" value="<?php if($_GET['id']) { ?>����<?php } else { ?>�ύ<?php } ?>" type="button" onclick="check_eventpost()"/>
</td>
</tr>
</tbody>
</table>
</form>
</div>

<script type="text/javascript" src="image/editor/editor_function.js" charset="<?=$_SC['charset']?>"></script>
<script type="text/javascript" charset="<?=$_SC['charset']?>">
//�����
var eventclass = [];
<?php if(is_array($_SGLOBAL['eventclass'])) { foreach($_SGLOBAL['eventclass'] as $key => $value) { ?>
eventclass["<?=$key?>"] = {};
<?php if(is_array($value)) { foreach($value as $k => $v) { ?>
eventclass["<?=$key?>"]["<?=$k?>"] = '<?php echo str_replace(array("\r\n","\r","\n"), "<br>", $v) ?>';
<?php } } ?>
<?php } } ?>
function reset_eventclass(classid){
var selclass = eventclass[classid];
var o = $("uchome-ifrHtmlEditor").contentWindow.document.getElementById("HtmlEditor").contentWindow.document.body;
var append =false;// �Ƿ����
if(selclass && selclass['template'] && (trim(o.innerHTML.replace(/<br[ \/]*>|<div><\/div>/img, '')) == "" || confirm("Ҫ���վ���趨�Ļ����ģ�嵽�������"))){
append = true;
}
if (append){
o.innerHTML = selclass['template'] + "<br/>" + o.innerHTML;				
$("classid_info").innerHTML = "��ο�վ���趨��ģ����д�����";				
}
}

//չ���߼�����
function toggle_advanced(){
var el = $("advanced_info");
if (el.style.display == "none"){
el.style.display = "";
$("toggle_advanced").innerHTML = "���ظ߼�����";
} else {
el.style.display = "none";
$("toggle_advanced").innerHTML = "չ���߼�����";
}
}

//����ύ
function check_eventpost(){			
// �����
if (parseInt($("classid").value) < 0){
alert("����ͱ���ѡ��");
$("classid").focus();
return false;
}	
// ����
var val = trim($("title").value);
if ( val == "" ){
alert("����ⲻ��Ϊ�գ�");
$("title").focus();
return false;
} else if (val.replace(/[^\x00-\xff]/g, "**").length > 80){
alert("�����̫������������80���ַ��ڣ�");
$("title").focus();
return false;
}	
// ��ص�
if($('city').value == ""){
alert("��ٰ���в���Ϊ�ա�");
$("city").focus();
return false;
}			
// ����ʱ�䣬��ʼ-����ʱ��
var deadline = parsedate($("deadline").value).getTime();
var starttime = parsedate($("starttime").value).getTime();
var endtime = parsedate($("endtime").value).getTime();
<?php if(!$eventid) { ?>
var nowtime = new Date().getTime();
if (starttime < nowtime){
alert("���ʼʱ�䲻���������ڡ�");
$("starttime").focus();
return false;
}
<?php } ?>
if (endtime - deadline < 0){
alert("������ֹʱ�䲻�����ڻ����ʱ�䡣");
$("deadline").focus();
return false;
}
if (endtime - starttime < 0){
alert("�����ʱ�䲻�����ڿ�ʼʱ�䡣");
$("endtime").focus();
return false;
}
if (endtime - starttime > 60 * 24 * 3600 * 1000){
alert("�����ʱ�䲻�ܳ��� 60 �졣");
$("endtime").focus();
return false;
}
// ��������
if (! /^[0-9]{1,8}$/.test($("limitnum").value)){
alert("��������벻��ȷ��");
$("limitnum").focus();
return false;
}

    var makefeed = $('makefeed');
    if(makefeed) {
    	if(makefeed.checked == false) {
    		if(!confirm("�������ѣ���ȷ���˴η�����������̬��\n���˶�̬�����Ѳ��ܼ�ʱ������ĸ��¡�")) {
    			return false;
    		}
    	}
    }
    
    // �༭������ͬ��
edit_save();
// �������Ĭ�Ͽ�����һ��<br/>��<div></div>����Ҫȥ�����ж�
val = trim($("uchome-ttHtmlEditor").value.replace(/<br[ \/]*>|<div><\/div>/img,''));
if (val == ""){
alert("���������Ϊ�ա�");
return false;
}						
//��֤��
if($('seccode')) {
var code = $('seccode').value;
var x = new Ajax();
x.get('cp.php?ac=common&op=seccode&code=' + code, function(s){
s = trim(s);
if(s.indexOf('succeed') == -1) {
alert(s);
$('seccode').focus();
           		return false;
} else {
$("edit_form").submit();
}
});
    } else {
    	$("edit_form").submit();
    }
}
</script>
<?php } ?>
<?php if(in_array($op,array("edit", "pic", "thread", "members", "comment", "invite", "eventinvite"))) { ?>
<!--//����ҳ��ҳβ//-->
</div>
<?php } ?>
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