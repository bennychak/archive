<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('admin/tpl/index|admin/tpl/header|admin/tpl/side|admin/tpl/footer|template/default/header|template/default/footer', '1283180200', 'admin/tpl/index');?><?php $_TPL['menunames'] = array(
		'index' => '������ҳ',
		'config' => 'վ������',
		'privacy' => '��˽����',
		'usergroup' => '�û���',
		'credit' => '���ֹ���',
		'profilefield' => '�û���Ŀ',
		'profield' => 'Ⱥ����Ŀ',
		'eventclass' => '�����',
		'magic' => '��������',
		'task' => '�н�����',
		'spam' => '����ˮ����',
		'censor' => '��������',
		'ad' => '�������',
		'userapp' => 'MYOPӦ��',
		'app' => 'UCenterӦ��',
		'network' => '��㿴��',
		'cache' => '�������',
		'log' => 'ϵͳlog��¼',
		'space' => '�û�����',
		'feed' => '��̬(feed)',
		'share' => '����',
		'blog' => '��־',
		'album' => '���',
		'pic' => 'ͼƬ',
		'comment' => '����/����',
		'thread' => '����',
		'post' => '����',
		'doing' => '��¼',
		'tag' => '��ǩ',
		'mtag' => 'Ⱥ��',
		'poll' => 'ͶƱ',
		'event' => '�',
		'magiclog' => '���߼�¼',
		'report' => '�ٱ�',
		'block' => '���ݵ���',
		'template' => 'ģ��༭',
		'backup' => '���ݱ���',
		'stat' => 'ͳ�Ƹ���',
		'cron' => 'ϵͳ�ƻ�����',
		'click' => '��̬����',
		'ip' => '����IP����',
		'hotuser' => '�Ƽ���Ա����',
		'defaultuser' => 'Ĭ�Ϻ�������',
	); ?>
<?php $_TPL['nosidebar'] = 1; ?>
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


<style type="text/css">
@import url(admin/tpl/style.css);
</style>

<div id="cp_content">


