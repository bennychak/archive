<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('forumdisplay');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/forumdisplay.htm', 'C:\xampp\htdocs\bbs\./templates/default/header.htm', 1283181768, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/forumdisplay.htm', 'C:\xampp\htdocs\bbs\./templates/default/recommend.htm', 1283181768, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/forumdisplay.htm', 'C:\xampp\htdocs\bbs\./templates/default/footer.htm', 1283181768, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/forumdisplay.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283181768, '2', './templates/uchome')
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
<?=$pluginhooks['global_header']?><? if($forum['ismoderator']) { ?>
<script src="<?=$jspath?>moderate.js?<?=VERHASH?>" type="text/javascript"></script>
<? } ?>

<div id="nav"><a id="fjump" href="<?=$indexname?>"<? if($forumjump == 1) { ?> class="dropmenu" onmouseover="showMenu({'ctrlid':this.id})"<? } ?>><?=$bbname?></a> <?=$navigation?></div>

<? if($admode && !empty($advlist['text'])) { ?>
<div id="ad_text" class="ad_text" >
<table summary="Text Ad" cellpadding="0" cellspacing="0"><?=$advlist['text']?></table>
</div>
<? } else { ?>
<div id="ad_text"></div>
<? } ?>

<div id="wrap"<? if($infosidestatus['allow'] < 2) { ?> class="wrap s_clear"<? } else { ?> class="wrap with_side s_clear"<? } ?>>
<? if($infosidestatus['allow'] == 2) { ?>
<a id="sidebar_img" href="javascript:;" onclick="sidebar_collapse(['�򿪱���', '�رձ���']);" class="<?=$collapseimg['sidebar']?>"><? if($collapseimg['sidebar'] == 'collapsed_yes') { ?>�򿪱���<? } else { ?>�رձ���<? } ?></a>
<? } elseif($infosidestatus['allow'] == 1) { ?>
<a id="sidebar_img" href="javascript:;" onclick="sidebar_collapse(['', '�رձ���']);" class="collapsed_yes">�򿪱���</a>
<? } ?>
<div class="main">
<div class="content">
<?=$pluginhooks['forumdisplay_header']?>
<div id="forumheader" class="s_clear">
<h1 style="<? if($forum['extra']['namecolor']) { ?>color: <?=$forum['extra']['namecolor']?>;<? } ?>"><?=$forum['name']?></h1>
<p class="forumstats">[ <strong><?=$forum['threads']?></strong> ���� / <? echo $forum['posts']-$forum['threads']; ?> �ظ� ]</p>
<div class="forumaction">
<div class="right">
<?=$pluginhooks['forumdisplay_forumaction']?>
<? if($discuz_uid) { ?>
<a href="my.php?item=attention&amp;type=forum&amp;action=add&amp;fid=<?=$fid?>" id="ajax_attention" class="attention" onclick="ajaxmenu(this);doane(event);">��ע</a>
<a href="my.php?item=favorites&amp;fid=<?=$fid?>" id="ajax_favorite" onclick="ajaxmenu(this);doane(event);">�ղ�</a>
<? } if($rssstatus) { ?><a href="rss.php?fid=<?=$fid?>&amp;auth=<?=$rssauth?>" target="_blank" class="feed">RSS</a><? } ?>
</div>
<? if($forum['recyclebin'] && $forum['ismoderator']) { ?>
<a href="<? if($adminid == 1) { ?>admincp.php?action=recyclebin&amp;frames=yes<? } elseif($forum['ismoderator']) { ?>modcp.php?action=recyclebins&amp;fid=<?=$fid?><? } ?>" class="recyclebin" target="_blank">����վ</a>
<? } ?>
</div>
<? if($forum['description']) { ?><p class="channelinfo">������: <?=$forum['description']?></p><? } ?>
<p id="modedby">
<? if($forum['ismoderator']) { ?>
<div class="modlink">
<?=$pluginhooks['forumdisplay_modlink']?>
<? if($forum['modworks']) { if($reportnum) { ?><a href="modcp.php?action=report&amp;fid=<?=$fid?>" target="_blank">�û�����(<?=$reportnum?>)</a> |<? } if($modnum) { ?><a href="modcp.php?action=moderate&amp;op=threads&amp;fid=<?=$fid?>" target="_blank">�������(<?=$modnum?>)</a> |<? } if($modusernum) { ?><a href="modcp.php?action=moderate&amp;op=members&amp;fid=<?=$fid?>" target="_blank">������û�(<?=$modusernum?>)</a> |<? } } ?>
<a href="modcp.php?fid=<?=$fid?>" target="_blank">�������</a>
</div>
<? } ?>
����: <? if($moderatedby) { ?><?=$moderatedby?><? } else { ?>*��ȱ��*<? } ?>
</p>
</div>
<?=$pluginhooks['forumdisplay_top']?>

