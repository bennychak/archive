<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('faq');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/faq.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/header.htm', 1283191668, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/faq.htm', 'C:\xampp\htdocs\bbs\./templates/default/faq_navbar.htm', 1283191668, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/faq.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/footer.htm', 1283191668, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/faq.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283191668, '3', './templates/buluonew413')
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
<link href="forumdata/cache/style_3_moderator.css?R0r" rel="stylesheet" type="text/css" />
<? } ?><script type="text/javascript">var STYLEID = '<?=STYLEID?>', IMGDIR = '<?=IMGDIR?>', VERHASH = '<?=VERHASH?>', charset = '<?=$charset?>', discuz_uid = <?=$discuz_uid?>, cookiedomain = '<?=$cookiedomain?>', cookiepath = '<?=$cookiepath?>', attackevasive = '<?=$attackevasive?>', disallowfloat = '<?=$disallowfloat?>', creditnotice = '<? if($creditnotice) { ?><?=$creditnames?><? } ?>', <? if(in_array(CURSCRIPT, array('viewthread', 'forumdisplay'))) { ?>gid = parseInt('<?=$thisgid?>')<? } elseif(CURSCRIPT == 'index') { ?>gid = parseInt('<?=$gid?>')<? } else { ?>gid = 0<? } ?>, fid = parseInt('<?=$fid?>'), tid = parseInt('<?=$tid?>')</script>
<script src="<?=$jspath?>common.js?<?=VERHASH?>" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<?=IMGDIR?>/style1.css" />

<style type="text/css">
.gallery_buluo { width:860px; height:250px; margin:0 auto; padding:0; }
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li { width:860px; height:250px; overflow:hidden; }
p#controls { margin:0; padding:0; position:relative; }
#prevBtn_buluo { display:block; margin:0; overflow:hidden; width:16px; height:26px; position:absolute; left:-40px; top:-150px; }
#nextBtn_buluo { display:block; margin:0; overflow:hidden; width:16px; height:26px; position:absolute; left: 880px; top:-150px; }
#prevBtn_buluo a { display:block; width:16px; height:26px; background:url(<?=IMGDIR?>/l_arrow.gif) no-repeat 0 0; }
#nextBtn_buluo a { display:block; width:16px; height:26px; background:url(<?=IMGDIR?>/r_arrow.gif) no-repeat 0 0; }
</style>
</head>

<body id="<?=CURSCRIPT?>" onkeydown="if(event.keyCode==27) return false;">

<div id="append_parent"></div><div id="ajaxwaitid"></div>
<div class="main_buluo">
<div style="margin:0 auto; width:100%"><div id="umenu">
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
</div></div>
<div class="header_buluo">
    <div class="block_header_buluo">
      <div class="logo_buluo"><a href="<?=$indexname?>" title="<?=$bbname?>"><?=BOARDLOGO?></a></div>
      <div class="search_buluo">
  <? if(CURSCRIPT == 'search') { } else { ?>
  <form method="post" action="search.php"  target="_blank">
          <label><span>
            <input type="text" id="srchtxt" name="srchtxt" value="��վ����..." title="��վ����..."  onclick="this.value=''" onkeydown="javascript:if(event.keyCode==13)event.keyCode=9;" class="keywords"  maxlength="50"  />
            </span>
<button type="submit" name="searchsubmit" class="button" >&nbsp;</button>
          </label>
        </form>
<? } ?>
      </div>
      <div id="menu">
        <ul><? if(is_array($navs)) { foreach($navs as $id => $nav) { if($id == 3) { if(!empty($plugins['jsmenu'])) { ?>
<?=$nav['nav']?>
<? } if(!empty($plugins['links'])) { if(is_array($plugins['links'])) { foreach($plugins['links'] as $module) { if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?><li><?=$module['url']?></li><? } } } } } else { if(!$nav['level'] || ($nav['level'] == 1 && $discuz_uid) || ($nav['level'] == 2 && $adminid > 0) || ($nav['level'] == 3 && $adminid == 1)) { ?><?=$nav['nav']?><? } } } } if(in_array($BASEFILENAME, $navmns)) { $mnid = $BASEFILENAME; } elseif($navmngs[$BASEFILENAME]) { if(is_array($navmngs[$BASEFILENAME])) { foreach($navmngs[$BASEFILENAME] as $navmng) { if($navmng['0'] == array_intersect_assoc($navmng['0'], $_GET)) { $mnid = $navmng['1']; } } } } ?>

        </ul>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="top_bg_buluo">
  <div class="clr"></div>
  </div>
  <div class="clr"></div>
  <div class="FBG_buluo">
  
  <div class="clr"></div>
