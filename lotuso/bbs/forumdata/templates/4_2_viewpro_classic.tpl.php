<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('viewpro_classic');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/viewpro_classic.htm', 'C:\xampp\htdocs\bbs\./templates/default/header.htm', 1283360267, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/viewpro_classic.htm', 'C:\xampp\htdocs\bbs\./templates/default/footer.htm', 1283360267, '2', './templates/uchome')
|| checktplrefresh('C:\xampp\htdocs\bbs\./templates/default/viewpro_classic.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283360267, '2', './templates/uchome')
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
<link href="forumdata/cache/style_4_moderator.css?Ffa" rel="stylesheet" type="text/css" />
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
<?=$pluginhooks['global_header']?><div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> &raquo; <? if($discuz_uid == $member['uid']) { ?>�ҵ�����<? } else { ?><?=$member['username']?>�ĸ�������<? } ?></div>

<script type="text/javascript">var imagemaxwidth = '<?=IMAGEMAXWIDTH?>';</script>

<div id="wrap" class="wrap with_side special s_clear">
<div class="main">
<div id="profilecontent" class="content">
<div class="itemtitle s_clear">
<h1><?=$member['username']?><? if($member['online']) { ?> <img src="<?=IMGDIR?>/online_buddy.gif" title="��ǰ����" class="online_buddy" /><? } ?></h1>
<ul>
<li>(UID: <?=$member['uid']?>)</li>
</ul>
</div>
<?=$pluginhooks['profile_baseinfo_top']?>
<div id="baseprofile">
<table cellpadding="0" cellpadding="0" class="formtable" style="table-layout:fixed">
<? if($member['allownickname'] && $member['nickname']) { ?>
<tr>
<th>�ǳ�:</th>
<td><?=$member['nickname']?></td>
</tr>
<? } ?>
<tr>
<th width="70">�Ա�:</th>
<td>
<? if($member['gender'] == 1) { ?>��<? } elseif($member['gender'] == 2) { ?>Ů<? } else { ?>����<? } ?>
</td>
</tr>

<? if($member['location']) { ?>
<tr>
<th width="70">����:</th>
<td>
 <?=$member['location']?>
</td>
</tr>
<? } if($member['bday'] != '00-00') { ?>
<tr>
<th width="70">����:</th>
<td>
<?=$member['bday']?>
</td>
</tr>
<? } if($member['bio']) { ?>
<tr>
<th>���ҽ���:</th>
<td style="word-break:all"><?=$member['bio']?></td>
</tr>
<? } ?>
</table>
<table cellpadding="0" cellpadding="0" class="formtable">
<? if($member['site']) { ?>
<tr>
<th>������վ:</th>
<td><a href="<?=$member['site']?>" target="_blank"><?=$member['site']?></a></td>
</tr>
<? } if($member['showemail'] && $adminid > 0) { ?>
<tr>
<th>Email:</th>
<td><?=$member['email']?></td>
</tr>
<? } if($member['qq']) { ?>
<tr>
<th>QQ:</th>
<td><a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=<?=$member['qq']?>&amp;Site=<?=$bbname?>&amp;Menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=1:<?=$member['qq']?>:4"  border="0" alt="QQ" /><?=$member['qq']?></a></td>
</tr>
<? } if($member['icq']) { ?>
<tr>
<th>ICQ:</th>
<td><?=$member['icq']?></td>
</tr>
<? } if($member['yahoo']) { ?>
<tr>
<th>Yahoo:</th>
<td><?=$member['yahoo']?></td>
</tr>
<? } if($member['msn']) { ?>
<tr>
<th>MSN:</th>
<td><? if($member['msn']['1']) { ?><a target="_blank" href="http://settings.messenger.live.com/Conversation/IMMe.aspx?invitee=<?=$member['msn']['1']?>@apps.messenger.live.com&amp;mkt=zh-cn" title="MSN ����"><img style="vertical-align:middle" src="http://messenger.services.live.com/users/<?=$member['msn']['1']?>@apps.messenger.live.com/presenceimage?mkt=zh-cn" width="16" height="16" /><em id="imme_status_<?=$member['msn']['1']?>">MSN ����</em></a><script src="http://messenger.services.live.com/users/<?=$member['msn']['1']?>@apps.messenger.live.com/presence/?cb=showimmestatus" type="text/javascript"></script><? } if($member['msn']['0']) { ?> <?=$member['msn']['0']?><? } ?></td>
</tr>
<? } if($member['taobao']) { ?>
<tr>
<th>��������:</th>
<td><script type="text/javascript">document.write('<a target="_blank" href="http://amos1.taobao.com/msg.ww?v=2&amp;uid='+encodeURIComponent('<?=$member['taobaoas']?>')+'&amp;s=2"><img src="http://amos1.taobao.com/online.ww?v=2&amp;uid='+encodeURIComponent('<?=$member['taobaoas']?>')+'&amp;s=1" alt="��������" border="0" /></a>&nbsp;');</script></td>
</tr>
<? } if($member['alipay']) { ?>
<tr>
<th>֧�����˺�:</th>
<td><?=$member['alipay']?></td>
</tr>
<? } if(is_array($_DCACHE['fields'])) { foreach($_DCACHE['fields'] as $field) { ?><tr>
<th><?=$field['title']?>:</th>
<td>
<? if($field['selective']) { ?>
<?=$field['choices'][$member['field_'.$field['fieldid']]]?>
<? } else { ?>
<?=$member['field_'.$field['fieldid']]?>
<? } ?>
&nbsp;
</td>
</tr><? } } ?></table>
</div>
<?=$pluginhooks['profile_baseinfo_bottom']?>
<hr class="dashline" />

<h3 class="blocktitle lightlink">�û���: <a href="faq.php?action=grouppermission&amp;searchgroupid=<?=$member['groupid']?>" target="_blank"><?=$member['grouptitle']?></a> <? showstars($member['groupstars']); ?> <? if($member['maingroupexpiry']) { ?><em>��Ч���� <?=$member['maingroupexpiry']?></em><? } ?></h3>
<? if($extgrouplist) { ?>
<p>��չ�û���:<? if(is_array($extgrouplist)) { foreach($extgrouplist as $extgroup) { ?><?=$extgroup['title']?><? if($extgroup['expiry']) { ?>&nbsp;(��Ч���� <?=$extgroup['expiry']?>)<? } } } ?></p>
<? } if($modforums) { ?><p>�������°��: <?=$modforums?></p><? } ?>
<div class="s_clear">
<ul class="commonlist right" style="width: 50%">
<li>ע������: <?=$member['regdate']?></li>
<li>�ϴη���: <? if($member['invisible'] && $adminid != 1) { ?>����<? } else { ?><?=$member['lastvisit']?><? } ?></li>
<li>��󷢱�: <?=$member['lastpost']?></li>
<? if($discuz_uid == $member['uid'] || $allowviewip) { ?>
<li>ע�� IP: <?=$member['regip']?> - <?=$member['regiplocation']?></li>
<li>�ϴη��� IP: <?=$member['lastip']?> - <?=$member['lastiplocation']?></li>
<? } ?>
</ul>
<ul class="commonlist">
<li>����������: <?=$member['ranktitle']?> <? showstars($member['rankstars']); ?></li>
<li>�Ķ�Ȩ��: <?=$member['readaccess']?></li>
<li>����: <?=$member['posts']?> ƪ(ռȫ�����ӵ� <?=$percent?>%)</li>
<li>ƽ��ÿ�շ���: <?=$postperday?> ƪ</li>
<li>����: <?=$member['digestposts']?> ƪ</li>
<? if($pvfrequence) { ?><li>ҳ�������: <?=$member['pageviews']?></li><? } ?>
</ul>
</div>
<? if($oltimespan) { ?><p>����ʱ��: �ܼ����� <em><?=$member['totalol']?></em> Сʱ, �������� <em><?=$member['thismonthol']?></em> Сʱ <? showstars(ceil(($member['totalol'] + 1) / 50)); ?> (����ʣ��ʱ�� <span class="bold"><?=$member['olupgrade']?></span> Сʱ)</p><? } ?>

<hr class="dashline" />

<? if($member['medals']) { ?>
<h3 class="blocktitle lightlink">ѫ��</h3><? if(is_array($member['medals'])) { foreach($member['medals'] as $medal) { ?><img src="images/common/<?=$medal['image']?>" border="0" alt="<?=$medal['name']?>" title="<?=$medal['name']?>" /> &nbsp;<? } } ?><hr class="dashline" />
<? } ?>

<h3 class="blocktitle lightlink">����: <?=$member['credits']?></h3>
<p><? $sp = ''; if(is_array($extcredits)) { foreach($extcredits as $id => $credit) { ?><?=$sp?><?=$credit['img']?><?=$credit['title']?>: <?=$member['extcredits'.$id]?> <?=$credit['unit']?><? $sp = ',&nbsp;'; } } ?></p>
<? if($tradeopen) { ?>
<hr class="dashline" />

<h3 class="blocktitle lightlink">�������� <a href="eccredit.php?uid=<?=$member['uid']?>" style="font-size: 12px; color: #09C;">(�鿴��ϸ�����ü�¼)</a></h3>
<p>
�����������: <?=$member['sellercredit']?> <a href="eccredit.php?uid=<?=$member['uid']?>" target="_blank"><img src="images/rank/seller/<?=$member['sellerrank']?>.gif" border="0" class="absmiddle"></a>
������������: <?=$member['buyercredit']?> <a href="eccredit.php?uid=<?=$member['uid']?>" target="_blank"><img src="images/rank/buyer/<?=$member['buyerrank']?>.gif" border="0" class="absmiddle"></a>
</p>
<? } ?>
<?=$pluginhooks['profile_extrainfo']?>

<? if($my_status) { ?>
<style>
.mynarrow { margin: 5px -10px 5px 10px; padding-top: 8px; width: 200px; border-top: 1px dashed #ccc; }
.mynarrow h3.lightlink a { text-decoration: none; }
.with_side .side { width: 220px; }
.with_side .main { margin-left:-220px; }
.with_side .content { margin-left:220px; }
</style><? if(is_array($my_list['wide'])) { foreach($my_list['wide'] as $value) { ?><hr class="dashline" />
<h3 class="blocktitle lightlink"><a href="<?=$value['appurl']?>&from=space"><?=$value['appname']?></a></h3>
<p><? eval($value['myml']); ?></p><? } } } ?>
</div>
</div>
<div class="side">
<div class="profile_side">
<? if($bannedmessages & 2 && ($member['groupid'] == 4 || $member['groupid'] == 5)) { ?>
<div class="avatar">ͷ������</div>
<? } else { ?>
<div class="avatar"><? echo discuz_uc_avatar($member['uid']); ?></div>
<? } ?>
<ul id="profile_act">
<?=$pluginhooks['profile_side_top']?>
<li class="pm"><a href="pm.php?action=new&amp;uid=<?=$member['uid']?>" id="sendpm" prompt="sendpm" onclick="showWindow('sendpm', this.href);return false;">������Ϣ</a></li>
<li class="buddy"><a href="my.php?item=buddylist&amp;newbuddyid=<?=$member['uid']?>&amp;buddysubmit=yes" id="addbuddy" prompt="addbuddy" onclick="ajaxmenu(this, 3000);doane(event);">��Ϊ����</a></li>
<? if($discuz_uid && $magicstatus) { ?><li class="magic"><a href="magic.php?action=index&amp;username=<?=$member['usernameenc']?>" target="_blank">ʹ�õ���</a></li><? } if($allowviewuserthread) { ?>
<li class="searchthread"><a href="my.php?item=threads&amp;uid=<?=$member['uid']?>">�鿴����</a></li>
<li class="searchpost"><a href="my.php?item=posts&amp;uid=<?=$member['uid']?>">�鿴�ظ�</a></li>
<? } else { ?>
<li class="searchpost"><a href="search.php?srchuid=<?=$member['uid']?>&amp;srchfid=all&amp;srchfrom=0&amp;searchsubmit=yes">��������</a></li>
<? } if($ucappopen['UCHOME']) { ?>
<li class="space"><a href="<?=$uchomeurl?>/space.php?uid=<?=$member['uid']?>" target="_blank">���˿ռ�</a></li>
<? } elseif($ucappopen['XSPACE']) { ?>
<li class="space"><a href="<?=$xspaceurl?>/?uid-<?=$member['uid']?>" target="_blank">���˿ռ�</a></li>
<? } ?>
</ul>
<? if($discuz_uid && $magicstatus && $usemagic['user']) { ?>
<ul><? if(is_array($usemagic['user'])) { foreach($usemagic['user'] as $id => $magic) { ?><a href="magic.php?action=mybox&amp;operation=use&amp;type=1&amp;pid=<?=$post['pid']?>&amp;magicid=<?=$id?>" onclick="showWindow('magics', this.href);doane(event);"><img src="images/magics/<?=$magic['pic']?>" title="��<?=$post['author']?>ʹ��<?=$magic['name']?>"></a><? } } ?></ul>
<? } if($allowbanuser || $allowedituser || $member['adminid'] > 0 && $modworkstatus) { ?>
<ul>
<? if($member['adminid'] > 0 && $modworkstatus) { ?><li><a href="stats.php?type=modworks&amp;uid=<?=$member['uid']?>"><span>����ͳ��</span></a></li><? } if($allowbanuser || $allowedituser) { ?>
<li>�������</li>
<li>
<? if($allowbanuser) { ?><a href="<? if($adminid==1) { ?>admincp.php?action=members&operation=ban&username=<?=$member['usernameenc']?>&frames=yes<? } else { ?>modcp.php?action=members&amp;op=ban&amp;uid=<?=$member['uid']?><? } ?>" target="_blank"><span>��ֹ</span></a>&nbsp;<? } if($allowedituser) { ?><a href="<? if($adminid == 1) { ?>admincp.php?action=members&amp;username=<?=$member['usernameenc']?>&amp;submit=yes&frames=yes<? } else { ?>modcp.php?action=members&amp;op=edit&amp;uid=<?=$member['uid']?><? } ?>" target="_blank"><span>�༭</span></a>&nbsp;<? } ?>
<a href="modcp.php?action=threads&amp;op=posts&amp;do=search&amp;searchsubmit=1&amp;users=<?=$member['usernameenc']?>" target="_blank">����</a>
</li>
<? } ?>
</ul>
<? } if($my_status) { if($my_list['guide']) { ?>
<ul><? if(is_array($my_list['guide'])) { foreach($my_list['guide'] as $value) { ?><li style="background-image: url(http://appicon.manyou.com/icons/<?=$value['appid']?>)"><? eval($value['profilelink']); ?></li><? } } ?></ul>
<? } if(is_array($my_list['narrow'])) { foreach($my_list['narrow'] as $value) { ?><div class="mynarrow">
<h3 class="blocktitle lightlink"><a href="<?=$value['appurl']?>&from=space"><?=$value['appname']?></a></h3><? eval($value['myml']); ?></div><? } } } ?>
</div>
<?=$pluginhooks['profile_side_bottom']?>
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