<? if($forum['recommendlist'] || $forum['rules']) { ?>
<div id="modarea" class="s_clear">
<div class="list">
<span class="headactions"><img onclick="toggle_collapse('modarea_c');" alt="����/չ��" title="����/չ��" src="<?=IMGDIR?>/<?=$collapseimg['modarea_c']?>.gif" id="modarea_c_img" class="toggle" /></span>
<h3>
<? if($forum['recommendlist']) { ?>
<a href="javascript:;" id="tab_1" class="current" <? if($forum['rules']) { ?> onclick="switchTab('tab', 1, 2)"<? } ?>>�Ƽ�����</a><? if($forum['ismoderator'] && $allowrecommendthread) { ?><a href="modcp.php?action=forums&amp;op=recommend&amp;show=all&amp;fid=<?=$fid?>" target="_blank">[�༭]</a><? } } if($forum['recommendlist'] &&  $forum['rules']) { ?><span class="pipe">|</span><? } if($forum['rules']) { ?><a href="javascript:;" id="tab_2"<? if(!$forum['recommendlist']) { ?> class="current"<? } ?> <? if($forum['recommendlist']) { ?> onclick="switchTab('tab', 2, 2)"<? } ?>>�������</a><? } ?>
</h3>
</div>
<div id="modarea_c" style="<?=$collapse['modarea_c']?>">
<? if($forum['recommendlist']) { ?>
<div id="tab_c_1"><? if($forum['recommendlist']['images']) { ?>
<div style="float: left; width: <?=$forum['modrecommend']['imagewidth']?>px;">
<script type="text/javascript">
var slideSpeed = 5000;
var slideImgsize = [<?=$forum['modrecommend']['imagewidth']?>,<?=$forum['modrecommend']['imageheight']?>];
var slideBorderColor = '<?=SPECIALBORDER?>';
var slideBgColor = '<?=COMMONBG?>';
var slideImgs = new Array();
var slideImgLinks = new Array();
var slideImgTexts = new Array();
var slideSwitchColor = '<?=TABLETEXT?>';
var slideSwitchbgColor = '<?=COMMONBG?>';
var slideSwitchHiColor = '<?=SPECIALBORDER?>';<? if(is_array($forum['recommendlist']['images'])) { foreach($forum['recommendlist']['images'] as $k => $imginfo) { ?>slideImgs[<? echo $k+1; ?>] = "<?=$imginfo['filename']?>";
slideImgLinks[<? echo $k+1; ?>] = "viewthread.php?tid=<?=$imginfo['tid']?>&amp;from=recommend_f";
slideImgTexts[<? echo $k+1; ?>] = "<?=$imginfo['subject']?>";<? } } ?></script>
<script src="include/js/slide.js" type="text/javascript"></script>
</div>
<? } ?>
<div class="inlinelist titlelist s_clear"<? if($forum['recommendlist']['images']) { ?> style="margin-left: <?=$forum['modrecommend']['imagewidth']?>px;"<? } ?>><? unset($forum['recommendlist']['images']); ?><ul><? if(is_array($forum['recommendlist'])) { foreach($forum['recommendlist'] as $rtid => $recommend) { ?><li class="wide"><cite><a href="space.php?uid=<?=$recommend['authorid']?>&amp;from=recommend_f" target="_blank"><?=$recommend['author']?></a></cite><a href="viewthread.php?tid=<?=$rtid?>&amp;from=recommend_f" <?=$recommend['subjectstyles']?> target="_blank"><?=$recommend['subject']?></a></li><? } } ?></ul>
</div></div>
<? } if($forum['rules']) { ?>
<div id="tab_c_2"<? if($forum['recommendlist']) { ?> style="display:none"<? } ?> class="rule"><?=$forum['rules']?></div>
<? } ?>
</div>
</div>
<? } if($subexists) { ?>
<div id="subforum" class="mainbox list"><? include template('forumdisplay_subforum', '0', ''); ?></div>
<? } ?>
<?=$pluginhooks['forumdisplay_middle']?>