<div class="mainarea">
<div class="maininner">
<?php if($menus['0']['config']) { ?>
<div class="bdrcontent">
<div class="title"><h3>��ӭ���ٹ���ƽ̨</h3></div>
<p>ͨ����¼����ƽ̨�������Զ�վ��Ĳ����������ã������Լ�ʱ��ȡ�ٷ��ĸ��¶�̬����Ҫ����ͨ�档</p>
</div>
<br />

<div class="bdrcontent">
<div class="title">
<h3>�ٷ����¶�̬</h3>
<p>�ٷ��°汾�ķ�������Ҫ�����������ȶ�̬��������������ʾ��</p>
</div>
<div id="customerinfor" style="line-height:1.5em;"></div>
<br />
<div class="title">
<h3>����֧�ַ���</h3>
<p>�������ʹ�����������⣬���Է������������������</p>
</div>
<ul class="listcol list2col">
<li><a href=http://www.discuz.net/index.php?gid=141 target="_blank">�ٷ�������̳</a></li>
<li><a href=http://www.comsenz.com/purchase/uchome target="_blank">Comsenz��ҵ֧�ַ���</a></li>
</ul>
</div>
<br />

<div class="bdrcontent">
<div class="title">
<h3>վ������ͳ��</h3>
<p>ͨ��վ��ͳ�ƣ��������������վ��ķ�չ״����</p>
<p>�������Բ鿴<a href="do.php?ac=stat" target="_blank">����ͳ��</a>������վ��ÿ�ձ仯��</p>
</div>
<ul class="listcol list2col">
<li>��ͨ�ռ���: <?=$statistics['spacenum']?> (<a href="do.php?ac=stat&type=login" target="_blank">����</a>)</li>
<li>ȫ����̬��: <?=$statistics['feednum']?></li>
<li>ȫ����־��: <?=$statistics['blognum']?> (<a href="do.php?ac=stat&type=blog" target="_blank">����</a>)</li>
<li>ȫ�������: <?=$statistics['albumnum']?> (<a href="do.php?ac=stat&type=pic" target="_blank">����</a>)</li>
<li>ȫ��������: <?=$statistics['sharenum']?> (<a href="do.php?ac=stat&type=share" target="_blank">����</a>)</li>
<li>ȫ��������: <?=$statistics['threadnum']?> (<a href="do.php?ac=stat&type=thread" target="_blank">����</a>)</li>
<li>ȫ��������: <?=$statistics['commentnum']?></li>
<li>����Ӧ����: <?=$statistics['myappnum']?></li>
</ul>
</div>
<br />

<div class="bdrcontent">
<div class="title"><h3>�������ݿ�/�汾</h3></div>
<ul>
<li>����ϵͳ: <?=$os?></li>
<li>���ݿ�汾: <?=$statistics['mysql']?></li>
<li>�ϴ����: <?=$fileupload?></li>
<li>���ݿ�ߴ�: <?=$dbsize?></li>
<li>�����ߴ�: <?=$attachsize?></li>
<li>��ǰ����汾: UCenter Home <?=$statistics['version']?> ( <?=$statistics['release']?> )</li>
<li>UCenter Client �汾: <?=UC_CLIENT_VERSION?> Release <?=UC_CLIENT_RELEASE?></li>
</ul>
</div>
<br />

<div class="bdrcontent">

<div class="title">
<h3>�����Ŷ�</h3>
</div>
<table>
<tr><td width="80">��Ȩ����</td><td><a  href="http://www.comsenz.com/" target="_blank">��ʢ����(����)�Ƽ����޹�˾ (Comsenz Inc.)</a></td></tr>
<tr><td>�ܲ߻�</td><td><a  href="http://www.discuz.net/space.php?uid=1" target="_blank">Kevin 'Crossday' Day</a>, <a  href="http://www.discuz.net/space.php?uid=174393" target="_blank">Guode 'Sup' Li</a></td></tr>
<tr><td>�����Ŷ�</td><td><a  href="http://www.discuz.net/space.php?uid=322293" target="_blank">Qingpeng 'Andy' Zheng</a>, <a  href="http://www.discuz.net/space.php?uid=248739" target="_blank">Jing 'Qiezi' Zou</a>, <a  href="http://www.discuz.net/space.php?uid=672953" target="_blank">Fei 'Fengshu' Zhao</a>, <a  href="http://www.discuz.net/space.php?uid=465273" target="_blank">Lijun 'Maple-x' Zhang</a>, <a  href="http://www.discuz.net/space.php?uid=679269" target="_blank">Lei 'Shitou' Zhao</a>, <a  href="http://www.discuz.net/space.php?uid=906359" target="_blank">Peng 'Dingusxp' Xu</a></td></tr>
<tr><td>�������</td><td><a  href="http://www.discuz.net/space.php?uid=294092" target="_blank">Fangming 'Lushnis' Li</a>, <a  href="http://www.discuz.net/space.php?uid=174393" target="_blank">Yulong 'Yulong' Li</a>, <a  href="http://www.discuz.net/space.php?uid=41050" target="_blank">Rujian 'С��' Mo</a></td></tr>
<tr><td>��˾��վ</td><td><a href=http://www.comsenz.com target="_blank">http://www.comsenz.com</a></td></tr>
<tr><td>��Ʒ��վ</td><td><a href=http://u.discuz.net target="_blank">http://u.discuz.net</a></td></tr>
</table>
</div>
<?php } else { ?>
<div class="bdrcontent">
<div class="title"><h3>��ӭ���ٹ���ƽ̨</h3></div>
<p>ͨ������ƽ̨����������ԶԷ�������Ϣ������������</p>

<br />
<div class="title"><h3>��ݹ���˵�</h3></div>
<ul class="listcol list2col">
<?php if($menus['1']['space']) { ?><li><a href="admincp.php?ac=space" style="font-weight:bold;">�û�</a><p>�༭�û��Ļ��֡��û��顢����ռ���Ϣ��ɾ���û�</p></li><?php } ?>
<li><a href="admincp.php?ac=feed" style="font-weight:bold;">�¼�</a><p>��"������ʲô"��������ɾ��</p></li>
<li><a href="admincp.php?ac=blog" style="font-weight:bold;">��־</a><p>����־��������ɾ�����༭</p></li>
<li><a href="admincp.php?ac=album" style="font-weight:bold;">���</a><p>�Է���������������ɾ��</p></li>
<li><a href="admincp.php?ac=pic" style="font-weight:bold;">ͼƬ</a><p>�Է�����ͼƬ��������ɾ��</p></li>
<li><a href="admincp.php?ac=comment" style="font-weight:bold;">����</a><p>�Է��������۽�������ɾ��</p></li>
<li><a href="admincp.php?ac=thread" style="font-weight:bold;">����</a><p>��Ⱥ�����淢���Ļ����������ɾ�����������ö�</p></li>
<li><a href="admincp.php?ac=post" style="font-weight:bold;">����</a><p>��Ⱥ�����淢���Ļ�����������ɾ��</p></li>
<li><a href="admincp.php?ac=poll" style="font-weight:bold;">ͶƱ</a><p>��ͶƱ��������ɾ��</p></li>
<?php if($menus['1']['tag']) { ?><li><a href="admincp.php?ac=tag" style="font-weight:bold;">��ǩ</a><p>��վ��ı�ǩ����ɾ�����رա��ϲ�</p></li><?php } ?>
<?php if($menus['1']['mtag']) { ?><li><a href="admincp.php?ac=mtag" style="font-weight:bold;">Ⱥ��</a><p>��վ���Ⱥ�����ɾ�����رա��ϲ�</p></li><?php } ?>
<?php if($menus['1']['event']) { ?><li><a href="admincp.php?ac=event" style="font-weight:bold;">�</a><p>��վ��Ļ����ɾ������ˡ��Ƽ�</p></li><?php } ?>
<?php if($menus['1']['css']) { ?><li><a href="admincp.php?ac=css" style="font-weight:bold;">ģ����ʽ</a><p>��վ�㹲���ģ����ʽ����������ˡ�ɾ��</p></li><?php } ?>
</ul>
</div><br />
<?php } ?>
</div>
<br>
</div>

