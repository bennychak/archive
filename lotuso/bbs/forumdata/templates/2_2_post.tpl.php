<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('post');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/header.htm', 1283180970, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/post_editor.htm', 1283180970, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/seccheck.htm', 1283180970, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/post_editor_menu.htm', 1283180970, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/footer.htm', 1283180970, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/post.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283180970, '2', './templates/uchome')
;?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$charset?>" />
<title><?=$navtitle?> <?=$bbname?> <?=$seotitle?> - Powered by Discuz!</title>
<?=$seohead?>
<meta name="keywords" content="<?=$metakeywords?><?=$seokeywords?>" />
<meta name="description" content="<?=$metadescription?> <?=$bbname?> <?=$seodescription?> - Discuz! Board" />
<meta name="generator" content="Discuz! <?=$version?>" />
<meta name="author" content="Discuz! Team and Comsenz UI Team" />
<meta name="copyright" content="2001-2009 Comsenz Inc." />
<meta name="MSSmartTagsPreventParsing" content="True" />
<meta http-equiv="MSThemeCompatible" content="Yes" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<link rel="archives" title="<?=$bbname?>" href="<?=$boardurl?>archiver/" />
<?=$rsshead?>
<?=$extrahead?><link rel="stylesheet" type="text/css" href="forumdata/cache/style_<?=STYLEID?>_common.css?<?=VERHASH?>" /><link rel="stylesheet" type="text/css" href="forumdata/cache/scriptstyle_<?=STYLEID?>_<?=CURSCRIPT?>.css?<?=VERHASH?>" />
<? if($forum['ismoderator']) { ?>
<link href="forumdata/cache/style_2_moderator.css?P9P" rel="stylesheet" type="text/css" />
<? } ?><script type="text/javascript">var STYLEID = '<?=STYLEID?>', IMGDIR = '<?=IMGDIR?>', VERHASH = '<?=VERHASH?>', charset = '<?=$charset?>', discuz_uid = <?=$discuz_uid?>, cookiedomain = '<?=$cookiedomain?>', cookiepath = '<?=$cookiepath?>', attackevasive = '<?=$attackevasive?>', disallowfloat = '<?=$disallowfloat?>', creditnotice = '<? if($creditnotice) { ?><?=$creditnames?><? } ?>', <? if(in_array(CURSCRIPT, array('viewthread', 'forumdisplay'))) { ?>gid = parseInt('<?=$thisgid?>')<? } elseif(CURSCRIPT == 'index') { ?>gid = parseInt('<?=$gid?>')<? } else { ?>gid = 0<? } ?>, fid = parseInt('<?=$fid?>'), tid = parseInt('<?=$tid?>')</script>
<script src="<?=$jspath?>common.js?<?=VERHASH?>" type="text/javascript"></script>
</head>

<body id="<?=CURSCRIPT?>" onkeydown="if(event.keyCode==27) return false;">

<div id="append_parent"></div><div id="ajaxwaitid"></div>

<div id="header">
<div class="wrap s_clear">
<h2><a href="<?=$indexname?>" title="<?=$bbname?>"><?=BOARDLOGO?></a></h2>
<div id="umenu">
<? if($discuz_uid) { ?>
<cite><a href="space.php?uid=<?=$discuz_uid?>" class="noborder"><?=$discuz_userss?></a><? if($allowinvisible) { ?><span id="loginstatus"><? if(!empty($invisible)) { ?><a href="member.php?action=switchstatus" onclick="ajaxget(this.href, 'loginstatus');doane(event);">����</a><? } else { ?><a href="member.php?action=switchstatus" title="��Ҫ����" onclick="ajaxget(this.href, 'loginstatus');doane(event);">����</a><? } ?></span><? } ?></cite>
<span class="pipe">|</span>
<? if($ucappopen['UCHOME']) { ?>
<a href="<?=$uchomeurl?>/space.php?uid=<?=$discuz_uid?>" target="_blank">�ռ�</a>
<? } elseif($ucappopen['XSPACE']) { ?>
<a href="<?=$xspaceurl?>/?uid-<?=$discuz_uid?>" target="_blank">�ռ�</a>
<? } ?>
<a id="myprompt" href="notice.php" <? if($prompt) { ?>class="new" onmouseover="showMenu({'ctrlid':this.id})"<? } ?>>����</a>
<span id="myprompt_check"></span>
<a href="pm.php" id="pm_ntc" target="_blank">����Ϣ</a>
<? if($taskon) { ?>
<a id="task_ntc" <? if($doingtask) { ?>href="task.php?item=doing" class="new" title="����δ��ɵ�����"<? } else { ?>href="task.php"<? } ?> target="_blank">��̳����</a>
<? } ?>

<span class="pipe">|</span>
<a href="memcp.php">��������</a>
<? if($discuz_uid && $adminid > 1) { ?><a href="modcp.php?fid=<?=$fid?>" target="_blank">�������</a><? } if($discuz_uid && $adminid == 1) { ?><a href="admincp.php" target="_blank">��������</a><? } ?>
<a href="logging.php?action=logout&amp;formhash=<?=FORMHASH?>">�˳�</a>
<? } elseif(!empty($_DCOOKIE['loginuser'])) { ?>
<cite><a id="loginuser" class="noborder"><?=$_DCOOKIE['loginuser']?></a></cite>
<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;">����</a>
<a href="logging.php?action=logout&amp;formhash=<?=FORMHASH?>">�˳�</a>
<? } else { ?>
<a href="<?=$regname?>" onclick="showWindow('register', this.href);return false;" class="noborder"><?=$reglinkname?></a>
<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;">��¼</a>
<? } ?>
</div>
<div id="ad_headerbanner"><? if($admode && !empty($advlist['headerbanner'])) { ?><?=$advlist['headerbanner']?><? } ?></div>
<div id="menu">
<ul>
<? if($_DCACHE['settings']['frameon'] > 0) { ?>
<li>
<span class="frameswitch">
<script type="text/javascript">
if(top == self) {
<? if(($_DCACHE['settings']['frameon'] == 2 && !defined('CACHE_FILE') && in_array(CURSCRIPT, array('index', 'forumdisplay', 'viewthread')) && (($_DCOOKIE['frameon'] == 'yes' && $_GET['frameon'] != 'no') || (empty($_DCOOKIE['frameon']) && empty($_GET['frameon']))))) { ?>
top.location = 'frame.php?frameon=yes&referer='+escape(self.location);
<? } ?>
document.write('<a href="frame.php?frameon=yes" target="_top" class="frameon">����ģʽ<\/a>');
} else {
document.write('<a href="frame.php?frameon=no" target="_top" class="frameoff">ƽ��ģʽ<\/a>');
}
</script>
</span>
</li>
<? } if(is_array($navs)) { foreach($navs as $id => $nav) { if($id == 3) { if(!empty($plugins['jsmenu'])) { ?>
<?=$nav['nav']?>
<? } if(!empty($plugins['links'])) { if(is_array($plugins['links'])) { foreach($plugins['links'] as $module) { if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?><li><?=$module['url']?></li><? } } } } } else { if(!$nav['level'] || ($nav['level'] == 1 && $discuz_uid) || ($nav['level'] == 2 && $adminid > 0) || ($nav['level'] == 3 && $adminid == 1)) { ?><?=$nav['nav']?><? } } } } if(in_array($BASEFILENAME, $navmns)) { $mnid = $BASEFILENAME; } elseif($navmngs[$BASEFILENAME]) { if(is_array($navmngs[$BASEFILENAME])) { foreach($navmngs[$BASEFILENAME] as $navmng) { if($navmng['0'] == array_intersect_assoc($navmng['0'], $_GET)) { $mnid = $navmng['1']; } } } } ?>
</ul>
<script type="text/javascript">
var currentMenu = $('mn_<?=$mnid?>') ? $('mn_<?=$mnid?>') : $('mn_<?=$navmns['0']?>');
currentMenu.parentNode.className = 'current';
</script>
</div>
<? if(!empty($stylejumpstatus)) { ?>
<script type="text/javascript">
function setstyle(styleid) {
str = unescape('<? echo str_replace("'", "\\'", urlencode($_SERVER['QUERY_STRING'])); ?>');
str = str.replace(/(^|&)styleid=\d+/ig, '');
str = (str != '' ? str + '&' : '') + 'styleid=' + styleid;
location.href = '<?=$BASESCRIPT?>?' + str;
}
</script>
<ul id="style_switch"><? if(is_array($styles)) { foreach($styles as $id => $stylename) { ?><li<? if($id == STYLEID) { ?> class="current"<? } ?>><a href="###" onclick="setstyle(<?=$id?>)" title="<?=$stylename?>" style="background: <?=$styleicons[$id]?>;"><?=$stylename?></a></li><? } } ?></ul>
<? } ?>
</div>
<div id="myprompt_menu" style="display:none" class="promptmenu">
<div class="promptcontent">
<ul class="s_clear"><? if(is_array($prompts)) { foreach($prompts as $promptkey => $promptdata) { if($promptkey) { ?><li<? if(!$promptdata['new']) { ?> style="display:none"<? } ?>><a id="prompt_<?=$promptkey?>" href="<? if($promptdata['script']) { ?><?=$promptdata['script']?><? } else { ?>notice.php?filter=<?=$promptkey?><? } ?>" target="_blank"><?=$promptdata['name']?> (<?=$promptdata['new']?>)</a></li><? } } } ?></ul>
</div>
</div>
</div>
<?=$pluginhooks['global_header']?><?
$actiontitle = <<<EOF