<div class="pages_btns s_clear">
<?=$multipage?>
<span <? if($visitedforums) { ?>id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id})"<? } ?> class="pageback"><a href="<?=$indexname?>">������ҳ</a></span>
<span class="postbtn" id="newspecial" prompt="post_newthread" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"><a href="post.php?action=newthread&amp;fid=<?=$fid?>"<? if(!$forum['allowspecialonly']) { ?> onclick="showWindow('newthread', this.href);return false;"<? } ?>>����</a></span>
</div>

<? if($forum['threadtypes'] && $forum['threadtypes']['listable'] || $forum['threadsorts']) { ?>
<div class="threadtype">
<? if($forum['threadtypes'] && $forum['threadtypes']['listable']) { ?>
<p>
<? if($typeid || $sortid) { ?><a href="forumdisplay.php?fid=<?=$fid?>">ȫ��</a><? } else { ?><strong>ȫ��</strong><? } if(is_array($forum['threadtypes']['flat'])) { foreach($forum['threadtypes']['flat'] as $id => $name) { if($typeid != $id) { ?><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=type&amp;typeid=<?=$id?><?=$sortadd?>"><?=$name?></a><? } else { ?><strong><?=$name?></strong><? } ?> <? } } if($forum['threadtypes']['selectbox']) { ?>
<span id="threadtypesmenu" class="dropmenu" onmouseover="showMenu({'ctrlid':this.id})">�������</span>
<div class="popupmenu_popup headermenu_popup" id="threadtypesmenu_menu" style="display: none">
<ul><? if(is_array($forum['threadtypes']['selectbox'])) { foreach($forum['threadtypes']['selectbox'] as $id => $name) { ?><li>
<? if($typeid != $id) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=type&amp;typeid=<?=$id?><?=$sortadd?>"><?=$name?></a>
<? } else { ?>
<strong><?=$name?></strong>
<? } ?>
</li><? } } ?></ul>
</div>
<? } ?>
</p>
<? } if($forum['threadsorts']) { ?>
<p>
<? if(!$forum['threadtypes']['listable']) { if($sortid) { ?><a href="forumdisplay.php?fid=<?=$fid?>">ȫ��</a><? } else { ?><strong>ȫ��</strong><? } } if(is_array($forum['threadsorts']['flat'])) { foreach($forum['threadsorts']['flat'] as $id => $name) { if($sortid != $id) { ?><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=sort&amp;sortid=<?=$id?><?=$typeadd?>"><?=$name?></a><? } else { ?><strong><?=$name?></strong><? } ?> <? } } if($forum['threadsorts']['selectbox']) { ?>
<span id="threadsortsmenu" class="dropmenu" onmouseover="showMenu({'ctrlid':this.id})">�������</span>
<div class="popupmenu_popup headermenu_popup" id="threadsortsmenu_menu" style="display: none">
<ul><? if(is_array($forum['threadsorts']['selectbox'])) { foreach($forum['threadsorts']['selectbox'] as $id => $name) { ?><li>
<? if($sortid != $id) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=sort&amp;sortid=<?=$id?><?=$typeadd?>"><?=$name?></a>
<? } else { ?>
<strong><?=$name?></strong>
<? } ?>
</li><? } } ?></ul>
</div>
<? } ?>
</p>
<? } ?>
</div>
<? } ?>

<div id="threadlist" class="threadlist datalist" style="position: relative;">
<form method="post" name="moderate" id="moderate" action="topicadmin.php?action=moderate&amp;fid=<?=$fid?>&amp;infloat=yes&amp;nopost=yes">
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="listextra" value="<?=$extra?>" />
<table summary="forum_<?=$fid?>" <? if(!$separatepos) { ?>id="forum_<?=$fid?>"<? } ?> cellspacing="0" cellpadding="0" class="datatable">
<thead class="colplural">
<tr>
<td colspan="2">&nbsp;<a href="javascript:;" id="filtertype" class="dropmenu" onclick="showMenu({'ctrlid':this.id});"><? if($filter == poll) { ?>ͶƱ
<? } elseif($filter == trade) { ?>��Ʒ
<? } elseif($filter == activity) { ?>�
<? } elseif($filter == debate) { ?>����
<? } elseif($filter == reward) { ?>����
<? } else { ?>����<? } ?></a></td>
<? if($forum['ismoderator']) { ?><td class="icon">&nbsp;</td><? } ?>
<th>
<ul class="itemfilter s_clear">
<li>����:</li>
<li<? if(!$filter) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>"><span>ȫ��</span></a></li>
<li<? if($filter == 'digest') { ?> class="current"<? } ?>><a class="filter" href="forumdisplay.php?fid=<?=$fid?>&amp;filter=digest"><span>����</span></a></li>
<? if($recommendthread['status']) { ?><li<? if($filter == 'recommend') { ?> class="current"<? } ?>><a class="filter" href="forumdisplay.php?fid=<?=$fid?>&amp;filter=recommend&amp;orderby=recommends"><span>�Ƽ�</span></a></li><? } ?>
<li class="pipe">|</li>
<li>ʱ��:</li>
<li<? if($filter == 86400) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;orderby=<?=$orderby?>&amp;filter=86400<?=$typeadd?><?=$sortadd?>"><span>һ��</span></a></li>
<li<? if($filter == 172800) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;orderby=<?=$orderby?>&amp;filter=172800<?=$typeadd?><?=$sortadd?>"><span>����</span></a></li>
<li<? if($filter == 604800) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;orderby=<?=$orderby?>&amp;filter=604800<?=$typeadd?><?=$sortadd?>"><span>��</span></a></li>
<li<? if($filter == 2592000) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;orderby=<?=$orderby?>&amp;filter=2592000<?=$typeadd?><?=$sortadd?>"><span>��</span></a></li>
<li<? if($filter == 7948800) { ?> class="current"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;orderby=<?=$orderby?>&amp;filter=7948800<?=$typeadd?><?=$sortadd?>"><span>��</span></a></li>
<li class="pipe">|</li>
<li><a class="order <? if($orderby == 'heats' || $orderby == 'recommends') { ?>order_active<? } ?>" href="forumdisplay.php?fid=<?=$fid?>&amp;filter=<?=$filter?>&amp;orderby=<? if($filter == 'recommend') { ?>recommends<? } else { ?>heats<? } ?><?=$typeadd?><?=$sortadd?>">����</a></li>
</ul>
</th>
<td class="author"><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=<?=$filter?>&amp;orderby=dateline<?=$typeadd?><?=$sortadd?>" class="order <? if($orderby == 'dateline') { ?>order_active<? } ?>">����/ʱ��</a></td>
<td class="nums"><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=<?=$filter?>&amp;orderby=replies<?=$typeadd?><?=$sortadd?>" class="order <? if($orderby == 'replies') { ?>order_active<? } ?>">�ظ�</a>&nbsp;<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=<?=$filter?>&amp;orderby=views<?=$typeadd?><?=$sortadd?>" class="order <? if($orderby == 'views') { ?>order_active<? } ?>">�鿴</a></td>
<td class="lastpost"><cite><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=<?=$filter?>&amp;orderby=lastpost<?=$typeadd?><?=$sortadd?>" class="order <? if($orderby == 'lastpost') { ?>order_active<? } ?>">��󷢱�</a></cite></td>
</tr>
</thead>

<? if($page == 1 && !empty($announcement)) { ?>
<tbody>
<tr>
<td class="folder"><img src="<?=IMGDIR?>/ann_icon.gif" alt="����" /></td>
<td class="icon">&nbsp;</td>
<? if($forum['ismoderator']) { ?><td class="icon">&nbsp;</td><? } ?>
<th class="subject"><strong>����: <? if(empty($announcement['type'])) { ?><a href="announcement.php?id=<?=$announcement['id']?>#<?=$announcement['id']?>" target="_blank"><?=$announcement['subject']?></a><? } else { ?><a href="<?=$announcement['message']?>" target="_blank"><?=$announcement['subject']?></a><? } ?></strong></th>
<td class="author">
<cite><a href="space.php?uid=<?=$announcement['authorid']?>"><?=$announcement['author']?></a></cite>
<em><?=$announcement['starttime']?></em>
</td>
<td class="nums">&nbsp;</td>
<td class="lastpost">&nbsp;</td>
</tr>
</tbody>
<? } if($threadcount) { if(is_array($threadlist)) { foreach($threadlist as $key => $thread) { if($forumseparator == 1 && $separatepos == $key + 1) { ?>
<tbody>
<tr>
<td class="folder"></td><td>&nbsp;</td>
<? if($forum['ismoderator']) { ?><td>&nbsp;</td><? } ?>
<th class="subject">�������</th><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</tbody>
<? } ?>
<tbody id="<?=$thread['id']?>">
<tr>
<td class="folder">
<a href="viewthread.php?tid=<?=$thread['tid']?>&amp;extra=<?=$extra?>" title="�´��ڴ�" target="_blank">
<? if($thread['folder'] == 'lock') { ?>
<img src="<?=IMGDIR?>/folder_lock.gif" /></a>
<? } elseif(in_array($thread['displayorder'], array(1, 2, 3, 4))) { ?>
<img src="<?=IMGDIR?>/pin_<?=$thread['displayorder']?>.gif" alt="<?=$threadsticky[3-$thread['displayorder']]?>" /></a>
<? } else { ?>
<img src="<?=IMGDIR?>/folder_<?=$thread['folder']?>.gif" /></a>
<? } ?>
</td>
<td class="icon">
<? if($thread['special'] == 1) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=poll"><img src="<?=IMGDIR?>/pollsmall.gif" alt="ͶƱ" /></a>
<? } elseif($thread['special'] == 2) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=trade"><img src="<?=IMGDIR?>/tradesmall.gif" alt="��Ʒ" /></a>
<? } elseif($thread['special'] == 3) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=reward"><img src="<?=IMGDIR?>/rewardsmall.gif" alt="����" <? if($thread['price'] < 0) { ?>class="solved"<? } ?> /></a>
<? } elseif($thread['special'] == 4) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=activity"><img src="<?=IMGDIR?>/activitysmall.gif" alt="�" /></a>
<? } elseif($thread['special'] == 5) { ?>
<a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=debate"><img src="<?=IMGDIR?>/debatesmall.gif" alt="����" /></a>
<? } else { ?>
<?=$thread['icon']?>
<? } ?>
</td>
<? if($forum['ismoderator']) { ?>
<td class="icon">
<? if($thread['fid'] == $fid && $thread['digest'] >= 0) { if($thread['displayorder'] <= 3 || $adminid == 1) { ?>
<input onclick="tmodclick(this)" class="checkbox" type="checkbox" name="moderate[]" value="<?=$thread['tid']?>" />
<? } else { ?>
<input class="checkbox" type="checkbox" disabled="disabled" />
<? } } else { ?>
<input class="checkbox" type="checkbox" disabled="disabled" />
<? } ?>
</td>
<? } ?>
<th class="subject <?=$thread['folder']?>">
<label><?=$pluginhooks['forumdisplay_thread'][$key]?>&nbsp;</label>
<? if($thread['moved']) { if($forum['ismoderator']) { ?>
<a href="topicadmin.php?action=moderate&amp;optgroup=3&amp;operation=delete&amp;tid=<?=$thread['moved']?>" onclick="showWindow('mods', this.href);return false">�ƶ�:</a>
<? } else { ?>
�ƶ�:
<? } } ?>
<?=$thread['sortid']?> <?=$thread['typeid']?>
<span id="thread_<?=$thread['tid']?>"><a href="viewthread.php?tid=<?=$thread['tid']?>&amp;extra=<?=$extra?>"<?=$thread['highlight']?>><?=$thread['subject']?></a></span>
<? if($thread['readperm']) { ?> - [�Ķ�Ȩ�� <span class="bold"><?=$thread['readperm']?></span>]<? } if($thread['price'] > 0) { if($thread['special'] == '3') { ?>
- <span style="color: #C60">[����<?=$extcredits[$creditstransextra['2']]['title']?> <span class="bold"><?=$thread['price']?></span> <?=$extcredits[$creditstransextra['2']]['unit']?>]</span>
<? } else { ?>
- [�ۼ� <?=$extcredits[$creditstransextra['1']]['title']?> <span class="bold"><?=$thread['price']?></span> <?=$extcredits[$creditstransextra['1']]['unit']?>]
<? } } elseif($thread['special'] == '3' && $thread['price'] < 0) { ?>
- <span style="color: #269F11">[�ѽ��]</span>
<? } if($thread['attachment'] == 2) { ?>
<img src="images/attachicons/image_s.gif" alt="ͼƬ����" class="attach" />
<? } elseif($thread['attachment'] == 1) { ?>
<img src="images/attachicons/common.gif" alt="����" class="attach" />
<? } if($thread['displayorder'] == 0) { if($thread['recommendicon']) { ?>
<img src="<?=IMGDIR?>/recommend_<?=$thread['recommendicon']?>.gif" class="attach" alt="����ָ�� <?=$thread['recommends']?>" title="����ָ�� <?=$thread['recommends']?>" />
<? } if($thread['heatlevel']) { ?>
<img src="<?=IMGDIR?>/hot_<?=$thread['heatlevel']?>.gif" class="attach" alt="<?=$thread['heatlevel']?> ������" title="<?=$thread['heatlevel']?> ������" />
<? } if($thread['digest'] > 0) { ?>
<img src="<?=IMGDIR?>/digest_<?=$thread['digest']?>.gif" class="attach" alt="���� <?=$thread['digest']?>" title="���� <?=$thread['digest']?>" />
<? } if($thread['rate'] > 0) { ?>
<img src="<?=IMGDIR?>/agree.gif" class="attach" alt="���ӱ��ӷ�" title="���ӱ��ӷ�" />
<? } } if($thread['multipage']) { ?>
<span class="threadpages"><?=$thread['multipage']?></span>
<? } ?>
</th>
<td class="author">
<cite>
<? if($thread['authorid'] && $thread['author']) { ?>
<a href="space.php?uid=<?=$thread['authorid']?>"><?=$thread['author']?></a>
<? } else { if($forum['ismoderator']) { ?>
<a href="space.php?uid=<?=$thread['authorid']?>">����</a>
<? } else { ?>
����
<? } } ?>
</cite>
<em><?=$thread['dateline']?></em>
</td>
<td class="nums"><strong><?=$thread['replies']?></strong>/<em><?=$thread['views']?></em></td>
<td class="lastpost">
<cite><? if($thread['lastposter']) { ?><a href="<? if($thread['digest'] != -2) { ?>space.php?username=<?=$thread['lastposterenc']?><? } else { ?>viewthread.php?tid=<?=$thread['tid']?>&amp;page=<? echo max(1, $thread['pages']);; } ?>"><?=$thread['lastposter']?></a><? } else { ?>����<? } ?></cite>
<em><a href="<? if($thread['digest'] != -2) { ?>redirect.php?tid=<?=$thread['tid']?>&amp;goto=lastpost<?=$highlight?>#lastpost<? } else { ?>viewthread.php?tid=<?=$thread['tid']?>&amp;page=<? echo max(1, $thread['pages']);; } ?>"><?=$thread['lastpost']?></a></em>
</td>
</tr>
</tbody><? } } } else { ?>
<tbody><tr><th colspan="6"><p class="nodata">������ָ���ķ�Χ���������⡣</p></th></tr></tbody>
<? } ?>
</table>
<? if($forum['ismoderator'] && $threadcount) { include template('topicadmin_modlayer', '0', ''); } ?>

