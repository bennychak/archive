<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_share_list|template/default/header|template/default/space_share_li|template/default/space_menu|template/default/space_share_li|template/default/footer', '1283361483', 'template/default/space_share_list');?><?php $_TPL['titles'] = array('����'); ?>
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
<li><img src="image/app_add.gif"><a href="cp.php?ac=userapp&my_suffix=%2Fapp%2Flist" class="addApp">����Ӧ��</a></li>
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
<div id="space_share">
<h3 class="feed_header">
<a href="space.php?do=share&view=me" class="r_option" target="_blank">���ӷ���</a>
����(�� <?=$count?> ��)</h3>

<?php if($list) { ?>
<ul class="line_list">
<?php if(is_array($list)) { foreach($list as $value) { ?>
<?php if(empty($ajax_edit)) { ?><li id="share_<?=$value['sid']?>_li"><?php } ?>
<div class="title">
<div class="r_option">
<?php if($value['sid'] && ($_SGLOBAL['supe_uid'] == $value['uid'] || checkperm('manageshare'))) { ?>
<a href="cp.php?ac=topic&op=join&id=<?=$value['sid']?>&idtype=sid" id="a_topicjoin_<?=$value['sid']?>" onclick="ajaxmenu(event, this.id)">������</a><span class="pipe">|</span>
<?php } ?>
<?php if($value['sid']) { ?><a href="space.php?uid=<?=$value['uid']?>&do=share&id=<?=$value['sid']?>">����</a>&nbsp;<?php } ?>
<?php if($value['uid']==$_SGLOBAL['supe_uid']) { ?><?php if($value['type']=='link' || 'video' == $value['type'] || 'music' == $value['type']) { ?><span class="pipe">|</span><?php } ?><a href="cp.php?ac=share&op=delete&sid=<?=$value['sid']?>" id="s_<?=$value['sid']?>_delete" onclick="ajaxmenu(event, this.id)">ɾ��</a><?php } ?>
</div>
<a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a> <a href="space.php?uid=<?=$value['uid']?>&do=share&id=<?=$value['sid']?>"><?=$value['title_template']?></a>
&nbsp;<span class="gray"><?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></span>
</div>
<div class="feed">
<div style="width:100%;overflow:hidden;">
<?php if($value['image']) { ?>
<a href="<?=$value['image_link']?>"><img src="<?=$value['image']?>" class="summaryimg image" alt="" width="70" /></a>
<?php } ?>
<div class="detail">
<?=$value['body_template']?>
</div>
<?php if('video' == $value['type']) { ?>
<div class="media">
<img src="image/vd.gif" alt="�������" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif('music' == $value['type']) { ?>
<div class="media">
<img src="image/music.gif" alt="�������" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif('flash' == $value['type']) { ?>
<div class="media">
<img src="image/flash.gif" alt="����鿴" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>
<div class="quote"><span id="quote" class="q"><?=$value['body_general']?></span></div>
</div>
</div>
<?php if(empty($ajax_edit)) { ?></li><?php } ?>
<?php } } ?>
<div class="page"><?=$multi?></div>
</ul>
<?php } else { ?>
<div class="c_form">���ڻ�û�з���</div>
<?php } ?>

</div><br>
<?php } else { ?>

<?php if($space['self']) { ?>
<h2 class="title"><img src="image/app/share.gif" />����</h2>
<div class="tabs_header">
<ul class="tabs">
<?php if($space['friendnum']) { ?><li<?=$actives['we']?>><a href="space.php?uid=<?=$space['uid']?>&do=share"><span>���ѵķ���</span></a></li><?php } ?>
<li<?=$actives['all']?>><a href="space.php?uid=<?=$space['uid']?>&do=share&view=all"><span>��ҵķ���</span></a></li>
<li<?=$actives['me']?>><a href="space.php?uid=<?=$space['uid']?>&do=share&view=me"><span>�ҵķ���</span></a></li>
</ul>
</div>
<?php } else { ?>
<?php $_TPL['spacetitle'] = "����";
	$_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=share&view=me\">TA�����з���</a>"; ?>
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

<?php } ?>

<div class="h_status">
���������Ͳ鿴��
<a href="<?=$theurl?>"<?=$sub_actives['type_all']?>>ȫ��</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=link"<?=$sub_actives['type_link']?>>��ַ</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=video"<?=$sub_actives['type_video']?>>��Ƶ</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=music"<?=$sub_actives['type_music']?>>����</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=flash"<?=$sub_actives['type_flash']?>>Flash</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=blog"<?=$sub_actives['type_blog']?>>��־</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=album"<?=$sub_actives['type_album']?>>���</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=pic"<?=$sub_actives['type_pic']?>>ͼƬ</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=mtag"<?=$sub_actives['type_mtag']?>>Ⱥ��</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=thread"<?=$sub_actives['type_thread']?>>����</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=poll"<?=$sub_actives['type_poll']?>>ͶƱ</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=event"<?=$sub_actives['type_event']?>>�</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=space"<?=$sub_actives['type_space']?>>�û�</a><span class="pipe">|</span>
<a href="<?=$theurl?>&type=tag"<?=$sub_actives['type_tag']?>>TAG</a>
</div>

<div id="content">
<ul id="share_ul">
<?php if($list) { ?>
<?php if(is_array($list)) { foreach($list as $value) { ?>
<?php if(empty($ajax_edit)) { ?><li id="share_<?=$value['sid']?>_li"><?php } ?>
<div class="title">
<div class="r_option">
<?php if($value['sid'] && ($_SGLOBAL['supe_uid'] == $value['uid'] || checkperm('manageshare'))) { ?>
<a href="cp.php?ac=topic&op=join&id=<?=$value['sid']?>&idtype=sid" id="a_topicjoin_<?=$value['sid']?>" onclick="ajaxmenu(event, this.id)">������</a><span class="pipe">|</span>
<?php } ?>
<?php if($value['sid']) { ?><a href="space.php?uid=<?=$value['uid']?>&do=share&id=<?=$value['sid']?>">����</a>&nbsp;<?php } ?>
<?php if($value['uid']==$_SGLOBAL['supe_uid']) { ?><?php if($value['type']=='link' || 'video' == $value['type'] || 'music' == $value['type']) { ?><span class="pipe">|</span><?php } ?><a href="cp.php?ac=share&op=delete&sid=<?=$value['sid']?>" id="s_<?=$value['sid']?>_delete" onclick="ajaxmenu(event, this.id)">ɾ��</a><?php } ?>
</div>
<a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a> <a href="space.php?uid=<?=$value['uid']?>&do=share&id=<?=$value['sid']?>"><?=$value['title_template']?></a>
&nbsp;<span class="gray"><?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></span>
</div>
<div class="feed">
<div style="width:100%;overflow:hidden;">
<?php if($value['image']) { ?>
<a href="<?=$value['image_link']?>"><img src="<?=$value['image']?>" class="summaryimg image" alt="" width="70" /></a>
<?php } ?>
<div class="detail">
<?=$value['body_template']?>
</div>
<?php if('video' == $value['type']) { ?>
<div class="media">
<img src="image/vd.gif" alt="�������" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif('music' == $value['type']) { ?>
<div class="media">
<img src="image/music.gif" alt="�������" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif('flash' == $value['type']) { ?>
<div class="media">
<img src="image/flash.gif" alt="����鿴" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['sid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>
<div class="quote"><span id="quote" class="q"><?=$value['body_general']?></span></div>
</div>
</div>
<?php if(empty($ajax_edit)) { ?></li><?php } ?>
<?php } } ?>
<div class="page"><?=$multi?></div>
<?php } else { ?>
<li><div class="c_form">���ڻ�û�з�����</div></li>
<?php } ?>
</ul>

</div>


<div id="sidebar">
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<form id="shareform" name="shareform" action="cp.php?ac=share&type=link" method="post">
<table cellspacing="2" cellpadding="2" width="100%">
<tr><td><strong>������ַ����Ƶ�����֡�Flash:</strong></td></tr>
<tr><td><input type="text" class="t_input" name="link" onfocus="javascript:if('http://'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='http://'" id="share_link" style="width:98%;" value="http://" /></td></tr>
<tr><td><strong>����:</strong></td></tr>
<tr>
<td>
<textarea id="share_general" name="general" style="width:98%;" rows="3" onkeydown="ctrlEnter(event, 'sharesubmit_btn')"></textarea>
</td>
</tr>
<?php if(checkperm('seccode')) { ?>
<tr>
<td>
<?php if($_SCONFIG['questionmode']) { ?>
<p>����ȷ�ش�������������ύ</p>
<p><?php question(); ?></p>
<p><input type="text" id="seccode" name="seccode" value="" size="15" class="t_input"></p>
<?php } else { ?>
<p><script>seccode();</script></p>
<p>�����������4λ��ĸ�����֣��������<a href="javascript:updateseccode()">����һ��</a></p>
<p><input type="text" id="seccode" name="seccode" value="" size="15" class="t_input"></p>
<?php } ?>
</td>
</tr>
<?php } ?>
<tr><td>
<input type="hidden" name="refer" value="space.php?uid=<?=$space['uid']?>&do=share&view=me" />
<input type="hidden" name="sharesubmit" value="true" />
<input type="button" id="sharesubmit_btn" name="sharesubmit_btn" value="����" class="submit" onclick="ajaxpost('shareform', 'share_add')" />
</td></tr>
<tr><td id="__shareform"></td></tr>
</table>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" /></form>
</div></div></div></div>

<div class="sidebox" id="help">
<h2 class="title">��η�����ҳ��</h2>
<p>ֱ����д��ַ��</p>
<h2 class="title">��η�����Ƶ��</h2>
<p>��д��Ƶ������ҳ����ַ��(����Ҫ��д��Ƶ����ʵ��ַ)</p>
<p>����֧�ֵ���Ƶ��վ�У�<br>Youtube���ſᡢ��6��Mofile��żż��Ƶ��UUME�����㡢���׻����ھ�Ƶ�����ٶ�������Ƶ��������Ƶ���Ѻ���Ƶ��</p>
<h2 class="title">��η������֣�</h2>
<p>��д�����ļ�����ַ��(��׺��Ҫ��mp3����wma)</p>
<h2 class="title">��η��� Flash��</h2>
<p>��д Flash �ļ�����ַ��(��׺��Ҫ��swf)</p>
</div>

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
<?php } ?>
<?php ob_out();?>