EOF;
 if($action == 'newthread') { if($special == 0) { 
$actiontitle .= <<<EOF
���»���
EOF;
 } elseif($special == 1) { 
$actiontitle .= <<<EOF
����ͶƱ
EOF;
 } elseif($special == 2) { 
$actiontitle .= <<<EOF
������Ʒ
EOF;
 } elseif($special == 3) { 
$actiontitle .= <<<EOF
��������
EOF;
 } elseif($special == 4) { 
$actiontitle .= <<<EOF
�����
EOF;
 } elseif($special == 5) { 
$actiontitle .= <<<EOF
��������
EOF;
 } elseif($specialextra) { 
$actiontitle .= <<<EOF
 {$threadplugins[$specialextra]['name']}
EOF;
 } } elseif($action == 'reply' && !empty($addtrade)) { 
$actiontitle .= <<<EOF
�����Ʒ
EOF;
 } elseif($action == 'reply') { 
$actiontitle .= <<<EOF
����/�ظ�����
EOF;
 } elseif($action == 'edit') { 
$actiontitle .= <<<EOF
�༭����
EOF;
 } 
$actiontitle .= <<<EOF

EOF;
?>

<div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> <?=$navigation?> &raquo; <?=$actiontitle?></div><? $adveditor = $isfirstpost && $special || $special == 2 && ($action == 'newthread' || $action == 'reply' && !empty($addtrade) || $action == 'edit' && $thread['special'] == 2); $advmore = !$showthreadsorts && !$special || $action == 'reply' && empty($addtrade) || $action == 'edit' && !$isfirstpost && ($thread['special'] == 2 && !$special || $thread['special'] != 2); ?><div id="wrap" class="wrap s_clear"><div class="main"><div class="content editorcontent">
<form method="post" id="postform"
<? if($action == 'newthread') { ?>action="post.php?action=<? if($special != 2) { ?>newthread<? } else { ?>newtrade<? } ?>&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;topicsubmit=yes"
<? } elseif($action == 'reply') { ?>action="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;replysubmit=yes"
<? } elseif($action == 'edit') { ?>action="post.php?action=edit&amp;extra=<?=$extra?>&amp;editsubmit=yes&amp;mod=<?=$mod?>" <?=$enctype?>
<? } ?>
onsubmit="return validate(this)">
<input type="hidden" name="formhash" id="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="posttime" id="posttime" value="<?=$timestamp?>" />
<? if(!empty($modthreadkey)) { ?><input type="hidden" name="modthreadkey" id="modthreadkey" value="<?=$modthreadkey?>" /><? } ?>
<input type="hidden" name="wysiwyg" id="<?=$editorid?>_mode" value="<?=$editormode?>" />
<? if($action == 'reply') { ?>
<input type="hidden" name="noticeauthor" value="<?=$noticeauthor?>" />
<input type="hidden" name="noticetrimstr" value="<?=$noticetrimstr?>" />
<input type="hidden" name="noticeauthormsg" value="<?=$noticeauthormsg?>" />
<? } if($action == 'edit') { ?>
<input type="hidden" name="fid" id="fid" value="<?=$fid?>" />
<input type="hidden" name="tid" value="<?=$tid?>" />
<input type="hidden" name="pid" value="<?=$pid?>" />
<input type="hidden" name="page" value="<?=$page?>" />
<? } if($special) { ?>
<input type="hidden" name="special" value="<?=$special?>" />
<? } if($specialextra) { ?>
<input type="hidden" name="specialextra" value="<?=$specialextra?>" />
<? } if($isfirstpost) { ?>
<input type="hidden" name="iconid" id="iconid" value="<?=$thread['iconid']?>" />
<? } ?>
<div class="s_clear"<? if(!$showthreadsorts && !$adveditor) { ?> id="editorbox"<? } ?>>
<h3 class="float_ctrl">
<em id="returnmessage">
<?=$actiontitle?>
</em>
<? if($action == 'newthread' && $modnewthreads) { ?><em class="needverify">�����</em><? } if($action == 'reply' && $modnewreplies) { ?><em class="needverify">�����</em><? } ?><?
$creditstring = <<<EOF

EOF;
 if(is_array($postcredits)) { foreach($postcredits as $id => $credit) { if($credit != '') { 
$creditstring .= <<<EOF
{$extcredits[$id]['title']} 
EOF;
 if($credit >= 0) { 
$creditstring .= <<<EOF
+{$credit}
EOF;
 } else { 
$creditstring .= <<<EOF
{$credit}
EOF;
 } 
$creditstring .= <<<EOF
 {$extcredits[$id]['unit']} &nbsp;
EOF;
 } } } 
$creditstring .= <<<EOF