</form>
</div>
<div class="pages_btns s_clear">
<?=$multipage?>
<span <? if($visitedforums) { ?>id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id})"<? } ?> class="pageback"><a href="<?=$indexname?>">������ҳ</a></span>
<span class="postbtn" id="newspecialtmp" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"><a href="post.php?action=newthread&amp;fid=<?=$fid?>"<? if(!$forum['allowspecialonly']) { ?> onclick="showWindow('newthread', this.href);return false;"<? } ?>>����</a></span>
</div>

<? if($whosonlinestatus) { ?>
<dl id="onlinelist">
<? if($detailstatus) { ?>
<dd>
<span class="headactions"><a href="forumdisplay.php?fid=<?=$fid?>&amp;page=<?=$page?>&amp;showoldetails=no#online"><img src="<?=IMGDIR?>/collapsed_no.gif" alt="" /></a></span>
<h3>��������˰��Ļ�Ա</h3>
</dd>
<dd>
<ul class="s_clear"><? if(is_array($whosonline)) { foreach($whosonline as $key => $online) { ?><li title="ʱ��: <?=$online['lastactivity']?><?="\n"?> ����: <?=$online['action']?><?="\n"?> ���: <?=$forumname?>">
<img src="images/common/<?=$online['icon']?>"  alt="" />
<? if($online['uid']) { ?>
<a href="space.php?uid=<?=$online['uid']?>"><?=$online['username']?></a>
<? } else { ?>
<?=$online['username']?>
<? } ?>
</li><? } } ?></ul>
</dd>
<? } else { ?>
<dt>
<span class="headactions"><a href="forumdisplay.php?fid=<?=$fid?>&amp;page=<?=$page?>&amp;showoldetails=yes#online" class="nobdr"><img src="<?=IMGDIR?>/collapsed_yes.gif" alt="" /></a></span>
<h3>��������˰��Ļ�Ա</h3>
</dt>
<? } ?>
</dl>
<? } ?>
<?=$pluginhooks['forumdisplay_bottom']?>

