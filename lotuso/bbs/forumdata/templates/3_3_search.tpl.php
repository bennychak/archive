<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('search');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/header.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\./templates/default/search_threads.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\./templates/default/search_sort.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/footer.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/header.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/footer.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283191924, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/search.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283191924, '3', './templates/buluonew413')
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
  <? if(CURSCRIPT == 'search') { } else { ?><!--��������-->
  <!--<form method="post" action="search.php"  target="_blank">
          <label><span>
            <input type="text" id="srchtxt" name="srchtxt" value="��վ����..." title="��վ����..."  onclick="this.value=''" onkeydown="javascript:if(event.keyCode==13)event.keyCode=9;" class="keywords"  maxlength="50"  />
            </span>
<button type="submit" name="searchsubmit" class="button" >&nbsp;</button>
          </label>
        </form> -->
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
<?=$pluginhooks['global_header']?><div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> &raquo; ����</div>
<div id="wrap" class="wrap">
<form class="searchform" method="post" action="search.php"<? if($qihoo['status']) { ?> target="_blank"<? } ?>>
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<? if(!empty($srchtype)) { ?><input type="hidden" name="srchtype" value="<?=$srchtype?>" /><? } ?>

<label for="srchtxt" class="searchlabel">
����
<strong>
<? if($srchtype == 'threadsort') { ?>
������Ϣ
<? } elseif($srchtype == 'trade') { ?>
��Ʒ
<? } elseif($srchtype == 'qihoo') { ?>
�滢ȫ��
<? } else { ?>
����
<? } ?>
</strong>
</label>

<? if($srchtype != 'threadsort') { ?>
<p class="searchkey">
<input type="text" id="srchtxt" name="srchtxt" prompt="search_kw" size="45" maxlength="40" value="<?=$keyword?>" class="txt" tabindex="1" />
<script type="text/javascript">$('srchtxt').focus();</script>
<? if($checkarray['posts']) { ?>
<select name='srchtype'>
<option value="title">����</option>
<? if(!$disabled['fulltext']) { ?><option value="fulltext">ȫ��</option><? } ?>
</select>
<? } ?>
<button type="submit" name="searchsubmit" id="searchsubmit" value="true" prompt="search_submit">����</button>
<? if($checkarray['posts']) { ?>
<a href="javascript:;" onclick="userdisplay = $('search_option').style.display == '' ? '0' : '1'; display('search_option'); ajaxget('ajax.php?action=displaysearch_adv&display='+userdisplay);">�߼�</a>
<? } ?>
</p>
<? } ?>

<p>
<input type="radio" name="st" onclick="window.location=('search.php')" <?=$checkarray['posts']?> id="srchtypeposts"/> <label for="srchtypeposts">����</label>
<input type="radio" name="st" onclick="window.location=('search.php?srchtype=trade')" <?=$checkarray['trade']?> id="srchtypetrade"/> <label for="srchtypetrade">��Ʒ</label>
<? if($qihoo['status']) { ?><input type="radio" name="st" onclick="window.location=('search.php?srchtype=qihoo')" <?=$checkarray['qihoo']?> id="srchtypeqihoo" /> <label for="srchtypeqihoo">�滢ȫ��</label><? } ?>
<input type="radio" name="st" onclick="window.location=('search.php?srchtype=threadsort')" <?=$checkarray['threadsort']?> id="srchtypesort"/> <label for="srchtypesort">������Ϣ</label>
</p><? $policymsgs = $p = ''; if(is_array($creditspolicy['search'])) { foreach($creditspolicy['search'] as $id => $policy) { ?><?
$policymsg = <<<EOF

EOF;
 if($extcredits[$id]['img']) { 
$policymsg .= <<<EOF
{$extcredits[$id]['img']} 
EOF;
 } 
$policymsg .= <<<EOF
{$extcredits[$id]['title']} {$policy} {$extcredits[$id]['unit']}
EOF;
?><? $policymsgs .= $p.$policymsg;$p = ', '; } } if($policymsgs) { ?><p>ÿ����һ���������۳� <?=$policymsgs?></p><? } if($srchtype != 'qihoo') { ?>
<div id="search_option" <? if($checkarray['posts'] && empty($_DCOOKIE['displaysearch_adv'])) { ?>style="display: none;"<? } ?>>
<hr class="shadowline"/>
<h3>����ѡ��</h3>
<table summary="����" cellspacing="0" cellpadding="0" class="formtable">
<? if($srchtype == 'threadsort') { ?>
<tr>
<th><label for="typeid">������Ϣ</label></th>
<td>
<select name="sortid" onchange="ajaxget('post.php?action=threadsorts&sortid='+this.options[this.selectedIndex].value+'&operate=1&sid=<?=$sid?>', 'threadsorts', 'threadsortswait')">
<option value="0">��</option><?=$threadsorts?>
</select>
<span id="threadsortswait"></span>
</td>
</tr>
<tbody id="threadsorts"></tbody>
<? } if($checkarray['posts'] || $srchtype == 'trade') { ?>
<tr>
<td>����</td>
<td><input type="text" id="srchname" name="srchuname" size="45" maxlength="40" class="txt" /></td>
</tr>

<tr>
<td>���ⷶΧ</td>
<td>
<label><input type="radio" name="srchfilter" value="all" checked="checked" /> ȫ������</label>
<label><input type="radio" name="srchfilter" value="digest" /> ��������</label>
<label><input type="radio" name="srchfilter" value="top" /> �ö�����</label>
</td>
</tr>
<? } if($checkarray['posts']) { ?>
<tr>
<td>��������</td>
<td>
<label><input type="checkbox" name="special[]" value="1" /> ͶƱ����</label>
<label><input type="checkbox" name="special[]" value="2" /> ��Ʒ����</label>
<label><input type="checkbox" name="special[]" value="3" /> ��������</label>
<label><input type="checkbox" name="special[]" value="4" /> �����</label>
<label><input type="checkbox" name="special[]" value="5" /> ��������</label><? if(is_array($threadplugins)) { foreach($threadplugins as $pluginid => $threadplugin) { ?><label><input type="checkbox" name="specialplugin[]" value="<?=$threadplugin['iconid']?>" /> <?=$threadplugin['name']?></label><? } } ?></td>
</tr>
<? } if($srchtype == 'trade') { ?>
<tr>
<td>��Ʒ���</td>
<td>
<select name="srchtypeid"><option value="">ȫ��</option><? if(is_array($tradetypes)) { foreach($tradetypes as $typeid => $typename) { ?><option value="<?=$typeid?>"><?=$typename?></option><? } } ?></select>
</td>
</tr>
<? } if($checkarray['posts'] || $srchtype == 'trade') { ?>
<tr>
<th><label for="srchfrom">����ʱ��</label></th>
<td>
<select id="srchfrom" name="srchfrom">
<option value="0">ȫ��ʱ��</option>
<option value="86400">1 ��</option>
<option value="172800">2 ��</option>
<option value="604800">1 ��</option>
<option value="2592000">1 ����</option>
<option value="7776000">3 ����</option>
<option value="15552000">6 ����</option>
<option value="31536000">1 ��</option>
</select>
<label><input type="radio" name="before" value="" checked="checked" /> ����</label>
<label><input type="radio" name="before" value="1" /> ��ǰ</label>
</td>
</tr>

<tr>
<td><label for="orderby">��������</label></td>
<td>
<select id="orderby1" name="orderby">
<option value="lastpost" selected="selected">�ظ�ʱ��</option>
<option value="dateline">����ʱ��</option>
<option value="replies">�ظ�����</option>
<option value="views">�������</option>
</select>
<select id="orderby2" name="orderby" style="position: absolute; display: none" disabled>
<option value="dateline" selected="selected">����ʱ��</option>
<option value="price">��Ʒ�۸�</option>
<option value="expiration">ʣ��ʱ��</option>
</select>
<label><input type="radio" name="ascdesc" value="asc" /> ����������</label>
<label><input type="radio" name="ascdesc" value="desc" checked="checked" /> ����������</label>
</td>
</tr>
<? } ?>

<tr>
<td valign="top"><label for="srchfid">������Χ</label></td>
<td>
<select id="srchfid" name="srchfid[]" multiple="multiple" size="10" style="width: 26em;">
<option value="all"<? if(!$srchfid) { ?> selected="selected"<? } ?>>ȫ�����</option>
<?=$forumselect?>
</select>
</td>
</tr>

<? if($srchtype == 'threadsort') { ?>
<tr>
<th>&nbsp;</th>
<td><button class="submit" type="submit" name="searchsubmit" value="true">����</button></td>
</tr>
<? } ?>
</table>
</div>
<? } if(empty($srchtype) && empty($keyword)) { ?>
<hr class="shadowline"/>
<h3>�������</h3>
<table cellspacing="4" cellpadding="0" width="100%">
<tr>
<td><a href="search.php?srchfrom=3600&amp;searchsubmit=yes">1 Сʱ���ڵ�����</a></td>
<td><a href="search.php?srchfrom=14400&amp;searchsubmit=yes">4 Сʱ���ڵ�����</a></td>
<td><a href="search.php?srchfrom=28800&amp;searchsubmit=yes">8 Сʱ���ڵ�����</a></td>
<td><a href="search.php?srchfrom=86400&amp;searchsubmit=yes">24 Сʱ���ڵ�����</a></td>
</tr>
<tr>
<td><a href="search.php?srchfrom=604800&amp;searchsubmit=yes">1 ��������</a></td>
<td><a href="search.php?srchfrom=2592000&amp;searchsubmit=yes">1 ��������</a></td>
<td><a href="search.php?srchfrom=15552000&amp;searchsubmit=yes">6 ��������</a></td>
<td><a href="search.php?srchfrom=31536000&amp;searchsubmit=yes">1 ��������</a></td>
</tr>
</table>
<? } ?>
</form>

<? if(!empty($searchid) && submitcheck('searchsubmit', 1)) { if($checkarray['posts']) { ?><div class="searchlist threadlist datalist">
<div class="itemtitle s_clear">
<h1><? if($keyword) { ?>���: <em>�ҵ� ��<span class="emfont"><?=$keyword?></span>�� ������� <?=$index['threads']?> ��</em><? } else { ?>���: <em>�ҵ�������� <?=$index['threads']?> ��</em><? } ?></h1>
<? if(!empty($multipage)) { ?><?=$multipage?><? } ?>
</div>
<table summary="����" cellspacing="0" cellpadding="0" width="100%" class="datatable">
<thead>
<tr class="colplural">
<td class="folder">&nbsp;</td>
<td class="icon">&nbsp;</td>
<th>����</th>
<td class="forum">���</td>
<td class="author">����</td>
<td class="nums">�ظ�/�鿴</td>
<td class="lastpost"><cite>��󷢱�</cite></td>
</tr>
</thead><? if(is_array($threadlist)) { foreach($threadlist as $thread) { ?><tbody>
<tr>
<td class="folder">
<a href="viewthread.php?tid=<?=$thread['tid']?>&amp;highlight=<?=$index['keywords']?>" title="�´��ڴ�" target="_blank">
<? if($thread['folder'] == 'lock') { ?>
<img src="<?=IMGDIR?>/folder_lock.gif" /></a>
<? } else { ?>
<img src="<?=IMGDIR?>/folder_<?=$thread['folder']?>.gif" /></a>
<? } ?>
</td>
<td class="icon">
<? if($thread['special'] == 1) { ?>
<img src="<?=IMGDIR?>/pollsmall.gif" alt="ͶƱ" />
<? } elseif($thread['special'] == 2) { ?>
<img src="<?=IMGDIR?>/tradesmall.gif" alt="��Ʒ" />
<? } elseif($thread['special'] == 3) { ?>
<img src="<?=IMGDIR?>/rewardsmall.gif" alt="����" />
<? } elseif($thread['special'] == 4) { ?>
<img src="<?=IMGDIR?>/activitysmall.gif" alt="�" />
<? } elseif($thread['special'] == 5) { ?>
<img src="<?=IMGDIR?>/debatesmall.gif" alt="����" />
<? } else { ?>
<?=$thread['icon']?>
<? } ?>
</td>
<th class="subject">
<label>
<? if($thread['digest'] > 0) { ?>
<img src="<?=IMGDIR?>/digest_<?=$thread['digest']?>.gif" alt="���� <?=$thread['digest']?>" />
<? } ?>
&nbsp;
</label>
<a href="viewthread.php?tid=<?=$thread['tid']?>&amp;highlight=<?=$index['keywords']?>" target="_blank" <?=$thread['highlight']?>><?=$thread['subject']?></a>
<? if($thread['attachment'] == 2) { ?>
<img src="images/attachicons/image_s.gif" alt="ͼƬ����" class="attach" />
<? } elseif($thread['attachment'] == 1) { ?>
<img src="images/attachicons/common.gif" alt="����" class="attach" />
<? } if($thread['multipage']) { ?><span class="threadpages"><?=$thread['multipage']?></span><? } ?>
</th>
<td class="forum"><a href="forumdisplay.php?fid=<?=$thread['fid']?>"><?=$thread['forumname']?></a></td>
<td class="author">
<cite>
<? if($thread['authorid'] && $thread['author']) { ?>
<a href="space.php?uid=<?=$thread['authorid']?>"><?=$thread['author']?></a>
<? } else { if($forum['ismoderator']) { ?><a href="space.php?uid=<?=$thread['authorid']?>">����</a><? } else { ?>����<? } } ?>
</cite>
<em><?=$thread['dateline']?></em>
</td>
<td class="nums"><strong><?=$thread['replies']?></strong> / <em><?=$thread['views']?></em></td>
<td class="lastpost">
<cite><? if($thread['lastposter']) { ?><a href="space.php?username=<?=$thread['lastposterenc']?>"><?=$thread['lastposter']?></a><? } else { ?>����<? } ?></cite>
<em><a href="redirect.php?tid=<?=$thread['tid']?>&amp;goto=lastpost<?=$highlight?>#lastpost"><?=$thread['lastpost']?></a></em>
</td>
</tr>
</tbody><? } } if(empty($threadlist)) { ?>
<tbody><tr><th colspan="7">�Բ���û���ҵ�ƥ������</th></tr></tbody>
<? } ?>

</table>
<? if(!empty($multipage)) { ?><div class="pages_btns s_clear"><?=$multipage?></div><? } ?>
</div>
<? } elseif($checkarray['threadsort']) { ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
  <? if(CURSCRIPT == 'search') { } else { ?><!--��������-->
  <!--<form method="post" action="search.php"  target="_blank">
          <label><span>
            <input type="text" id="srchtxt" name="srchtxt" value="��վ����..." title="��վ����..."  onclick="this.value=''" onkeydown="javascript:if(event.keyCode==13)event.keyCode=9;" class="keywords"  maxlength="50"  />
            </span>
<button type="submit" name="searchsubmit" class="button" >&nbsp;</button>
          </label>
        </form> -->
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
<?=$pluginhooks['global_header']?><div id="nav">
<a href="<?=$indexname?>"><?=$bbname?></a> &raquo; ������Ϣ
</div>

<div id="wrap" class="wrap s_clear">
<div class="main">
<div class="content">
<div class="searchlist threadlist datalist">
<div class="itemtitle s_clear">
<h1>���: <em>�ҵ�������� <?=$index['threads']?> ��</em></h1>
<? if(!empty($multipage)) { ?><?=$multipage?><? } ?>
</div>
<table summary="����" cellspacing="0" cellpadding="0" width="100%" class="datatable">
<thead>
<tr class="colplural">
<td class="icon">&nbsp;</td>
<td>����</td><? if(is_array($optionlist)) { foreach($optionlist as $var) { ?><td style="width: 10%"><?=$var?></td><? } } ?><td style="width: 15%">����ʱ��</td>
</tr>
</thead>
<? if($resultlist) { if(is_array($resultlist)) { foreach($resultlist as $tid => $value) { ?><tbody>
<tr>
<td class="icon"><?=$value['icon']?></td>
<th><a href="viewthread.php?tid=<?=$tid?>" target="_blank"><?=$value['subject']?></a></th><? if(is_array($optionlist)) { foreach($optionlist as $identifier => $var) { ?><td style="width: 10%"><? if($value['option'][$identifier]) { ?><?=$value['option'][$identifier]?><? } else { ?>&nbsp;<? } ?></td><? } } ?><td style="width: 15%"><?=$value['dateline']?></td>
</tr>
</tbody><? } } } else { ?>
<tr><td colspan="<?=$colspan?>">�Բ���û���ҵ�ƥ������</td></tr>
<? } ?>
</table>
<? if(!empty($multipage)) { ?><div class="pages_btns s_clear"><?=$multipage?></div><? } ?>
</div>
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
</html><? } } ?>

</div>


<script type="text/javascript">
<? if($sortid) { ?>
ajaxget('post.php?action=threadsorts&sortid=<?=$sortid?>&operate=1&inajax=1', 'threadsorts', 'threadsortswait');
<? } ?>
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