EOF;
?>
<? if($creditstring) { ?>
<span><a href="faq.php?action=credits&amp;fid=<?=$fid?>" target="_blank" title="����˵��"><? if($action == 'newthread') { ?>����������<? } elseif($action == 'reply') { ?>����������<? } ?>&nbsp;<?=$creditstring?></a></span>
<? } ?>
</h3>
<div class="postbox" id="postbox">
<?=$pluginhooks['post_top']?>
<div class="float_postinfo s_clear">
<? if(!$special && $isfirstpost) { ?>
<em id="icon" class="dropmenu" onclick="showMenu({'ctrlid':this.id})"><img id="icon_img" src="images/icons/<? if($action == 'edit' && $thread['iconid']) { ?><?=$_DCACHE['icons'][$thread['iconid']]?><? } else { ?>icon1.gif<? } ?>" /></em>
<ul id="icon_menu" class="popupmenu_popup" style="display:none"><? if(is_array($_DCACHE['icons'])) { foreach($_DCACHE['icons'] as $id => $icon) { ?><li><a href="javascript:;"><img onclick="switchicon(<?=$id?>, this)" src="images/icons/<?=$icon?>" alt="" /></a></li><? } } ?></ul>
<? } if($action == 'reply' && !empty($addtrade) || $action == 'edit' && $thread['special'] == 2 && !$postinfo['first']) { ?>
<input name="subject" type="hidden" value="" />
<? } else { if($action != 'reply') { ?>
<span><input name="subject" id="subject" prompt="post_subject"  class="txt" value="<?=$postinfo['subject']?>" tabindex="1" /></span>
<? } else { ?>
<span id="subjecthide" class="left">RE: <?=$thread['subject']?> [<a href="javascript:;" onclick="display('subjecthide');display('subjectbox');$('subject').value='RE: <? echo htmlspecialchars(str_replace('\'', '\\\'', $thread['subject'])); ?>'">�޸�</a>]</span>
<span id="subjectbox" style="display:none"><input name="subject" id="subject" class="txt" value="" tabindex="1" /></span>
<? } } if($action == 'edit' && ($isfirstpost && $thread['replies'] < 1 || !$isfirstpost && ($isorigauthor || $forum['ismoderator']))) { if(!$rushreply) { ?>
<div class="right"><input type="checkbox" name="delete" id="delete" value="1" title="ɾ������<? if($thread['special'] == 3) { ?>���������ͷ��ã����˻������ѡ�<? } ?>"><label for="delete">ɾ?</label></div>
<? } } ?>
<div class="left">
<? if(!$special && ($threadsorts = $forum['threadsorts']) && ($action == 'newthread' || $action == 'edit' && $isfirstpost && !$thread['sortid'])) { ?>
<div class="float_typeid">
<select name="sortid" id="sortid" change="switchsort()">
<option value="0">������Ϣ</option><? if(is_array($threadsorts['types'])) { foreach($threadsorts['types'] as $tsortid => $name) { if(!empty($modelid) && $threadsorts['modelid'][$tsortid] == $modelid || empty($modelid)) { ?>
<option value="<?=$tsortid?>"<? if($sortid == $tsortid) { ?> selected="selected"<? } ?>><? echo strip_tags($name);; ?></option>
<? } } } ?></select>
</div>
<? } if($action == 'edit' && $isfirstpost && $sortid) { ?>
<input type="hidden" name="sortid" value="<?=$sortid?>" />
<? } if($isfirstpost && $forum['threadtypes']['types']) { ?>
<div class="float_typeid">
<select name="typeid" id="typeid">
<option value="0">����</option><? if(is_array($forum['threadtypes']['types'])) { foreach($forum['threadtypes']['types'] as $typeid => $name) { ?><option value="<?=$typeid?>"<? if($thread['typeid'] == $typeid) { ?> selected="selected"<? } ?>><? echo strip_tags($name);; ?></option><? } } ?></select>
</div>
<? } ?>
</div>
</div>
<? if(!$isfirstpost && $thread['special'] == 5 && empty($firststand) && $action != 'edit') { ?>
<div class="viewpoint s_clear">
<p class="left">ѡ��۵�: </p>
<div class="float_typeid short_select">
<select id="stand" name="stand">
<option value="0">����</option>
<option value="1"<? if($stand == 1) { ?> selected<? } ?>>����</option>
<option value="2"<? if($stand == 2) { ?> selected<? } ?>>����</option>
</select>
</div>
</div>
<? } if($showthreadsorts) { ?>
<div class="classifieds">
<table cellpadding="0" cellspacing="0" class="formtable">
<tbody id="threadsorts"><span id="threadsortswait"></span></tbody>
</table>
</div>
<? } elseif($adveditor) { if($special == 1) { include template('post_poll', '0', ''); } elseif($special == 2 && ($action != 'edit' || ($action == 'edit' && ($authorid['authorid'] == $discuz_uid && $allowposttrade || $allowedittrade)))) { include template('post_trade', '0', ''); } elseif($special == 3) { include template('post_reward', '0', ''); } elseif($special == 4) { include template('post_activity', '0', ''); } elseif($special == 5) { include template('post_debate', '0', ''); } elseif($specialextra) { ?><div class="specialpost s_clear"><?=$threadplughtml?></div>
<? } } ?><div id="<?=$editorid?>_controls" class="editorrow">
<div class="editor">
<a id="<?=$editorid?>_switcher" class="plugeditor editormode"><input type="checkbox" name="checkbox" value="0" <? if(!$editormode) { ?>checked="checked"<? } ?> onclick="switchEditor(this.checked?0:1)" />Դ��</a>
<div class="editorbtn">
<div class="maxbtn">
<a id="<?=$editorid?>_cmd_paste" title="ճ��">ճ��</a>
</div>
<div class="minibtn">
<p>
<a id="<?=$editorid?>_cmd_simple" title="����">B</a>
<a id="<?=$editorid?>_cmd_fontname" title="����">Font</a>
<a id="<?=$editorid?>_cmd_fontsize" title="��С">Size</a>
<a id="<?=$editorid?>_cmd_forecolor" title="��ɫ">Color</a>
<a id="<?=$editorid?>_cmd_createlink" title="��������">Url</a>
<em></em>
<a id="<?=$editorid?>_cmd_unlink" title="�Ƴ�����">Unlink</a>
<a id="<?=$editorid?>_cmd_removeformat" title="����ı���ʽ">Removeformat</a>
<a id="<?=$editorid?>_cmd_undo" title="����">Undo</a>
<a id="<?=$editorid?>_cmd_redo" title="����">Redo</a>
</p>
<p>
<a id="<?=$editorid?>_cmd_paragraph" title="����">P</a>
<a id="<?=$editorid?>_cmd_table" title="������">Table</a>
<a id="<?=$editorid?>_cmd_list" title="�����б�">List</a>
<? if($allowhidecode) { ?>
<a id="<?=$editorid?>_cmd_hide" title="������������">Hide</a>
<? } else { ?>
<a id="<?=$editorid?>_cmd_hidden" title="������������" class="hidebtn_disabled">Hide</a>
<? } ?>
<a id="<?=$editorid?>_cmd_free" title="���������Ϣ">Free</a>
<em></em>
<a id="<?=$editorid?>_cmd_savedata" title="��������">Savedata</a>
<a id="<?=$editorid?>_cmd_loaddata" title="�ָ�����">Loaddata</a>
<a id="<?=$editorid?>_cmd_clearcontent" title="�������">Clearcontent</a>
<a id="<?=$editorid?>_cmd_checklength" title="�������">Checklength</a>
</p>
</div>
<div class="maxbtn">
<a id="<?=$editorid?>_cmd_smilies" title="����">����</a>
<div id="<?=$editorid?>_cmd_image_notice" class="haspic" style="display:none">!</div>
<a id="<?=$editorid?>_cmd_image" title="ͼƬ">ͼƬ</a>
<? if($allowpostattach) { ?>
<div id="<?=$editorid?>_cmd_attach_notice" class="hasatt" style="display:none">!</div>
<a id="<?=$editorid?>_cmd_attach" title="����">����</a>
<? } if($forum['allowmediacode']) { ?>
<a id="<?=$editorid?>_cmd_audio" title="����">����</a>
<a id="<?=$editorid?>_cmd_video" title="��Ƶ">��Ƶ</a>
<a id="<?=$editorid?>_cmd_flash" title="Flash">Flash</a>
<? } ?>
<a id="<?=$editorid?>_cmd_code" title="����">����</a>
<a id="<?=$editorid?>_cmd_quote" title="����">����</a>
</div>
<? if($forum['allowbbcode'] && $allowcusbbcode && $_DCACHE['bbcodes_display']) { ?>
<div class="minibtn">
<p><? if(is_array($_DCACHE['bbcodes_display'])) { foreach($_DCACHE['bbcodes_display'] as $tag => $bbcode) { if($bbcode['i'] % 2 != 0) { ?><a id="<?=$editorid?>_cmd_custom<?=$bbcode['params']?>_<?=$tag?>" class="customedit" title="<?=$bbcode['explanation']?>"><img src="images/common/<?=$bbcode['icon']?>"title="<?=$bbcode['explanation']?>" alt="<?=$tag?>" /></a><? } } } ?></p>
<p><? if(is_array($_DCACHE['bbcodes_display'])) { foreach($_DCACHE['bbcodes_display'] as $tag => $bbcode) { if($bbcode['i'] % 2 == 0) { ?><a id="<?=$editorid?>_cmd_custom<?=$bbcode['params']?>_<?=$tag?>" class="customedit" title="<?=$bbcode['explanation']?>"><img src="images/common/<?=$bbcode['icon']?>"title="<?=$bbcode['explanation']?>" alt="<?=$tag?>" /></a><? } } } ?></p>
</div>
<? } ?>
</div>
</div>
</div>

<div class="newediter">
<table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout:fixed">
<tr><td><textarea class="autosave" name="message" id="<?=$editorid?>_textarea" prompt="post_message"  tabindex="1" class="txt" style="height:300px"><? if($action == 'edit') { ?><?=$postinfo['message']?><? } else { ?><?=$message?><? } ?></textarea></td></tr>
</table>
</div>

<script src="<?=$jspath?>post.js?<?=VERHASH?>" type="text/javascript"></script>
<script src="<?=$jspath?>bbcode.js?<?=VERHASH?>" type="text/javascript"></script>
<script type="text/javascript">