</div>
</div>
<? if($infosidestatus['allow'] == 2) { ?>
<div id="sidebar" class="side" style="<?=$collapse['sidebar']?>">
<? if(!empty($qihoo['status']) && ($qihoo['searchbox'] & 2)) { ?>
<div id="qihoosearch" class="sidebox">
<form method="post" action="search.php?srchtype=qihoo" onSubmit="this.target='_blank';">
<input type="hidden" name="searchsubmit" value="yes" />
<input type="text" class="txt" name="srchtxt" size="20" value="<?=$qihoo_searchboxtxt?>" />
&nbsp;<button type="submit">����</button>
</form>
</div>
<? } if($infosidestatus['0']) { if(!empty($qihoo['status']) && ($qihoo['searchbox'] & 2)) { ?>
<hr class="shadowline"/>
<? } ?>
<div id="infoside"><? request($infosidestatus, 1, 0); ?></div>
<? } ?>
</div>
<? } if($allowpost && ($allowposttrade || $allowpostpoll || $allowpostreward || $allowpostactivity || $allowpostdebate || $threadplugins || $forum['threadsorts'])) { ?>
<ul class="popupmenu_popup postmenu" id="newspecial_menu" style="display: none">
<? if(!$forum['allowspecialonly']) { ?><li><a href="post.php?action=newthread&amp;fid=<?=$fid?>" onclick="showWindow('newthread', this.href);doane(event)">���»���</a></li><? } if($allowpostpoll) { ?><li class="poll"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=1">����ͶƱ</a></li><? } if($allowpostreward) { ?><li class="reward"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=3">��������</a></li><? } if($allowpostdebate) { ?><li class="debate"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=5">��������</a></li><? } if($allowpostactivity) { ?><li class="activity"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=4">�����</a></li><? } if($allowposttrade) { ?><li class="trade"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=2">������Ʒ</a></li><? } if($threadplugins) { if(is_array($forum['threadplugin'])) { foreach($forum['threadplugin'] as $tpid) { if(array_key_exists($tpid, $threadplugins) && @in_array($tpid, $allowthreadplugin)) { ?>
<li class="popupmenu_option"<? if($threadplugins[$tpid]['icon']) { ?> style="background-image:url(<?=$threadplugins[$tpid]['icon']?>)"<? } ?>><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;specialextra=<?=$tpid?>"><?=$threadplugins[$tpid]['name']?></a></li>
<? } } } } if($forum['threadsorts'] && !$forum['allowspecialonly']) { if(is_array($forum['threadsorts']['types'])) { foreach($forum['threadsorts']['types'] as $id => $threadsorts) { if($forum['threadsorts']['show'][$id]) { ?>
<li class="popupmenu_option"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;sortid=<?=$id?>"><?=$threadsorts?></a></li>
<? } } } if(is_array($forum['typemodels'])) { foreach($forum['typemodels'] as $id => $model) { ?><li class="popupmenu_option"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;modelid=<?=$id?>"><?=$model['name']?></a></li><? } } } ?>
</ul>
<? } ?>

<ul class="popupmenu_popup headermenu_popup filter_popup" id="filtertype_menu" style="display: none;">
<li><a href="forumdisplay.php?fid=<?=$fid?>">ȫ��</a></li>
<? if($showpoll) { ?><li <? if($filter == 'poll') { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=poll">ͶƱ</a></li><? } if($showtrade) { ?><li <? if($filter == 'trade') { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=trade">��Ʒ</a></li><? } if($showreward) { ?><li <? if($filter == 'reward') { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=reward">����</a></li><? } if($showactivity) { ?><li <? if($filter == 'activity') { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=activity">�</a></li><? } if($showdebate) { ?><li <? if($filter == 'debate') { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=debate">����</a></li><? } if($threadplugins) { if(is_array($forum['threadplugin'])) { foreach($forum['threadplugin'] as $tpid) { if(array_key_exists($tpid, $threadplugins) && @in_array($tpid, $allowthreadplugin)) { ?>
<li  <? if($filter == 'special' && $extraid == $tpid) { ?>class="active"<? } ?>><a href="forumdisplay.php?fid=<?=$fid?>&amp;filter=special&amp;extraid=<?=$tpid?>"><?=$threadplugins[$tpid]['name']?></a></li>
<? } } } } ?>
</ul>

<? if($visitedforums) { ?>
<ul class="popupmenu_popup" id="visitedforums_menu" style="display: none">
<?=$visitedforums?>
</ul>
<? } if($forumjump) { ?>
<div class="popupmenu_popup" id="fjump_menu" style="display: none">
<?=$forummenu?>
</div>
<? } if($maxpage > 1) { ?>
<script type="text/javascript">document.onkeyup = function(e){keyPageScroll(e, <? if($page > 1) { ?>1<? } else { ?>0<? } ?>, <? if($page < $maxpage) { ?>1<? } else { ?>0<? } ?>, 'forumdisplay.php?fid=<?=$fid?><?=$forumdisplayadd?>', <?=$page?>);}</script>
<? } ?>
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