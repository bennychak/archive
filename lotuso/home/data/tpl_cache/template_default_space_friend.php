<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_friend|template/default/header|template/default/space_menu|template/default/space_list|template/default/footer', '1283180474', 'template/default/space_friend');?><?php $_TPL['titles'] = array('����'); ?>
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


<?php if(!empty($_SGLOBAL['inajax'])) { ?>
<div id="space_friend">
<h3 class="feed_header">
<a href="cp.php?ac=friend&op=search" class="r_option" target="_blank">Ѱ�Һ���</a>
����(�� <?=$count?> ��)
</h3><br>

<?php if($list) { ?>
<div id="friend_ul">
<ul class="line_list">
<?php if(is_array($list)) { foreach($list as $key => $value) { ?>
<li>
<table width="100%">
<tr>
<td width="70">
<div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div>
</td>
<td>
<div class="thumbTitle"><p<?php if($ols[$value['uid']]) { ?> class="online_icon_p"<?php } ?>><a href="space.php?uid=<?=$value['uid']?>"<?php g_color($value[groupid]); ?>><?=$_SN[$value['uid']]?></a> <?php g_icon($value[groupid]); ?></p></div>

<?php if($value['note']) { ?><div><?=$value['note']?></div><?php } ?>

<?php if($ols[$value['uid']]) { ?><div class="gray"><?php echo sgmdate('H:i',$ols[$value[uid]],1); ?></div><?php } ?>
<div class="setti">

<?php if(!$value['isfriend']) { ?>
<a href="cp.php?ac=friend&op=add&uid=<?=$value['uid']?>" id="a_friend_<?=$key?>" onclick="ajaxmenu(event, this.id, 1)">��Ϊ����</a>
<?php } ?>
</div>
</td></tr></table>
</li>
<?php } } ?>
</ul>
</div>
<div class="page"><?=$multi?></div>

<?php } else { ?>
<div class="c_form">
û������û��б�
</div>
<?php } ?>
</div><br />

<?php } else { ?>

<?php if($space['self']) { ?>
<div class="searchbar floatright">
<?php if($_GET['view']=='me') { ?>
<form method="get" action="space.php">
<input type="hidden" name="do" value="friend">
<input name="searchkey" value="" size="15" class="t_input" type="text">
<input name="searchsubmit" value="�Һ���" class="submit" type="submit">
<input type="hidden" name="searchmode" value="1" />
</form>
<?php } else { ?>
<form method="get" action="cp.php">
<input type="hidden" name="ac" value="friend" />
<input type="hidden" name="op" value="search" />
<input name="searchkey" value="" size="15" class="t_input" type="text">
<input name="searchsubmit" value="����" class="submit" type="submit">
<input type="hidden" name="searchmode" value="1" />
</form>
<?php } ?>
</div>
<h2 class="title"><img src="image/icon/friend.gif" />����</h2>
<div class="tabs_header">
<ul class="tabs">
<li<?=$actives['me']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend"><span>�����б�</span></a></li>
<li><a href="cp.php?ac=friend&op=search"><span>���Һ���</span></a></li>
<li><a href="cp.php?ac=friend&op=find"><span>������ʶ����</span></a></li>
<?php if(empty($_SCONFIG['closeinvite'])) { ?>
<li><a href="cp.php?ac=invite"><span>�������</span></a></li>
<?php } ?>
<li><a href="cp.php?ac=friend&op=request"><span>��������</span></a></li>
<li><a href="space.php?do=top"><span>���а�</span></a></li>
</ul>
</div>
<div id="content" style="width: 640px;">

<div class="c_mgs"><div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<?php if($_GET['view']=='blacklist') { ?>
���뵽���������û�����������ĺ����б���ɾ����ͬʱ���Է������ܽ���������صĴ��к�������־���Ӻ��ѡ����ۡ����ԡ�����Ϣ�Ȼ�����Ϊ��
<?php } elseif($_GET['view']=='me') { ?>

��ǰ���� <?=$space['friendnum']?> �����ѡ�


<?php if($maxfriendnum) { ?>
(��������� <?=$maxfriendnum?> ������)
<p>
<?php if($_SGLOBAL['magic']['friendnum']) { ?>
<img src="image/magic/friendnum.small.gif" class="magicicon" />
<a id="a_magic_friendnum" href="magic.php?mid=friendnum" onclick="ajaxmenu(event, this.id, 1)">��Ҫ���ݺ�����</a>
(�����Թ�����ߡ�<?=$_SGLOBAL['magic']['friendnum']?>�������ݣ����Լ�������Ӹ���ĺ��ѡ�)
<?php } ?>
</p>
<?php } ?>

<p style="padding-top:10px;">
�����б��պ����ȶȸߵ�����<br>
�����ȶ���ϵͳ�����������֮�佻���Ķ����Զ��ۼƵ�һ���ο�ֵ����ֵԽ�󣬱�ʾ������λ���ѻ���ԽƵ����
</p>
<?php } elseif($_GET['view']=='online') { ?>
<?php if($_GET['type'] == 'friend') { ?>
��Щ���ѵ�ǰ���ߣ��Ͽ�ȥ�ݷ�һ�°�
<?php } elseif($_GET['type']=='near') { ?>
ͨ��ϵͳƥ�䣬��Щ���Ѿ�������������������ʶ����
<?php } else { ?>
��ʾ��ǰȫ�����ߵ��û�
<?php } ?>
<?php } elseif($_GET['view']=='visitor') { ?>
���ǰݷù������ط�һ�°�
<?php } elseif($_GET['view']=='trace') { ?>
�������ݷù����û��б�
<?php } ?>
</div></div></div></div></div>

<?php if($_GET['view']=='blacklist') { ?>
<div class="h_status">
<h2>����º������û�</h2>
<form method="post" name="blackform" action="cp.php?ac=friend&op=blacklist&start=<?=$_GET['start']?>">
�û�����<input type="text" name="username" value="" size="15" class="t_input">
<input type="submit" name="blacklistsubmit_btn" id="moodsubmit_btn" value="���" class="submit">
<input type="hidden" name="blacklistsubmit" value="true" />
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>
<?php } ?>

<?php if($list) { ?>
<div class="thumb_list" id="friend_ul">
<ul>
<?php if(is_array($list)) { foreach($list as $key => $value) { ?>
<li id="friend_<?=$value['uid']?>_li">
<?php if($value['username'] == '') { ?>
<div class="avatar48"><img src="image/magic/hidden.gif" alt="����" /></div>
<div class="thumbTitle"><p>����</p></div>
<?php } else { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div>
<div class="thumbTitle">
<p<?php if($ols[$value['uid']]) { ?> class="online_icon_p"<?php } ?>>
<a href="space.php?uid=<?=$value['uid']?>"<?php g_color($value[groupid]); ?>><?=$_SN[$value['uid']]?></a> 
<?php g_icon($value[groupid]); ?>
<?php if($value['videostatus']) { ?>
<img src="image/videophoto.gif" align="absmiddle">
<?php } ?>
</p></div>
<?php if($value['note']) { ?><div><?=$value['note']?></div><?php } ?>
<?php } ?>

<?php if($_GET['view']=='blacklist') { ?>
<div class="gray"><a href="cp.php?ac=friend&op=blacklist&subop=delete&uid=<?=$value['uid']?>&start=<?=$_GET['start']?>">����������</a></div>
<?php } elseif($_GET['view']=='visitor' || $_GET['view'] == 'trace') { ?>
<div class="gray"><?php echo sgmdate('n��j��',$value[dateline],1); ?></div>
<?php } elseif($_GET['view']=='online') { ?>
<div class="gray"><?php echo sgmdate('H:i',$ols[$value[uid]],1); ?></div>
<?php } else { ?>
<?php if($ols[$value['uid']]) { ?><div class="gray"><?php echo sgmdate('H:i',$ols[$value[uid]],1); ?></div><?php } ?>
<div class="gray">
<?php if($value['num']) { ?><a href="cp.php?ac=friend&op=changenum&uid=<?=$value['uid']?>" id="friendnum_<?=$value['uid']?>" onclick="ajaxmenu(event, this.id)">�ȶ�(<span id="spannum_<?=$value['uid']?>"><?=$value['num']?></span>)</a><span class="pipe">|</span><?php } ?>
<?php if(!$value['isfriend']) { ?>
<a href="cp.php?ac=friend&op=add&uid=<?=$value['uid']?>" id="a_friend_<?=$key?>" onclick="ajaxmenu(event, this.id, 1)">��Ϊ����</a>
<?php } else { ?>
<a href="cp.php?ac=friend&op=changegroup&uid=<?=$value['uid']?>" id="friend_group_<?=$value['uid']?>" onclick="ajaxmenu(event, this.id)">����</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=ignore&uid=<?=$value['uid']?>" id="a_ignore_<?=$key?>" onclick="ajaxmenu(event, this.id)">ɾ��</a>
<?php } ?>
</div>
<?php } ?>
</li>
<?php } } ?>
</ul>
</div>
<div class="page"><?=$multi?></div>

<?php } else { ?>
<div class="c_form">
û������û��б�
</div>
<?php } ?>

</div>

<div id="sidebar" style="width: 150px;">
<?php if($_SCONFIG['my_status']) { ?>
<!-- ͬ��������Manyou ��ʼ -->
<script type="text/javascript">
function my_sync_tip(msg, close_time) {;
var my_tip = document.getElementById("my_tip");
if (!my_tip) {
my_tip = document.createElement("div");
document.getElementsByTagName("body")[0].appendChild(my_tip);
my_tip.id = "my_tip";
}
my_tip.style.display = 'block';
my_tip.innerHTML = '<div class="popupmenu_centerbox" style="position: absolute; top: 200px; right: 500px; padding: 20px; width: 300px; height: 15px; z-index:9999;">' + msg + '</div>';
if (close_time) {
setTimeout("document.getElementById('my_tip').style.display = 'none';", close_time);
}
}
function my_sync_friend() {
my_sync_tip('����ͬ��������Ϣ...', 0);
var my_scri = document.createElement("script");
document.getElementsByTagName("head")[0].appendChild(my_scri);
my_scri.charset = "UTF-8";
my_scri.src = "http://uchome.manyou.com/user/syncFriends?sId=<?=$_SCONFIG['my_siteid']?>&uUchId=<?=$space['uid']?>&ts=<?=$_SGLOBAL['timestamp']?>&key=<?php echo md5($_SCONFIG[my_siteid] . $_SCONFIG[my_sitekey] . $space[uid] . $_SGLOBAL[timestamp]); ?>";
}
</script>

<div class="c_mgs"><div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<p>����Ϸ���Ҳ����Լ��ĺ��ѣ���������ĵİ�ť����������Ϣͬ�������档</p>
<p style="text-align: center;padding: 20px 0 0;"> <a href="#" onclick="my_sync_friend(); return false;" title="�����ѹ�ϵͬ����Manyouƽ̨���Ա���Ӧ���￴������"><img alt="ˢ�º�����Ϣ" src="image/syncfriend.gif"/></a> </p>
</div></div></div></div></div>
<!-- ͬ��������Manyou ���� -->
<?php } ?>

<div class="cat">
<h3>
���Ѳ˵�
</h3>
<ul>
<li<?=$a_actives['me']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend">ȫ�������б�</a></li>
<li<?=$a_actives['onlinefriend']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend&view=online&type=friend">��ǰ���ߵĺ���</a></li>
<li<?=$a_actives['onlinenear']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend&view=online&type=near">�����Ҹ���������</a></li>
<li<?=$a_actives['visitor']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend&view=visitor">�ҵķÿ�</a></li>
<li<?=$a_actives['trace']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend&view=trace">�ҵ��㼣</a></li>
<li<?=$a_actives['blacklist']?>><a href="space.php?uid=<?=$space['uid']?>&do=friend&view=blacklist">�ҵĺ�����</a></li>
</ul>
</div>

<?php if($groups) { ?>
<div class="cat">
<h3>
<span class="r_option"><a href="cp.php?ac=friend&op=group">��������</a></span>
���ѷ���
</h3>
<ul class="post_list line_list">
<li><a href="space.php?do=friend&group=-1">ȫ������</a></li>
<?php if(is_array($groups)) { foreach($groups as $key => $value) { ?>
<li<?=$groupselect[$key]?>>
<a href="cp.php?ac=friend&op=groupignore&group=<?=$key?>" id="c_ignore_<?=$key?>" onclick="ajaxmenu(event, this.id)" title="�����û��鶯̬" class="c_delete">����</a>
<?php if($key) { ?>
<a href="cp.php?ac=friend&op=groupname&group=<?=$key?>" id="c_edit_<?=$key?>" onclick="ajaxmenu(event, this.id, 1)" title="�༭�û�����" class="c_edit">�༭</a>
<?php } ?>
<?php if(isset($space['privacy']['filter_gid'][$key])) { ?><span class="gray">[����]</span><?php } ?> <a href="space.php?do=friend&group=<?=$key?>"><span id="friend_groupname_<?=$key?>"><?=$value?></span></a>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

</div>


<?php } else { ?>
<?php $_TPL['spacetitle'] = "����";
	$_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=friend&view=me\">TA�ĺ����б�</a>"; ?>
<div class="c_header a_header">
<div class="avatar48"><a href="space.php?uid=<?=$space['uid']?>"><?php echo avatar($space[uid],small); ?></a></div>
<?php if($_SGLOBAL['refer']) { ?>
<a class="r_option" href="<?=$_SGLOBAL['refer']?>">&laquo; ������һҳ</a>
<?php } ?>
<p style="font-size:14px"><?=$_SN[$space['uid']]?>��<?=$_TPL['spacetitle']?></p>
<a href="space.php?uid=<?=$space['uid']?>" class="spacelink"><?=$_SN[$space['uid']]?>����ҳ</a>
<?php if($_TPL['spacemenus']) { ?>
<?php if(is_array($_TPL['spacemenus'])) { foreach($_TPL['spacemenus'] as $value) { ?> <span class="pipe">&raquo;</span> <?=$value?><?php } } ?>
<?php } ?>
</div>

<div class="h_status">���� <?=$space['friendnum']?> ������</div>
<div class="space_list">
<?php if($list) { ?>
<?php if(is_array($list)) { foreach($list as $key => $value) { ?>
<table cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="65"><div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div></td>
<td>
<h2>
<?php if($ols[$value['uid']]) { ?><img src="image/online_icon.gif" align="absmiddle"> <?php } ?>
<a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>"<?php g_color($value[groupid]); ?>><?=$_SN[$value['uid']]?></a>
<?php if($value['username'] && $_SN[$value['uid']]!=$value['username']) { ?><span class="gray">(<?=$value['username']?>)</span><?php } ?>
<?php g_icon($value[groupid]); ?>
<?php if($value['videostatus']) { ?>
<img src="image/videophoto.gif" align="absmiddle">
<?php } ?>
</h2>
<?php if($value['sex']==2) { ?><p>��Ů</p><?php } elseif($value['sex']==1) { ?><p>˧��</p><?php } ?></p>
<p>
<?php if($_GET['view']=='show') { ?>����<?php } ?>���֣�<?=$value['credit']?> / <?php if($value['experience']) { ?>���飺<?=$value['experience']?> / <?php } ?>������<?=$value['viewnum']?> / ���ѣ�<?=$value['friendnum']?></p>
<?php if($value['note']) { ?><?=$value['note']?><?php } ?>
</td>
<td width="100">
<ul class="line_list">
<li><a href="space.php?uid=<?=$value['uid']?>">ȥ������</a></li>
<li><a href="cp.php?ac=poke&op=send&uid=<?=$value['uid']?>" id="a_poke_<?=$key?>" onclick="ajaxmenu(event, this.id, 1)" title="���к�">����к�</a></li>
<?php if(isset($value['isfriend']) && !$value['isfriend']) { ?><li><a href="cp.php?ac=friend&op=add&uid=<?=$value['uid']?>" id="a_friend_<?=$key?>" onclick="ajaxmenu(event, this.id, 1)" title="�Ӻ���">��Ϊ����</a></li><?php } ?>	
</ul>
</td>
</tr>
</table>
<?php } } ?>
<div class="page"><?=$multi?></div>
<?php } else { ?>
<div class="c_form">û����س�Ա��</div>
<?php } ?>
</div>



<?php } ?>

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
<?php } ?>
<?php ob_out();?>