var editorid = '<?=$editorid?>';
var textobj = $(editorid + '_textarea');
var wysiwyg = (BROWSER.ie || BROWSER.firefox || (BROWSER.opera >= 9)) && parseInt('<?=$editormode?>') == 1 ? 1 : 0;
var allowswitcheditor = parseInt('<?=$allowswitcheditor?>');
var allowhtml = parseInt('<?=$allowhtml?>');
var forumallowhtml = parseInt('<?=$forum['allowhtml']?>');
var allowsmilies = parseInt('<?=$forum['allowsmilies']?>');
var allowbbcode = parseInt('<?=$forum['allowbbcode']?>');
var allowimgcode = parseInt('<?=$forum['allowimgcode']?>');
var allowpostattach = parseInt('<?=$allowpostattach?>');
var allowpostimg = parseInt('<?=$allowpostimg?>');
var editorcss = 'forumdata/cache/style_<?=STYLEID?>_wysiwyg.css?<?=VERHASH?>';
var TABLEBG = '<?=WRAPBG?>';
var pid = parseInt('<?=$pid?>');
<? if($allowpostattach) { ?>
var extensions = '<?=$attachextensions?>';
var imgexts = '<?=$imgexts?>';
<? } ?>
var fontoptions = new Array("����_GB2312", "����", "����_GB2312", "����", "������", "΢���ź�", "Trebuchet MS", "Tahoma", "Arial", "Impact", "Verdana", "Times New Roman");
var custombbcodes = new Array();
<? if($forum['allowbbcode'] && $allowcusbbcode && $_DCACHE['bbcodes_display']) { if(is_array($_DCACHE['bbcodes_display'])) { foreach($_DCACHE['bbcodes_display'] as $tag => $bbcode) { ?>custombbcodes["<?=$tag?>"] = {'prompt' : '<?=$bbcode['prompt']?>'};<? } } } ?>
</script><?=$pluginhooks['post_middle']?>
<? if($action == 'newthread' || $action == 'edit' && $isfirstpost) { ?>
<div class="columntype">
<table cellpadding="0" cellspacing="0"><tr>
<? if($tagstatus) { ?>
<td class="firstlist posttags">
<p><strong>��ǩ(TAG):</strong> (�ö��Ż�ո���������ǩ��������д <strong>5</strong> ��)</p>
<p><input type="text" name="tags" id="tags" class="txt" value="<?=$threadtags?>" tabindex="1" /><button name="addtags" type="button" onclick="relatekw();return false">+���ñ�ǩ</button> <span id="tagselect"></span></p>
</div>
</td>
<? } if($allowsetreadperm) { ?>
<td class="firstlist">
<p><strong>�Ķ�Ȩ��:</strong></p>
<p><input type="text" name="readperm" value="<?=$thread['readperm']?>" class="txt" tabindex="1" /> 0���Ϊ������</p>
</td>
<? } if($maxprice && !$special) { ?>
<td class="firstlist">
<p><strong>�ۼ�</strong>(<?=$extcredits[$creditstransextra['1']]['title']?>):</p>
<p><input type="text" name="price" value="<?=$thread['pricedisplay']?>" class="txt" tabindex="1" /> <?=$extcredits[$creditstransextra['1']]['unit']?> <span title="������ʹ�� [free]message[/free] ���뷢�����踶��Ҳ�ܲ鿴�������Ϣ">��� <?=$maxprice?> <?=$extcredits[$creditstransextra['1']]['unit']?></span>
</td>
<? } ?>
</tr></table>
</div>
<? } if($maxprice && ($action == 'newthread' || $action == 'edit' && $isfirstpost)) { ?>
<span class="lighttxt">
<? if($maxincperthread) { ?><img src="<?=IMGDIR?>/arrow_right.gif" />������������������Ϊ <?=$maxincperthread?> <?=$extcredits[$creditstransextra['1']]['unit']?>&nbsp;&nbsp;&nbsp;&nbsp;<? } if($maxchargespan) { ?><img src="<?=IMGDIR?>/arrow_right.gif" />������������� <?=$maxchargespan?> ��Сʱ<? if($action == 'edit' && $freechargehours) { ?>�������⻹������ <?=$freechargehours?> ��Сʱ<? } } ?>
</span>
<? } ?>
<div class="columntype">
<h4>����ѡ��:</h4>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="firstlist">
<? if(($forum['allowhtml'] || ($action == 'edit' && ($org['htmlon'] & 1))) && $allowhtml) { ?>
<p><input type="checkbox" name="htmlon" id="htmlon" value="1" <?=$htmloncheck?> /><label for="htmlon">Html ����</label></p>
<? } else { ?>
<p><input type="checkbox" name="htmlon" id="htmlon" value="0" <?=$htmloncheck?> disabled="disabled" /><label for="htmlon">Html ����</label></p>
<? } ?>
<p><input type="checkbox" id="allowimgcode" disabled<? if($forum['allowimgcode']) { ?> checked="checked"<? } ?> /><label for="allowimgcode">[img] ����</label></p>
</td>
<td>
<p><input type="checkbox" name="parseurloff" id="parseurloff" value="1" <?=$urloffcheck?> tabindex="1" /><label for="parseurloff">���� URL ʶ��</label></p>
<p><input type="checkbox" name="smileyoff" id="smileyoff" value="1" <?=$smileyoffcheck?> tabindex="1" /><label for="smileyoff">���� <a href="faq.php?action=faq&amp;id=5&amp;messageid=32" target="_blank">����</a></label></p>
<p><input type="checkbox" name="bbcodeoff" id="bbcodeoff" value="1" <?=$codeoffcheck?> tabindex="1" /><label for="bbcodeoff">���� <a href="faq.php?action=faq&amp;id=5&amp;messageid=18" target="_blank">Discuz!����</a></label></p>
<? if($tagstatus && ($action == 'newthread' || $action == 'edit' && $isfirstpost)) { ?>
<p><input type="checkbox" name="tagoff" id="tagoff" <? if(!empty($tagoffcheck)) { ?>checked="checked"<? } ?> tabindex="1" /><label for="tagoff">���� ��ǩ����</label></p>
<? } ?>
</td>
<td>
<? if($discuz_uid) { if($action == 'newthread' || $action == 'edit' && $isfirstpost) { ?>
<p><input type="checkbox" name="ordertype" id="ordertype" value="1" <?=$ordertypecheck?> tabindex="1" /><label for="ordertype">������</label></p>
<? } if($action == 'newthread') { ?>
<p><input type="checkbox" name="attention_add" id="attention_add" checked="checked" value="1" /><label for="attention_add">��ע��������»ظ�</label></p>
<? } elseif($action == 'reply' || $action == 'edit') { if($has_attention) { ?>
<p><input type="checkbox" name="attention_remove" id="attention_remove" value="1" /><label for="attention_remove">ȡ���Դ������»ظ��Ĺ�ע</label></p>
<? } else { ?>
<p><input type="checkbox" name="attention_add" id="attention_add" value="1" /><label for="attention_add">��ע��������»ظ�</label></p>
<? } } } ?>
<p><input type="checkbox" name="usesig" id="usesig" value="1" <? if(!$maxsigsize) { ?>disabled <? } else { ?><?=$usesigcheck?> <? } ?>tabindex="1" /><label for="usesig">ʹ�ø���ǩ��</label></p>
<? if($action != 'edit') { if($allowanonymous) { ?><p><input type="checkbox" name="isanonymous" id="isanonymous" value="1" tabindex="1" /><label for="isanonymous">ʹ����������</label></p><? } } else { if($allowanonymous || (!$allowanonymous && $orig['anonymous'])) { ?><p><input type="checkbox" name="isanonymous" id="isanonymous" value="1" <? if($orig['anonymous']) { ?>checked="checked"<? } ?> tabindex="1" /><label for="isanonymous">ʹ����������</label></p><? } } ?>
</td>
<td>
<? if($action == 'newthread' && $forum['ismoderator'] && ($allowdirectpost || !$forum['modnewposts'])) { if($action == 'newthread' && $forum['ismoderator'] && ($allowdirectpost || !$forum['modnewposts'])) { ?>
<p><input type="checkbox" name="sticktopic" id="sticktopic" value="1" <?=$stickcheck?> tabindex="1" /><label for="sticktopic">�����ö�</label></p>
<p><input type="checkbox" name="addtodigest" id="addtodigest" value="1" <?=$digestcheck?> tabindex="1" /><label for="addtodigest">��������</label></p>
<? } } elseif($action == 'edit' && $auditstatuson) { ?>
<p><input type="checkbox" name="audit" id="audit" value="1"><label for="audit">ͨ�����</label></p>
<? } if($uchome['addfeed'] && $ucappopen['UCHOME'] && $forum['allowfeed']) { ?>
<p><input type="checkbox" name="addfeed" id="addfeed" value="1" <?=$addfeedcheck?>><label for="addfeed">�����¼�</label></p>
<? } if($action == 'newthread' || $action == 'edit' && $isfirstpost) { ?>
<p><input type="checkbox" name="hiddenreplies" id="hiddenreplies"<? if($hiddenreplies) { ?> checked="checked"<? } ?> value="1"><label for="hiddenreplies">���������߿ɼ�</label></p>
<? } if($action == 'newthread' && $allowpostrushreply) { ?>
<p><input type="checkbox" name="rushreply" id="rushreply" value="1"><label for="rushreply">��¥��</label></p>
<? } if($action == 'edit' && getstatus($thread['status'], 3)) { ?>
<p><input type="checkbox" disabled="disabled" checked="checked"><label for="rushreply">��¥��</label></p>
<? } ?>
</td>
</tr>
</table><br />
</div>
<div class="btnbar">
<span>
<? if($action == 'newthread' && $sitemessage['newthread'] || $action == 'reply' && $sitemessage['reply']) { ?>
<a href="javascript:;" id="custominfo" class="right"><img src="<?=IMGDIR?>/info.gif" alt="����" /></a>
<? } ?>
</span>
<button type="submit" id="postsubmit" prompt="post_submit"  value="true" name="<? if($action == 'newthread') { ?>topicsubmit<? } elseif($action == 'reply') { ?>replysubmit<? } elseif($action == 'edit') { ?>editsubmit<? } ?>" tabindex="1">
<? if($action == 'newthread') { if($special == 0) { ?>���»���
<? } elseif($special == 1) { ?>����ͶƱ
<? } elseif($special == 2) { ?>������Ʒ
<? } elseif($special == 3) { ?>��������
<? } elseif($special == 4) { ?>�����
<? } elseif($special == 5) { ?>��������
<? } elseif($special == 127) { if($buttontext) { ?><?=$buttontext?><? } else { ?>���»���<? } } } elseif($action == 'reply' && !empty($addtrade)) { ?>�����Ʒ
<? } elseif($action == 'reply') { ?>����/�ظ�����
<? } elseif($action == 'edit') { ?>�༭����
<? } ?>
</button>
<? if($action != 'edit' && ($secqaacheck || $seccodecheck)) { if($secqaacheck) { ?>
<input name="secanswer" id="secanswer" type="text" autocomplete="off" style="width:50px" value="��֤�ʴ�" class="txt" href="ajax.php?action=updatesecqaa" tabindex="1">
<span id="checksecanswer"><img src="images/common/none.gif" width="16" height="16"></span>
<? } if($seccodecheck) { ?>
<input name="seccodeverify" id="seccodeverify_<?=CURSCRIPT?>" type="text" autocomplete="off" style="width:50px" value="��֤��" class="txt" href="ajax.php?action=updateseccode" tabindex="1">
<a href="javascript:;" onclick="updateseccode();doane(event);">��һ��</a>
<span id="checkseccodeverify_<?=CURSCRIPT?>"><img src="images/common/none.gif" width="16" height="16"></span>
<? } ?>

<script type="text/javascript" reload="1">
var profile_seccode_invalid = '��֤�����������������д��';
var profile_secanswer_invalid = '��֤�ʴ�ش������������д��';
var lastseccode = lastsecanswer = secfocus ='';
var secanswerObj = $('secanswer');
var seccodeObj = $('seccodeverify_<?=CURSCRIPT?>');
var secstatus = {'secanswer':0,'seccodeverify_<?=CURSCRIPT?>':0};

if(secanswerObj) {
secanswerObj.onclick = secanswerObj.onfocus = showIdentifying;
secanswerObj.onblur = function(e) {if(!secfocus) $('secanswer_menu').style.display='none';checksecanswer();doane(e);};
}

if(seccodeObj) {
seccodeObj.onclick = seccodeObj.onfocus = showIdentifying;
seccodeObj.onblur = function(e) {if(!secfocus) $('seccodeverify_<?=CURSCRIPT?>_menu').style.display='none';checkseccode();doane(e);};
}

function showIdentifying(e) {
var obj = BROWSER.ie ? event.srcElement : e.target;
if(!$(obj.id + '_menu')) {
obj.value = '';
ajaxmenu($(obj.id), 0, 1, 3, '12', function() {
secstatus[obj.id] = 1;
$(obj.id + '_menu').onmouseover = function() { secfocus = 1; }
$(obj.id + '_menu').onmouseout = function() { secfocus = '';$(obj.id).focus(); }
});
} else if(secstatus[obj.id] == 1) {
$(obj.id + '_menu').style.display = '';
}
obj.unselectable = 'off';
obj.focus();
doane(e);
}

function updateseccode(op) {
if(isUndefined(op)) {
ajaxget('ajax.php?action=updateseccode', seccodeObj.id + '_menu', 'ajaxwaitid', '', '', '$(seccodeObj.id + \'_menu\').style.display = \'\'');
} else {
window.document.seccodeplayer.SetVariable("isPlay", "1");
}
seccodeObj.focus();
}

function checkseccode() {
var seccodeverify = seccodeObj.value;
if(seccodeverify == lastseccode) {
return;
} else {
lastseccode = seccodeverify;
}
var cs = $('checkseccodeverify_<?=CURSCRIPT?>');
<? if($seccodedata['type'] != 1) { ?>
if(!(/[0-9A-Za-z]{4}/.test(seccodeverify))) {
warning(cs, profile_seccode_invalid);
return;
}
<? } else { ?>
if(seccodeverify.length != 2) {
warning(cs, profile_seccode_invalid);
return;
}
<? } ?>
ajaxresponse('checkseccodeverify_<?=CURSCRIPT?>', 'action=checkseccode&seccodeverify=' + (BROWSER.ie && document.charset == 'utf-8' ? encodeURIComponent(seccodeverify) : seccodeverify));
}

function checksecanswer() {
        var secanswer = secanswerObj.value;
if(secanswer == lastsecanswer) {
return;
} else {
lastsecanswer = secanswer;
}
ajaxresponse('checksecanswer', 'action=checksecanswer&secanswer=' + (BROWSER.ie && document.charset == 'utf-8' ? encodeURIComponent(secanswer) : secanswer));
}

function ajaxresponse(objname, data) {
var x = new Ajax('XML', objname);
x.get('ajax.php?inajax=1&' + data, function(s){
        var obj = $(objname);
        if(s.substr(0, 7) == 'succeed') {
        	obj.style.display = '';
                obj.innerHTML = '<img src="<?=IMGDIR?>/check_right.gif" width="16" height="16" />';
obj.className = "warning";
} else {
warning(obj, s);
}
});
}

function warning(obj, msg) {
if((ton = obj.id.substr(5, obj.id.length)) != 'password2') {
$(ton).select();
}
obj.style.display = '';
obj.innerHTML = '<img src="<?=IMGDIR?>/check_error.gif" width="16" height="16" />';
obj.className = "warning";
}
</script><? } ?>
</div>
<?=$pluginhooks['post_bottom']?>
</div>
</div>
</form>