</div>
</div>
<div id="myprompt_menu" style="display:none" class="promptmenu">
<div class="promptcontent">
<ul class="s_clear"><? if(is_array($prompts)) { foreach($prompts as $promptkey => $promptdata) { if($promptkey) { ?><li<? if(!$promptdata['new']) { ?> style="display:none"<? } ?>><a id="prompt_<?=$promptkey?>" href="<? if($promptdata['script']) { ?><?=$promptdata['script']?><? } else { ?>notice.php?filter=<?=$promptkey?><? } ?>" target="_blank"><?=$promptdata['name']?> (<?=$promptdata['new']?>)</a></li><? } } } ?></ul>
</div>
</div>
<?=$pluginhooks['global_header']?><div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> &raquo; <? if(empty($action)) { ?>����<? } else { ?><a href="faq.php">����</a> <?=$navigation?><? } ?></div>
<div id="wrap" class="wrap with_side s_clear">
<div class="side"><h2>����</h2>
<div class="sideinner">
<ul class="tabs"><? if(is_array($faqparent)) { foreach($faqparent as $fpid => $parent) { ?><li name="<?=$parent['title']?>"><a href="faq.php?action=faq&amp;id=<?=$fpid?>" ><?=$parent['title']?></a></li><? } } ?><li><a href="faq.php?action=credits">����˵��</a></li>
<li><a href="faq.php?action=grouppermission">�û���Ȩ��</a></li>
<? if(!empty($plugins['faq'])) { if(is_array($plugins['faq'])) { foreach($plugins['faq'] as $id => $module) { ?><li<? if($_GET['id'] == $id) { ?> class="current"<? } ?>><a href="faq.php?action=plugin&amp;id=<?=$id?>"><?=$module['name']?></a></li><? } } } ?>
</ul>
</div>
<hr class="shadowline" />
<div class="sideinner">
<form method="post" action="faq.php?action=search&amp;searchsubmit=yes">
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="searchtype" value="all" />
<input type="text" name="keyword" size="16" value="<?=$keyword?>" class="txt" />
<button type="submit" name="searchsubmit">����</button>
</form>
</div>
<?=$pluginhooks['faq_extra']?></div>
<div class="main">
<div class="content">
<? if(empty($action)) { ?>
<div class="datalist"><? if(is_array($faqparent)) { foreach($faqparent as $fpid => $parent) { ?><h2 class="blocktitle"><a href="faq.php?action=faq&amp;id=<?=$fpid?>" class="lightlink"><?=$parent['title']?></a></h2>
<ul name="<?=$parent['title']?>" class="commonlist"><? if(is_array($faqsub[$parent['id']])) { foreach($faqsub[$parent['id']] as $sub) { ?><li><a href="faq.php?action=faq&amp;id=<?=$sub['fpid']?>&amp;messageid=<?=$sub['id']?>"><?=$sub['title']?></a></li><? } } ?></ul>
<hr class="solidline" /><? } } ?></div>
<? } elseif($action == 'faq') { if(is_array($faqlist)) { foreach($faqlist as $faq) { ?><div class="datalist">
<div id="messageid<?=$faq['id']?>_c" class="c_header<? if($messageid != $faq['id']) { ?> closenode<? } ?>">
<h3 onclick="toggle_collapse('messageid<?=$faq['id']?>', 1, 1);"><?=$faq['title']?></h3>
<div class="c_header_action">
<p class="c_header_ctrlbtn" onclick="toggle_collapse('messageid<?=$faq['id']?>', 1, 1);">[ չ�� ]</p>
</div>
</div>
<div class="faqmessage" id="messageid<?=$faq['id']?>" style="<? if($messageid != $faq['id']) { ?> display: none <? } ?>"><?=$faq['message']?></div>
</div><? } } } elseif($action == 'search') { if($faqlist) { if(is_array($faqlist)) { foreach($faqlist as $faq) { ?><div class="datalist">
<div class="c_header searchfaq"><h3><?=$faq['title']?></h3></div>
<div class="faqmessage"><?=$faq['message']?></div>
</div><? } } } else { ?>
<p class="nodata">�Բ���û���ҵ�ƥ����</p>
<? } } elseif($action == 'plugin' && !empty($faqtpl)) { include(template($faqtpl)); } ?>
</div>
</div>
</div>
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