<div class="side">
<?php if($menus['0']) { ?>
<div class="block style1">
<h2>��������</h2>
<ul class="folder">
<?php if(is_array($acs['0'])) { foreach($acs['0'] as $value) { ?>
<?php if($menus['0'][$value]) { ?>
<?php if($ac==$value) { ?><li class="active"><?php } else { ?><li><?php } ?><a href="admincp.php?ac=<?=$value?>"><?=$_TPL['menunames'][$value]?></a></li>
<?php } ?>
<?php } } ?>
</ul>
</div>
<?php } ?>

<div class="block style1">
<h2>��������</h2>
<ul class="folder">
<?php if(is_array($acs['3'])) { foreach($acs['3'] as $value) { ?>
<?php if($ac==$value) { ?><li class="active"><?php } else { ?><li><?php } ?><a href="admincp.php?ac=<?=$value?>"><?=$_TPL['menunames'][$value]?></a></li>
<?php } } ?>
<?php if(is_array($acs['1'])) { foreach($acs['1'] as $value) { ?>
<?php if($menus['1'][$value]) { ?>
<?php if($ac==$value) { ?><li class="active"><?php } else { ?><li><?php } ?><a href="admincp.php?ac=<?=$value?>"><?=$_TPL['menunames'][$value]?></a></li>
<?php } ?>
<?php } } ?>
</ul>
</div>

<?php if($menus['2']) { ?>
<div class="block style1">
<h2>�߼�����</h2>
<ul class="folder">
<?php if(is_array($acs['2'])) { foreach($acs['2'] as $value) { ?>
<?php if($menus['2'][$value]) { ?>
<?php if($ac==$value) { ?><li class="active"><?php } else { ?><li><?php } ?><a href="admincp.php?ac=<?=$value?>"><?=$_TPL['menunames'][$value]?></a></li>
<?php } ?>
<?php } } ?>
<?php if($menus['0']['config']) { ?><li><a href="<?=UC_API?>" target="_blank">UCenter</a></li><?php } ?>
</ul>
</div>
<?php } ?>
</div>

<?php if($statistics['update']) { ?>
<script language="javascript" src="http://u.discuz.net/customer/update.php?get=<?=$statistics['update']?>"></script>
<?php } ?>
<?php my_checkupdate(); ?>

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