</div></div></div>

<div id="<?=$editorid?>_menus" class="editorrow" style="overflow: hidden; margin-top: -5px; height: 0; border: none; background: transparent;"><div class="editortoolbar">
<div class="popupmenu_popup simple_menu" id="<?=$editorid?>_cmd_simple_menu" style="display: none">
<ul unselectable="on">
<li id="<?=$editorid?>_cmd_bold" onclick="discuzcode('bold')" unselectable="on">����</li>
<li id="<?=$editorid?>_cmd_italic" onclick="discuzcode('italic')" unselectable="on">б��</li>
<li id="<?=$editorid?>_cmd_underline" onclick="discuzcode('underline')" unselectable="on">�»���</li>
<li id="<?=$editorid?>_cmd_strikethrough" onclick="discuzcode('strikethrough')" unselectable="on">ɾ����</li>
<li id="<?=$editorid?>_cmd_inserthorizontalrule" onclick="discuzcode('inserthorizontalrule')" unselectable="on">�ָ���</li>
</ul>
</div><? $fontoptions = array("����_GB2312", "����", "����_GB2312", "����", "������", "΢���ź�", "Trebuchet MS", "Tahoma", "Arial", "Impact", "Verdana", "Times New Roman") ?><div class="popupmenu_popup fontname_menu" id="<?=$editorid?>_cmd_fontname_menu" style="display: none">
<ul unselectable="on"><? if(is_array($fontoptions)) { foreach($fontoptions as $fontname) { ?><li onclick="discuzcode('fontname', '<?=$fontname?>')" style="font-family: <?=$fontname?>" unselectable="on"><?=$fontname?></li><? } } ?></ul>
</div><? $sizeoptions = array(1, 2, 3, 4, 5, 6, 7) ?><div class="popupmenu_popup fontsize_menu" id="<?=$editorid?>_cmd_fontsize_menu" style="display: none">
<ul unselectable="on"><? if(is_array($sizeoptions)) { foreach($sizeoptions as $size) { ?><li onclick="discuzcode('fontsize', <?=$size?>)" unselectable="on"><font size="<?=$size?>" unselectable="on"><?=$size?></font></li><? } } ?></ul>
</div>

<div class="popupmenu_popup simple_menu" id="<?=$editorid?>_cmd_paragraph_menu" style="display: none">
<ul unselectable="on">
<li><a id="<?=$editorid?>_cmd_justifycenter" onclick="discuzcode('justifycenter')" unselectable="on">����</a></li>
<li><a id="<?=$editorid?>_cmd_justifyleft" onclick="discuzcode('justifyleft')" unselectable="on">����</a></li>
<li><a id="<?=$editorid?>_cmd_justifyright" onclick="discuzcode('justifyright')" unselectable="on">����</a></li>
<li><a id="<?=$editorid?>_cmd_autotypeset" onclick="discuzcode('autotypeset')" unselectable="on">�Զ��Ű�</a></li>
</ul>
</div>

<div class="popupmenu_popup simple_menu" id="<?=$editorid?>_cmd_list_menu" style="display: none">
<ul unselectable="on">
<li id="<?=$editorid?>_cmd_insertorderedlist" onclick="discuzcode('insertorderedlist')" unselectable="on">������б�</li>
<li id="<?=$editorid?>_cmd_insertunorderedlist" onclick="discuzcode('insertunorderedlist')" unselectable="on">δ�����б�</li>
</ul>
</div>

</div><?
$creditstring = <<<EOF

EOF;
 if(is_array($postattachcredits)) { foreach($postattachcredits as $id => $credit) { if($credit != '') { 
$creditstring .= <<<EOF
{$extcredits[$id]['title']} 
EOF;
 if($credit >= 0) { 
$creditstring .= <<<EOF
+{$credit}
EOF;
 } else { 
$creditstring .= <<<EOF
{$credit}
EOF;
 } 
$creditstring .= <<<EOF
 {$extcredits[$id]['unit']} &nbsp;
EOF;
 } } } 
$creditstring .= <<<EOF

EOF;
?>
<div class="popupmenu_popup uploadfile" id="<?=$editorid?>_cmd_image_menu" style="display: none" unselectable="on">
<div class="float_ctrl"><span><a href="javascript:;" class="float_close" onclick="hideMenu()">�ر�</a></span></div>
<ul class="imguptype" id="<?=$editorid?>_cmd_image_ctrl">
<li><a href="javascript:;" hidefocus="true" class="current" id="<?=$editorid?>_btn_www" onclick="switchImagebutton('www');">����ͼƬ</a></li>
<? if($allowpostimg) { ?>
<li><a href="javascript:;" hidefocus="true" id="<?=$editorid?>_btn_imgattachlist" onclick="switchImagebutton('imgattachlist');">ͼƬ�б�</a></li>
<? if($swfupload != 1 && $allowuploadnum) { ?><li><a href="javascript:;" hidefocus="true" id="<?=$editorid?>_btn_local" onclick="switchImagebutton('local');">��ͨ�ϴ�</a></li><? } if($swfupload != 0 && $allowuploadnum) { ?><li><a href="javascript:;" hidefocus="true" id="<?=$editorid?>_btn_multi" onclick="switchImagebutton('multi');">�����ϴ�</a></li><? } } ?>
</ul>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_www">
<table cellpadding="0" cellspacing="0" width="100%">
<tr>
<th width="74%">������ͼƬ��ַ</th>
<th width="13%">��(��ѡ)</th>
<th width="13%">��(��ѡ)</th>
</tr>
<tr>
<td><input type="text" id="<?=$editorid?>_cmd_image_param_1" style="width: 95%;" value="" class="txt" /></td>
<td><input id="<?=$editorid?>_cmd_image_param_2" size="5" value="" class="txt" /></td>
<td><input id="<?=$editorid?>_cmd_image_param_3" size="5" value="" class="txt" /></td>
</tr>
<tr>
<td colspan="3" align="center"><input type="button" id="<?=$editorid?>_cmd_image_submit" value="�ύ" /> &nbsp; <input onclick="hideMenu();" value="ȡ��" type="button" /></td>
</tr>
</table>
</div>
<? if($allowpostimg) { if($swfupload != 1) { ?>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_local" style="display: none;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tbody id="imgattachbodyhidden" style="display:none"><tr>
<td class="attachnum"><span id="imglocalno[]"><img src="images/attachicons/common_new.gif" /></span></td>
<td class="attachname">
<span id="imgdeschidden[]" style="display:none">
<span id="imglocalfile[]"></span>
</span>
<input type="hidden" name="imglocalid[]" />
</td>
<td class="attachdel"><span id="imgcpdel[]"></span></td>
</tr></tbody>
</table>
<div class="post_tablelist"><table cellpadding="0" cellspacing="0" summary="post_attachbody" border="0" width="100%"><tbody id="imgattachbody"></tbody></table></div>
<div class="uploadblock">
<div id="imgattachbtnhidden" style="display:none"><span><form name="imgattachform" id="imgattachform" method="post" action="misc.php?action=swfupload&amp;operation=upload&amp;simple=1&amp;type=image" target="attachframe" <?=$enctype?>><input type="hidden" name="uid" value="<?=$discuz_uid?>"><input type="hidden" name="hash" value="<? echo md5(substr(md5($_DCACHE['settings']['authkey']), 8).$discuz_uid); ?>"><input type="file" name="Filedata" size="45" class="filedata" /></form></span></div>
<div id="imgattachbtn"></div>
<p id="imguploadbtn"><input type="button" value="�ϴ�" onclick="uploadAttach(0, 0, 'img')" /> &nbsp; <input type="button" value="ȡ��" onclick="hideMenu();" /></p>
<p id="imguploading" style="display: none;"><img src="<?=IMGDIR?>/uploading.gif" style="vertical-align: middle;" /> �ϴ��У����Ժ�������<a href="javascript:;" onclick="hideMenu()">��ʱ�ر����С����</a>���ϴ���ɺ������յ�֪ͨ��</p>
</div>
<div class="notice uploadinfo">
�ļ��ߴ�: <strong><? if($maxattachsize) { ?>С�� <?=$maxattachsize_mb?> <? } else { ?>��С������<? } ?></strong>&nbsp;
<? if($maxattachnum || $maxsizeperday) { ?>
�ϴ�����: <? if($maxattachnum) { ?><strong><?=$allowuploadnum?></strong> ���ļ�&nbsp;<? } if($maxsizeperday) { ?><strong><?=$allowuploadsize?></strong>&nbsp;<? } } if($imgexts) { ?>
<br />������չ��: <strong><?=$imgexts?></strong>&nbsp;
<? } if($creditstring) { ?>
<br /><a href="faq.php?action=credits&amp;fid=<?=$fid?>" target="_blank" title="����˵��">ÿ�ϴ�һ����������&nbsp;<?=$creditstring?></a>
<? } ?>
</div>
</div>
<? } if($swfupload != 0) { ?>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_multi" style="display: none;">
<div class="floatboxswf" id="<?=$editorid?>_multiimg">
<script type="text/javascript">
$('<?=$editorid?>_multiimg').innerHTML = AC_FL_RunContent(
'width', '470', 'height', '268',
'src', 'images/common/upload.swf?site=<?=$boardurl?>misc.php%3Ftype=image&type=image',
'quality', 'high',
'id', 'swfupload',
'menu', 'false',
'allowScriptAccess', 'always',
'wmode', 'transparent'
);
</script>
</div>
<div class="notice uploadinfo">
�ļ��ߴ�: <strong><? if($maxattachsize) { ?>С�� <?=$maxattachsize_mb?> <? } else { ?>��С������<? } ?></strong>&nbsp;
<? if($maxattachnum || $maxsizeperday) { ?>
�ϴ�����: <? if($maxattachnum) { ?><strong><?=$allowuploadnum?></strong> ���ļ�&nbsp;<? } if($maxsizeperday) { ?><strong><?=$allowuploadsize?></strong>&nbsp;<? } } if($imgexts) { ?>
<br />������չ��: <strong><?=$imgexts?></strong>&nbsp;
<? } if($creditstring) { ?>
<br /><a href="faq.php?action=credits&amp;fid=<?=$fid?>" target="_blank" title="����˵��">ÿ�ϴ�һ����������&nbsp;<?=$creditstring?></a>
<? } ?>
</div>
</div>
<? } ?>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_imgattachlist" style="display: none;">
<div class="upfilelist">
<? if($imgattachs['used']) { $imagelist = $imgattachs['used']; include template('ajax_imagelist', '0', ''); } ?>
<div id="imgattachlist">
<? if(!$imgattachs['used'] && !$imgattachs['unused']) { ?>
<p class="notice">������û��ͼƬ����<? if($allowuploadnum) { ?>, <a href="javascript:;" onclick="switchImagebutton('<? if($swfupload != 0) { ?>multi<? } else { ?>local<? } ?>');">�������</a>�ϴ�<? } ?></p>
<? } ?>
</div>
<div id="unusedimgattachlist">
<? if($imgattachs['unused']) { $imagelist = $imgattachs['unused']; ?><p>���������ϴ��ϴ���û��ʹ�õĸ���:<p><? include template('ajax_imagelist', '0', ''); } ?>
</div>
<? if($ucappopen['UCHOME']) { ?>
<p class="notice">���ҵ������ѡ��ͼƬ: <span id="uch_albums"></span></p>
<div id="uch_photoes"></div>
<? } ?>
</div>
<p class="notice" id="imgattach_notice"<? if(!$imgattachs['used'] && !$imgattachs['unused']) { ?> style="display: none"<? } ?>>���ͼƬ���뵽����������</p>
</div>
<? } ?>
</div>

<? if($allowpostattach) { ?>
<div class="popupmenu_popup uploadfile" id="<?=$editorid?>_cmd_attach_menu" style="display: none" unselectable="on">
<div class="float_ctrl"><span><a href="javascript:;" class="float_close" onclick="hideMenu()">�ر�</a></span></div>
<ul class="imguptype" id="<?=$editorid?>_cmd_attach_ctrl">
<li><a href="javascript:;" hidefocus="true" class="current" id="<?=$editorid?>_btn_attachlist" onclick="switchAttachbutton('attachlist');">�����б�</a></li>
<? if($swfupload != 1 && $allowuploadnum) { ?><li><a href="javascript:;" hidefocus="true" id="<?=$editorid?>_btn_upload" onclick="switchAttachbutton('upload');">��ͨ�ϴ�</a></li><? } if($swfupload != 0 && $allowuploadnum) { ?><li><a href="javascript:;" hidefocus="true" id="<?=$editorid?>_btn_swfupload" onclick="switchAttachbutton('swfupload');">�����ϴ�</a></li><? } ?>
</ul>
<? if($swfupload != 1) { ?>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_upload" style="display: none;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tbody id="attachbodyhidden" style="display:none"><tr>
<td class="attachnum"><span id="localno[]"><img src="images/attachicons/common_new.gif" /></span></td>
<td class="attachname">
<span id="deschidden[]" style="display:none">
<span id="localfile[]"></span>
</span>
<input type="hidden" name="localid[]" />
</td>
<td class="attachdel"><span id="cpdel[]"></span></td>
</tr></tbody>
</table>
<div class="post_tablelist"><table cellpadding="0" cellspacing="0" summary="post_attachbody" border="0" width="100%"><tbody id="attachbody"></tbody></table></div>
<div class="uploadblock">
<div id="attachbtnhidden" style="display:none"><span><form name="attachform" id="attachform" method="post" action="misc.php?action=swfupload&amp;operation=upload&amp;simple=1" target="attachframe" <?=$enctype?>><input type="hidden" name="uid" value="<?=$discuz_uid?>"><input type="hidden" name="hash" value="<? echo md5(substr(md5($_DCACHE['settings']['authkey']), 8).$discuz_uid); ?>"><input type="file" name="Filedata" size="45" class="filedata" /></form></span></div>
<div id="attachbtn"></div>
<p id="uploadbtn"><input type="button" value="�ϴ�" onclick="uploadAttach(0, 0)" /> &nbsp; <input type="button" value="ȡ��" onclick="hideMenu();" /></p>
<p id="uploading" style="display: none;"><img src="<?=IMGDIR?>/uploading.gif" style="vertical-align: middle;" /> �ϴ��У����Ժ�������<a href="javascript:;" onclick="hideMenu()">��ʱ�ر����С����</a>���ϴ���ɺ������յ�֪ͨ��</p>
</div>
<div class="notice uploadinfo">
�ļ��ߴ�: <strong><? if($maxattachsize) { ?>С�� <?=$maxattachsize_mb?> <? } else { ?>��С������<? } ?></strong>&nbsp;
<? if($maxattachnum || $maxsizeperday) { ?>
�ϴ�����: <? if($maxattachnum) { ?><strong><?=$allowuploadnum?></strong> ���ļ�&nbsp;<? } if($maxsizeperday) { ?><strong><?=$allowuploadsize?></strong>&nbsp;<? } } if($attachextensions) { ?>
<br />������չ��: <strong><?=$attachextensions?></strong>&nbsp;
<? } if($creditstring) { ?>
<br /><a href="faq.php?action=credits&amp;fid=<?=$fid?>" target="_blank" title="����˵��">ÿ�ϴ�һ����������&nbsp;<?=$creditstring?></a>
<? } ?>
</div>
<iframe name="attachframe" id="attachframe" style="display: none;" onload="uploadNextAttach();"></iframe>
</div>
<? } if($swfupload != 0) { ?>
<div class="popupmenu_option" unselectable="on" id="<?=$editorid?>_swfupload" style="display: none;">
<div class="floatboxswf" id="<?=$editorid?>_multiattach">
<script type="text/javascript">
$('<?=$editorid?>_multiattach').innerHTML = AC_FL_RunContent(
'width', '470', 'height', '268',
'src', 'images/common/upload.swf?site=<?=$boardurl?>misc.php',
'quality', 'high',
'id', 'swfupload',
'menu', 'false',
'allowScriptAccess', 'always',
'wmode', 'transparent'
);
</script>
</div>
<div class="notice uploadinfo">
�ļ��ߴ�: <strong><? if($maxattachsize) { ?>С�� <?=$maxattachsize_mb?> <? } else { ?>��С������<? } ?></strong>&nbsp;
<? if($maxattachnum || $maxsizeperday) { ?>
�ϴ�����: <? if($maxattachnum) { ?><strong><?=$allowuploadnum?></strong> ���ļ�&nbsp;<? } if($maxsizeperday) { ?><strong><?=$allowuploadsize?></strong>&nbsp;<? } } if($attachextensions) { ?>
<br />������չ��: <strong><?=$attachextensions?></strong>&nbsp;
<? } if($creditstring) { ?>
<br /><a href="faq.php?action=credits&amp;fid=<?=$fid?>" target="_blank" title="����˵��">ÿ�ϴ�һ����������&nbsp;<?=$creditstring?></a>
<? } ?>
</div>
</div>
<? } ?>
<div class="popupmenu_option post_tablelist" unselectable="on" id="<?=$editorid?>_attachlist">
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="attach_tblheader"<? if(!$attachs['used'] && !$attachs['unused']) { ?> style="display: none"<? } ?>>
<tr>
<td class="attachnum"></td>
<td class="attachname">�ļ���</td>
<td class="attachdesc">����</td>
<? if($allowsetattachperm) { ?><td class="attachview" style="width: 52px;">�Ķ�Ȩ��</td><? } if($maxprice) { ?><td class="attachpr"><?=$extcredits[$creditstransextra['1']]['title']?></td><? } ?>
<td class="attachdel"></td>
</tr>
</table>
<div class="upfilelist">
<? if($attachs['used']) { $attachlist = $attachs['used']; include template('ajax_attachlist', '0', ''); } ?>
<div id="attachlist">
<? if(!$attachs['used'] && !$attachs['unused']) { ?>
<p class="notice">������û�и���<? if($allowuploadnum) { ?>, <a href="javascript:;" onclick="switchAttachbutton('<? if($swfupload != 0) { ?>swfupload<? } else { ?>upload<? } ?>');">�������</a>�ϴ�<? } ?></p>
<? } ?>
</div>
<div id="unusedattachlist">
<? if($attachs['unused']) { $attachlist = $attachs['unused']; ?><table cellpadding="0" cellspacing="0" width="100%"><tr><td class="attachnum"></td><td>���������ϴ��ϴ���û��ʹ�õĸ���:</td></tr></table><? include template('ajax_attachlist', '0', ''); } ?>
</div>
</div>
<p class="notice" id="attach_notice"<? if(!$attachs['used'] && !$attachs['unused']) { ?> style="display: none"<? } ?>>����ļ������뵽����������</p>
<? if($maxprice && $maxincperthread) { ?><p class="notice">�������������������Ϊ <?=$maxincperthread?> <?=$extcredits[$creditstransextra['1']]['unit']?>&nbsp;&nbsp;&nbsp;&nbsp;</p><? } ?>
</div>
</div>
<? } ?>

<script src="forumdata/cache/smilies_var.js?<?=VERHASH?>" type="text/javascript"></script>
<script type="text/javascript">smilies_show('smiliesdiv', <?=$smcols?>, editorid + '_cmd_');</script>
<script type="text/javascript">
if(wysiwyg) {
newEditor(1, bbcode2html(textobj.value));
} else {
newEditor(0, textobj.value);
}

var ATTACHNUM = {'imageused':0,'imageunused':0,'attachused':0,'attachunused':0};
<? if($allowpostimg) { ?>
function switchImagebutton(btn) {
var btns = ['www'];
btns.push('imgattachlist');
<? if($swfupload != 1) { ?>btns.push('local');<? } if($swfupload != 0) { ?>btns.push('multi');<? } ?>
switchButton(btn, btns);
}
ATTACHNUM['imageused'] = <? echo count($imgattachs['used']); ?>;
ATTACHNUM['imageunused'] = <? echo count($imgattachs['unused']); ?>;
<? if($imgattachs['used'] || $imgattachs['unused']) { ?>
switchImagebutton('imgattachlist');
$(editorid + '_cmd_image').evt = false;
updateattachnum('image');
<? } else { ?>
switchImagebutton('<? if($swfupload != 0) { ?>multi<? } else { ?>local<? } ?>');
<? } } if($allowpostattach) { ?>
function switchAttachbutton(btn) {
var btns = ['attachlist'];
<? if($swfupload != 1) { ?>btns.push('upload');<? } if($swfupload != 0) { ?>btns.push('swfupload');<? } ?>
switchButton(btn, btns);
}
ATTACHNUM['attachused'] = <? echo count($attachs['used']); ?>;
ATTACHNUM['attachunused'] = <? echo count($attachs['unused']); ?>;
<? if($attachs['used'] || $attachs['unused']) { ?>
$(editorid + '_cmd_attach').evt = false;
updateattachnum('attach');
<? } else { ?>
switchAttachbutton('<? if($swfupload != 0) { ?>swfupload<? } else { ?>upload<? } ?>');
<? } } if($attachs['unused'] || $imgattachs['unused']) { ?>
var msg = '���������ϴ��ϴ���û��ʹ�õĸ���:<div style="<? if(count($attachs['unused']) + count($imgattachs['unused']) > 10) { ?>height:10em;<? } ?>overflow-y:auto;overflow-x:hidden">'<? if(is_array($attachs['unused'])) { foreach($attachs['unused'] as $attach) { ?>+ '&nbsp;&nbsp;&nbsp;&nbsp;<span title="<?=$attach['filenametitle']?> <?=$attach['dateline']?>"><?=$attach['filename']?></span><br />'<? } } if(is_array($imgattachs['unused'])) { foreach($imgattachs['unused'] as $attach) { ?>+ '&nbsp;&nbsp;&nbsp;&nbsp;<span title="<?=$attach['filenametitle']?> <?=$attach['dateline']?>"><?=$attach['filename']?></span><br />'<? } } ?>+ '</div><div class="alert_btn"><input type="button" id="fwin_dialog_submit" onclick="hideMenu(\'fwin_dialog\', \'dialog\')" value="&nbsp;ʹ��&nbsp;" /> <input type="button" onclick="$(\'unusedimgattachlist\').parentNode.removeChild($(\'unusedimgattachlist\'));$(\'unusedattachlist\').parentNode.removeChild($(\'unusedattachlist\'));hideMenu(\'fwin_dialog\', \'dialog\');ATTACHNUM[\'imageunused\']=0;ATTACHNUM[\'attachunused\']=0;updateattachnum(\'image\');updateattachnum(\'attach\');" value="&nbsp;����&nbsp;" /></div>';
showDialog(msg, 'info', '', '', 1);
<? } if($ucappopen['UCHOME']) { ?>
if($('uch_albums') && $('uch_albums').innerHTML == '') {
ajaxget('api/uchome.php?action=getalbums', 'uch_albums');
}
<? } ?>
setCaretAtEnd();
if(BROWSER.ie >= 5 || BROWSER.firefox >= 2) {
_attachEvent(window, 'beforeunload', saveData);
}
<? if(!empty($cedit) && $cedit == 'yes') { ?>
loadData(1);
<? } ?>
</script></div>

<? if($special) { ?>
<script src="<?=$jspath?>calendar.js?<?=VERHASH?>" type="text/javascript"></script>
<? } ?>
<script type="text/javascript">

var postminchars = parseInt('<?=$minpostsize?>');
var postmaxchars = parseInt('<?=$maxpostsize?>');
var disablepostctrl = parseInt('<?=$disablepostctrl?>');
var seccodecheck = parseInt('<?=$seccodecheck?>');
var secqaacheck = parseInt('<?=$secqaacheck?>');
var typerequired = parseInt('<?=$forum['threadtypes']['required']?>');
var special = parseInt('<?=$special?>');
var isfirstpost = <? if($isfirstpost) { ?>1<? } else { ?>0<? } ?>;
var allowposttrade = parseInt('<?=$allowposttrade?>');
var allowpostreward = parseInt('<?=$allowpostreward?>');
var allowpostactivity = parseInt('<?=$allowpostactivity?>');
var sortid = parseInt('<?=$sortid?>');
var special = parseInt('<?=$special?>');

<? if($isfirstpost && $forum['threadtypes']['types']) { ?>
simulateSelect('typeid');
<? } if(!$isfirstpost && $thread['special'] == 5 && empty($firststand) && $action != 'edit') { ?>
simulateSelect('stand');
<? } if(!$special && $forum['threadsorts'] && ($action == 'newthread' || $action == 'edit' && $isfirstpost && !$thread['sortid'])) { ?>
simulateSelect('sortid');
function switchsort() {
if($('sortid').value) {
saveData(1);
<? if($isfirstpost && $sortid) { ?>
ajaxget('post.php?action=threadsorts&sortid=' + $('sortid').value + '&fid=<?=$fid?>&allowpostimg=<?=$allowpostimg?><? if(!empty($modelid)) { ?>&modelid=<?=$modelid?><? } if(!empty($modthreadkey)) { ?>&modthreadkey=<?=$modthreadkey?><? } ?>', 'threadsorts', 'threadsortswait')
<? } else { ?>
location.href = 'post.php?action=<?=$action?>&fid=<?=$fid?><? if(!empty($tid)) { ?>&tid=<?=$tid?><? } if(!empty($pid)) { ?>&pid=<?=$pid?><? } if(!empty($modelid)) { ?>&modelid=<?=$modelid?><? } ?>&extra=<?=$extra?><? if(!$sortid) { ?>&cedit=yes<? } ?>&sortid=' + $('sortid').value;
<? } ?>
Editorwin = 0;
}
}
<? } if($isfirstpost && $sortid) { ?>
ajaxget('post.php?action=threadsorts&sortid=<?=$sortid?>&fid=<?=$fid?>&allowpostimg=<?=$allowpostimg?><? if(!empty($tid)) { ?>&tid=<?=$tid?><? } ?>&inajax=1<? if(!empty($modthreadkey)) { ?>&modthreadkey=<?=$modthreadkey?><? } ?>', 'threadsorts', 'threadsortswait', 'threadsortswait');
<? } if($action == 'newthread' && $sitemessage['newthread'] || $action == 'reply' && $sitemessage['reply']) { ?>
showPrompt('custominfo', 'click', '<? if($action == 'newthread') { echo trim($sitemessage['newthread'][array_rand($sitemessage['newthread'])]); } elseif($action == 'reply') { echo trim($sitemessage['reply'][array_rand($sitemessage['reply'])]); } ?>', <?=$sitemessage['time']?>);
<? } if($swfupload != 1 && $allowpostattach) { ?>addAttach();<? } if($swfupload != 1 && $allowpostimg) { ?>addAttach('img');<? } ?>

</script>
</div><? if(!empty($plugins['jsmenu'])) { ?>
<ul class="popupmenu_popup headermenu_popup" id="plugin_menu" style="display: none"><? if(is_array($plugins['jsmenu'])) { foreach($plugins['jsmenu'] as $module) { ?>     <? if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?>
     <li><?=$module['url']?></li>
     <? } } } ?></ul>
<? } if(is_array($subnavs)) { foreach($subnavs as $subnav) { ?><?=$subnav?><? } } if($prompts['newbietask'] && $newbietasks) { include template('task_newbie_js', '0', ''); } if($admode && !empty($advlist)) { ?>
<div class="ad_footerbanner" id="ad_footerbanner1"><?=$advlist['footerbanner1']?></div><? if($advlist['footerbanner2']) { ?><div class="ad_footerbanner" id="ad_footerbanner2"><?=$advlist['footerbanner2']?></div><? } if($advlist['footerbanner3']) { ?><div class="ad_footerbanner" id="ad_footerbanner3"><?=$advlist['footerbanner3']?></div><? } } else { ?>
<div id="ad_footerbanner1"></div><div id="ad_footerbanner2"></div><div id="ad_footerbanner3"></div>
<? } ?>

<?=$pluginhooks['global_footer']?>
<div id="footer">
<div class="wrap s_clear">
<div id="footlink">
<p>
<strong><a href="<?=$siteurl?>" target="_blank"><?=$sitename?></a></strong>
<? if($icp) { ?>( <a href="http://www.miibeian.gov.cn/" target="_blank"><?=$icp?></a>)<? } ?>
<span class="pipe">|</span><a href="mailto:<?=$adminemail?>">��ϵ����</a>
<? if($allowviewstats) { ?><span class="pipe">|</span><a href="stats.php">��̳ͳ��</a><? } if($archiverstatus) { ?><span class="pipe">|</span><a href="archiver/" target="_blank">Archiver</a><? } if($wapstatus) { ?><span class="pipe">|</span><a href="wap/" target="_blank">WAP</a><? } if($statcode) { ?><span class="pipe">| <?=$statcode?></span><? } ?>
<?=$pluginhooks['global_footerlink']?>
</p>
<p class="smalltext">
GMT<?=$timenow['offset']?>, <?=$timenow['time']?>
<? if(debuginfo()) { ?>, <span id="debuginfo">Processed in <?=$debuginfo['time']?> second(s), <?=$debuginfo['queries']?> queries<? if($gzipcompress) { ?>, Gzip enabled<? } ?></span><? } ?>.
</p>
</div>
<div id="rightinfo">
<p>Powered by <strong><a href="http://www.discuz.net" target="_blank">Discuz!</a></strong> <em><?=$version?></em><? if(!empty($boardlicensed)) { ?> <a href="http://license.comsenz.com/?pid=1&amp;host=<?=$_SERVER['HTTP_HOST']?>" target="_blank">Licensed</a><? } ?></p>
<p class="smalltext">&copy; 2001-2009 <a href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a></p>
</div><? updatesession(); ?></div>
</div>
<? if($_DCACHE['settings']['frameon'] && in_array(CURSCRIPT, array('index', 'forumdisplay', 'viewthread')) && $_DCOOKIE['frameon'] == 'yes') { ?>
<script src="<?=$jspath?>iframe.js?<?=VERHASH?>" type="text/javascript"></script>
<? } output(); ?></body>
</html>