<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('viewthread');
0
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/header.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread_node.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\./templates/default/viewthread_fastpost.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\././templates/buluonew413/footer.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\./templates/default/viewthread_pay.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\./templates/default/seditor.htm', 1283192310, '3', './templates/buluonew413')
|| checktplrefresh('C:\xampp\htdocs\bbs\././templates/buluonew413/viewthread.htm', 'C:\xampp\htdocs\bbs\./templates/default/jsmenu.htm', 1283192310, '3', './templates/buluonew413')
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
<link href="forumdata/cache/style_3_moderator.css?V1t" rel="stylesheet" type="text/css" />
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
<?=$pluginhooks['global_header']?><? if($forum['ismoderator']) { ?>
<script src="<?=$jspath?>moderate.js?<?=VERHASH?>" type="text/javascript"></script>
<? } if($thread['special']) { ?>
<link rel="stylesheet" type="text/css" href="forumdata/cache/style_<?=STYLEID?>_special.css?<?=VERHASH?>" />
<? } ?>

<script src="<?=$jspath?>viewthread.js?<?=VERHASH?>" type="text/javascript"></script>
<script type="text/javascript">zoomstatus = parseInt(<?=$zoomstatus?>);var imagemaxwidth = '<?=IMAGEMAXWIDTH?>';var aimgcount = new Array();</script>

<div id="nav">
<? if($forumjump == 1) { ?><a href="<?=$indexname?>" id="fjump" onmouseover="showMenu({'ctrlid':this.id})" class="dropmenu"><?=$bbname?></a><? } else { ?><a href="<?=$indexname?>"><?=$bbname?></a><? } ?><?=$navigation?>
</div>

<?=$pluginhooks['viewthread_top']?>

<? if($admode && !empty($advlist['text'])) { ?><div class="ad_text" id="ad_text"><table summary="Text Ad" cellpadding="0" cellspacing="1"><?=$advlist['text']?></table></div><? } else { ?><div id="ad_text"></div><? } if($forum['ismoderator']) { ?>
<ul class="popupmenu_popup headermenu_popup inlinelist" id="modopt_menu" style="width: 180px; display: none"><? $modopt=0; if($thread['digest'] >= 0) { if($allowdelpost) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(3, 'delete')">ɾ������</a></li><? } if($allowbumpthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(3, 'down')">�����³�</a></li><? } if($allowstickthread && ($thread['displayorder'] <= 3 || $adminid == 1)) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(1, 'stick')">�����ö�</a></li><? } if($allowhighlightthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(1, 'highlight')">������ʾ</a></li><? } if($allowdigestthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(1, 'digest')">���þ���</a></li><? } if($allowrecommendthread && $forum['modrecommend']['open'] && $forum['modrecommend']['sort'] != 1) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(1, 'recommend')">�Ƽ�����</a></li><? } if($allowstampthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('stamp')">�������</a></li><? } if($allowclosethread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(4)">�رմ�</a></li><? } if($allowmovethread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(2, 'move')">�ƶ�����</a></li><? } if($allowedittypethread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modthreads(2, 'type')">�������</a></li><? } if(!$thread['special']) { if($allowcopythread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('copy')">��������</a></li><? } if($allowmergethread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('merge')">�ϲ�����</a></li><? } if($allowrefund && $thread['price'] > 0) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('refund')">ǿ���˿�</a></li><? } } if($allowsplitthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('split')">�ָ�����</a></li><? } if($allowrepairthread) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('repair')">�޸�����</a></li><? } } if($allowremovereward && $thread['special'] == 3) { $modopt++ ?><li class="wide"><a href="javascript:;" onclick="modaction('removereward')">ȡ������</a></li><? } ?>
</ul>
<? if($allowwarnpost || $allowbanpost || $allowdelpost) { ?>
<div id="modlayer" style="display:none;position:position;width:165px;">
<span>ѡ��</span><strong id="modcount"></strong><span>ƪ: </span>
<? if($allowwarnpost) { ?>
<a href="javascript:;" onclick="modaction('warn')">����</a>
<? } if($allowbanpost) { ?>
<a href="javascript:;" onclick="modaction('banpost')">����</a>
<? } if($allowdelpost) { ?>
<a href="javascript:;" onclick="modaction('delpost')">ɾ��</a>
<? } ?>
</div>
<? } } ?>

<div id="wrap" class="wrap s_clear threadfix">
<div class="forumcontrol">
<table cellspacing="0" cellpadding="0">
<tr>
<td class="modaction">
<? if($forum['ismoderator'] && $modopt) { ?>
<span id="modopt" onclick="$('modopt').id = 'modopttmp';this.id = 'modopt';showMenu({'ctrlid':this.id})" class="dropmenu">�������</span>
<? } ?>
</td>
<td>
<?=$multipage?>
<span class="pageback"<? if($visitedforums) { ?> id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id})"<? } ?>><a href="<?=$upnavlink?>">�����б�</a></span>
<? if($allowpostreply) { ?>
<span class="replybtn" id="post_reply" prompt="post_reply"><a href="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>" onclick="showWindow('reply', this.href);return false;">�ظ�</a></span>
<? } ?>
<span class="postbtn" id="newspecial" prompt="post_newthread" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"><a href="post.php?action=newthread&amp;fid=<?=$fid?>" onclick="showWindow('newthread', this.href);return false;">����</a></span>
</td>
</tr>
</table>
</div>

<? if($allowpost && ($allowposttrade || $allowpostpoll || $allowpostreward || $allowpostactivity || $allowpostdebate || $threadplugins || $forum['threadsorts'])) { ?>
<ul class="popupmenu_popup postmenu" id="newspecial_menu" style="display: none">
<? if(!$forum['allowspecialonly']) { ?><li><a href="post.php?action=newthread&amp;fid=<?=$fid?>" onclick="showWindow('newthread', this.href);doane(event)">���»���</a></li><? } if($allowpostpoll) { ?><li class="poll"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=1">����ͶƱ</a></li><? } if($allowpostreward) { ?><li class="reward"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=3">��������</a></li><? } if($allowpostdebate) { ?><li class="debate"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=5">��������</a></li><? } if($allowpostactivity) { ?><li class="activity"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=4">�����</a></li><? } if($allowposttrade) { ?><li class="trade"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;special=2">������Ʒ</a></li><? } if($threadplugins) { if(is_array($forum['threadplugin'])) { foreach($forum['threadplugin'] as $tpid) { if(array_key_exists($tpid, $threadplugins) && @in_array($tpid, $allowthreadplugin)) { ?>
<li class="popupmenu_option"<? if($threadplugins[$tpid]['icon']) { ?> style="background-image:url(<?=$threadplugins[$tpid]['icon']?>)"<? } ?>><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;specialextra=<?=$tpid?>"><?=$threadplugins[$tpid]['name']?></a></li>
<? } } } } if($forum['threadsorts'] && !$forum['allowspecialonly']) { if(is_array($forum['threadsorts']['types'])) { foreach($forum['threadsorts']['types'] as $id => $threadsorts) { if($forum['threadsorts']['show'][$id]) { ?>
<li class="popupmenu_option"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;sortid=<?=$id?>"><?=$threadsorts?></a></li>
<? } } } if(is_array($forum['typemodels'])) { foreach($forum['typemodels'] as $id => $model) { ?><li class="popupmenu_option"><a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;modelid=<?=$id?>"><?=$model['name']?></a></li><? } } } ?>
</ul>
<? } ?>

<div id="postlist" class="mainbox viewthread"><? $postcount = 0; if(is_array($postlist)) { foreach($postlist as $post) { ?><div id="post_<?=$post['pid']?>"><? $needhiddenreply = ($hiddenreplies && $discuz_uid != $post['authorid'] && $discuz_uid != $thread['authorid'] && !$post['first'] && !$forum['ismoderator']); ?><table id="pid<?=$post['pid']?>" summary="pid<?=$post['pid']?>" cellspacing="0" cellpadding="0">
<? if(!empty($fav) && $rpid == $post['pid']) { ?>
<tr class="threadad">
<td class="postauthor"></td>
<td class="adcontent">
<div id="ntc_jp">
<div class="s_clear">
<a class="deloption" href="my.php?item=attention&amp;action=remove&amp;tid=<?=$tid?>" id="attention_remove_<?=$post['pid']?>" onclick="ajaxmenu(this, 3000);doane(event);" title="ȡ����ע">ȡ����ע</a>
<em>�������»ظ�</em>
<h2><a href="viewthread.php?tid=<?=$tid?>"><?=$thread['subject']?></a></h2>
</div>
</div>
</td>
</tr>
<? } ?>
<tr>
<td class="postauthor" rowspan="2">
<? if($post['authorid'] && $post['username'] && !$post['anonymous']) { if($authoronleft) { ?>
<div class="postinfo">
<a target="_blank" href="space.php?uid=<?=$post['authorid']?>" style="margin-left: 20px; font-weight: 800"><?=$post['author']?></a>
</div>
<? } ?>
<div class="popupmenu_popup userinfopanel" id="userinfo<?=$post['pid']?>" style="display: none; position: absolute;<? if($authoronleft) { ?>margin-top: -11px;<? } ?>">
<div class="popavatar">
<div id="userinfo<?=$post['pid']?>_ma"></div>
<ul class="profile_side">
<li class="pm"><a href="pm.php?action=new&amp;uid=<?=$post['authorid']?>" onclick="hideMenu('userinfo<?=$post['pid']?>');showWindow('sendpm', this.href);return false;" title="������Ϣ">������Ϣ</a></li>
<? if($post['msn']['1']) { ?>
<li style="text-indent:0"><a target="_blank" href="http://settings.messenger.live.com/Conversation/IMMe.aspx?invitee=<?=$post['msn']['1']?>@apps.messenger.live.com&amp;mkt=zh-cn" title="MSN ����"><img style="border-style: none; margin-right: 5px; vertical-align: middle;" src="http://messenger.services.live.com/users/<?=$post['msn']['1']?>@apps.messenger.live.com/presenceimage?mkt=zh-cn" width="16" height="16" />MSN ����</a></li>
<? } ?>
<li class="buddy"><a href="my.php?item=buddylist&amp;newbuddyid=<?=$post['authorid']?>&amp;buddysubmit=yes" target="_blank" id="ajax_buddy_<?=$post['count']?>" title="��Ϊ����" onclick="ajaxmenu(this, 3000);doane(event);">��Ϊ����</a></li>
</ul>
<?=$pluginhooks['viewthread_profileside'][$postcount]?>
</div>
<div class="popuserinfo">
<p>
<a href="space.php?uid=<?=$post['authorid']?>" target="_blank"><?=$post['author']?></a>
<? if($post['nickname']) { ?><em>(<?=$post['nickname']?>)</em><? } if($vtonlinestatus && $post['authorid']) { if(($vtonlinestatus == 2 && $onlineauthors[$post['authorid']]) || ($vtonlinestatus == 1 && ($timestamp - $post['lastactivity'] <= 10800) && !$post['invisible'])) { ?>
<em>��ǰ����
<? } else { ?>
<em>��ǰ����
<? } ?>
</em>
<? } ?>
</p>
<? if($post['customstatus']) { ?><p class="customstatus"><?=$post['customstatus']?></p><? } ?>

<dl class="s_clear"><? @eval('echo "'.$customauthorinfo['2'].'";'); ?></dl>
<div class="imicons">
<? if($post['qq']) { ?><a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=<?=$post['qq']?>&amp;Site=<?=$bbname?>&amp;Menu=yes" target="_blank" title="QQ"><img src="<?=IMGDIR?>/qq.gif" alt="QQ" /></a><? } if($post['icq']) { ?><a href="http://wwp.icq.com/scripts/search.dll?to=<?=$post['icq']?>" target="_blank" title="ICQ"><img src="<?=IMGDIR?>/icq.gif" alt="ICQ" /></a><? } if($post['yahoo']) { ?><a href="http://edit.yahoo.com/config/send_webmesg?.target=<?=$post['yahoo']?>&amp;.src=pg" target="_blank" title="Yahoo"><img src="<?=IMGDIR?>/yahoo.gif" alt="Yahoo!"  /></a><? } if($post['taobao']) { ?><a href="javascript:;" onclick="window.open('http://amos.im.alisoft.com/msg.aw?v=2&uid='+encodeURIComponent('<?=$post['taobaoas']?>')+'&site=cntaobao&s=2&charset=utf-8')" title="taobao"><img src="<?=IMGDIR?>/taobao.gif" alt="��������" /></a><? } if($ucappopen['UCHOME']) { ?>
<a href="<?=$uchomeurl?>/space.php?uid=<?=$post['authorid']?>" target="_blank" title="���˿ռ�"><img src="<?=IMGDIR?>/home.gif" alt="���˿ռ�"  /></a>
<? } elseif($ucappopen['XSPACE']) { ?>
<a href="<?=$xspaceurl?>/?uid-<?=$post['authorid']?>" target="_blank" title="���˿ռ�"><img src="<?=IMGDIR?>/home.gif" alt="���˿ռ�"  /></a>
<? } if($post['site']) { ?><a href="<?=$post['site']?>" target="_blank" title="�鿴������վ"><img src="<?=IMGDIR?>/forumlink.gif" alt="�鿴������վ"  /></a><? } ?>
<a href="space.php?uid=<?=$post['authorid']?>" target="_blank" title="�鿴��ϸ����"><img src="<?=IMGDIR?>/userinfo.gif" alt="�鿴��ϸ����"  /></a>
<?=$pluginhooks['viewthread_imicons'][$postcount]?>
</div>
<div id="avatarfeed"><span id="threadsortswait"></span></div>
</div>
</div>
<? } ?>
<?=$post['newpostanchor']?> <?=$post['lastpostanchor']?>
<? if($post['authorid'] && $post['username'] && !$post['anonymous']) { ?>
<div>
<? if($bannedmessages & 2 && (($post['authorid'] && !$post['username']) || ($post['groupid'] == 4 || $post['groupid'] == 5) || ($post['status'] & 1))) { ?>
<div class="avatar">ͷ������</div>
<? } elseif($post['avatar'] && $showavatars) { ?>
<div class="avatar" onmouseover="showauthor(this, 'userinfo<?=$post['pid']?>')"><a href="space.php?uid=<?=$post['authorid']?>" target="_blank"><?=$post['avatar']?></a></div>
<? } ?>
<p><em><a href="faq.php?action=grouppermission&amp;searchgroupid=<?=$post['groupid']?>" target="_blank"><?=$post['authortitle']?></a></em></p>
</div>
<p><? showstars($post['stars']); ?></p>
<?=$pluginhooks['viewthread_sidetop'][$postcount]?>
<? if($customauthorinfo['1']) { ?><dl class="profile s_clear"><? @eval('echo "'.$customauthorinfo['1'].'";'); ?></dl><? } if($post['medals']) { ?><p><? if(is_array($post['medals'])) { foreach($post['medals'] as $medal) { ?><img src="images/common/<?=$medal['image']?>" alt="<?=$medal['name']?>" title="<?=$medal['name']?>" /><? } } ?></p>
<? } if($discuz_uid && $magicstatus && $usemagic['user']) { ?>
<p><? if(is_array($usemagic['user'])) { foreach($usemagic['user'] as $id => $magic) { ?><a href="magic.php?action=mybox&amp;operation=use&amp;type=1&amp;pid=<?=$post['pid']?>&amp;magicid=<?=$id?>" onclick="showWindow('magics', this.href);doane(event);"><img src="images/magics/<?=$magic['pic']?>" title="��<?=$post['author']?>ʹ��<?=$magic['name']?>"></a><? } } ?></p>
<? } ?>
<?=$pluginhooks['viewthread_sidebottom'][$postcount]?>
<? } else { ?>
<div class="avatar">
<? if(!$post['authorid']) { ?>
<a href="javascript:;">�ο� <em><?=$post['useip']?></em></a>
<? } elseif($post['authorid'] && $post['username'] && $post['anonymous']) { if($forum['ismoderator']) { ?><a href="space.php?uid=<?=$post['authorid']?>" target="_blank">����</a><? } else { ?>����<? } } else { ?>
<?=$post['author']?> <em>���û��ѱ�ɾ��</em>
<? } ?>
</div>
<? } if($allowedituser || $allowbanuser || ($forum['ismoderator'] && $allowviewip && ($thread['digest'] >= 0 || !$post['first']))) { ?>
<hr class="shadowline" />
<p>
��������<br />
<? if($forum['ismoderator'] && $allowviewip && ($thread['digest'] >= 0 || !$post['first'])) { ?>
<a href="topicadmin.php?action=getip&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>" onclick="ajaxmenu(this, 0, 1, 2);doane(event)" title="�鿴 IP" class="lightlink">IP</a>&nbsp;
<? } if($allowedituser) { ?>
<a href="<? if($adminid == 1) { ?>admincp.php?action=members&username=<?=$post['usernameenc']?>&submit=yes&frames=yes<? } else { ?>modcp.php?action=members&op=edit&uid=<?=$post['authorid']?><? } ?>" target="_blank" class="lightlink">�༭</a>&nbsp;
<? } if($allowbanuser) { if($adminid == 1) { ?>
<a href="admincp.php?action=members&amp;operation=ban&amp;username=<?=$post['usernameenc']?>&amp;frames=yes" target="_blank" class="lightlink">��ֹ</a>&nbsp;
<? } else { ?>
<a href="modcp.php?action=members&amp;op=ban&amp;uid=<?=$post['authorid']?>" target="_blank" class="lightlink">��ֹ</a>&nbsp;
<? } } ?>
<a href="modcp.php?action=threads&amp;op=posts&amp;do=search&amp;searchsubmit=1&amp;users=<?=$post['usernameenc']?>" target="_blank" class="lightlink">����</a>
</p>
<? } ?>
</td>
<td class="postcontent">
<? if($post['first']) { ?><div id="threadstamp"><? if($threadstamp) { ?><img src="images/stamps/<?=$threadstamp['url']?>" title="<?=$threadstamp['text']?>" /><? } ?></div><? } ?>
<div class="postinfo">
<strong><a title="���Ʊ�������" id="postnum<?=$post['pid']?>" href="javascript:;" onclick="setCopy('<?=$boardurl?><? if($post['first']) { ?>viewthread.php?tid=<?=$tid?><?=$fromuid?><? } else { ?>redirect.php?goto=findpost&amp;ptid=<?=$tid?>&amp;pid=<?=$post['pid']?><?=$fromuid?><? } ?>', '���ӵ�ַ�Ѿ����Ƶ�������')"><? if(!empty($postno[$post['number']])) { ?><?=$postno[$post['number']]?><? } else { ?><em><?=$post['number']?></em><?=$postno['0']?><? } ?></a>
<? if(!$postcount) { ?>
<em class="rpostno" title="��ת��ָ��¥��">��ת�� <input id="rpostnovalue" size="3" type="text" class="txtarea" onkeydown="if(event.keyCode==13) {$('rpostnobtn').click();return false;}" /><span id="rpostnobtn" onclick="window.location='redirect.php?ptid=<?=$tid?>&ordertype=<?=$ordertype?>&postno='+$('rpostnovalue').value">&raquo;</span></em>
<? } if($post['first']) { if($ordertype != 1) { ?>
<a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;ordertype=1" class="left">������</a>
<? } else { ?>
<a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;ordertype=2" class="left">������</a>
<? } } ?>
</strong>
<div class="posterinfo">
<div class="pagecontrol">
<? if($post['first']) { ?>
<a href="viewthread.php?action=printable&amp;tid=<?=$tid?>" target="_blank" class="print left">��ӡ</a>
<? if(MSGBIGSIZE) { ?>
<div class="msgfsize right">
<label>�����С: </label><small onclick="$('postlist').className='mainbox viewthread'" title="����">t</small><big onclick="$('postlist').className='mainbox viewthread t_bigfont'" title="�Ŵ�">T</big>
</div>
<? } } elseif($thread['special'] == 5) { ?>
<span class="debatevote poststand_<? echo intval($post['stand']); ?>">
<label><? if($post['stand'] == 1) { ?><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=1" title="ֻ������">����</a>
<? } elseif($post['stand'] == 2) { ?><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=2" title="ֻ������">����</a>
<? } else { ?><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=0" title="ֻ������">����</a><? } ?>
</label>
<? if($post['stand']) { ?>
<span><a href="misc.php?action=debatevote&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>" id="voterdebate_<?=$post['pid']?>" onclick="ajaxmenu(this);doane(event);">֧����</a><?=$post['voters']?></span>
<? } ?>
</span>
<? } ?>
</div>
<div class="authorinfo">
<? if(!$post['anonymous'] && $_DCACHE['groupicon'][$post['groupid']]) { ?>
<img class="authicon" id="authicon<?=$post['pid']?>" src="<?=$_DCACHE['groupicon'][$post['groupid']]?>" onclick="showauthor(this, 'userinfo<?=$post['pid']?>')" />
<? } else { ?>
<img class="authicon" id="authicon<?=$post['pid']?>" src="images/common/online_member.gif" onclick="showauthor(this, 'userinfo<?=$post['pid']?>');" />
<? } if($post['authorid'] && !$post['anonymous']) { if(!$authoronleft) { ?><a href="space.php?uid=<?=$post['authorid']?>" class="posterlink" target="_blank"><?=$post['author']?></a><? } ?><?=$pluginhooks['viewthread_postheader'][$postcount]?><em id="authorposton<?=$post['pid']?>">������ <?=$post['dateline']?></em>
<? if(!$authorid) { ?>
 | <a href="viewthread.php?tid=<?=$post['tid']?>&amp;page=<?=$page?>&amp;authorid=<?=$post['authorid']?>" rel="nofollow">ֻ��������</a>
<? } else { ?>
 | <a href="viewthread.php?tid=<?=$post['tid']?>&amp;page=<?=$page?>" rel="nofollow">��ʾȫ������</a>
<? } } elseif($post['authorid'] && $post['username'] && $post['anonymous']) { ?>
���� <?=$pluginhooks['viewthread_postheader'][$postcount]?><em id="authorposton<?=$post['pid']?>">������ <?=$post['dateline']?></em>
<? } elseif(!$post['authorid'] && !$post['username']) { ?>
�ο� <?=$pluginhooks['viewthread_postheader'][$postcount]?><em id="authorposton<?=$post['pid']?>">������ <?=$post['dateline']?></em>
<? } ?>
</div>
</div>
</div>
<div class="defaultpost">
<? if($admode && !empty($advlist['thread2'][$post['count']])) { ?><div class="ad_textlink2" id="ad_thread2_<?=$post['count']?>"><?=$advlist['thread2'][$post['count']]?></div><? } else { ?><div id="ad_thread2_<?=$post['count']?>"></div><? } if($admode && !empty($advlist['thread3'][$post['count']])) { ?><div class="ad_pip" id="ad_thread3_<?=$post['count']?>"><?=$advlist['thread3'][$post['count']]?></div><? } else { ?><div id="ad_thread3_<?=$post['count']?>"></div><? } ?><div id="ad_thread4_<?=$post['count']?>"></div>
<div class="postmessage <? if($post['first']) { ?>firstpost<? } ?>">
<? if($post['warned']) { ?>
<span class="postratings"><a href="misc.php?action=viewwarning&amp;tid=<?=$tid?>&amp;uid=<?=$post['authorid']?>" title="�ܵ�����" onclick="showWindow('viewwarning', this.href);return false;"><img src="<?=IMGDIR?>/warning.gif" border="0" /></a></span>
<? } if($thread['special'] == 3 && $post['first']) { if($thread['price'] > 0) { ?>
<cite class="re_unsolved">δ���</cite>
<? } elseif($thread['price'] < 0) { ?>
<cite class="re_solved">�ѽ��</cite>
<? } if($activityclose) { ?><cite class="re_solved">��ѽ���</cite><? } } if($post['first']) { ?>
<div id="threadtitle">
<? if($thread['readperm']) { ?><em>�����Ķ�Ȩ�� <?=$thread['readperm']?></em><? } ?>
<h1><?=$thread['subject']?></h1>
<? if($thread['tags'] || $relatedkeywords) { ?>
<div class="threadtags">
<? if($thread['tags']) { ?><?=$thread['tags']?><? } if($relatedkeywords) { ?><span class="postkeywords"><?=$relatedkeywords?></span><? } ?>
</div>
<? } ?>
</div>
<? } elseif($post['subject']) { ?>
<h2><?=$post['subject']?></h2>
<? } if($adminid != 1 && $bannedmessages & 1 && (($post['authorid'] && !$post['username']) || ($post['groupid'] == 4 || $post['groupid'] == 5))) { ?>
<div class="locked">��ʾ: <em>���߱���ֹ��ɾ�� �����Զ�����</em></div>
<? } elseif($adminid != 1 && $post['status'] & 1) { ?>
<div class="locked">��ʾ: <em>����������Ա���������</em></div>
<? } elseif($needhiddenreply) { ?>
<div class="locked">���������߿ɼ�</div>
<? } elseif($post['first'] && $threadpay) { if($thread['freemessage']) { ?>
<div id="postmessage_<?=$pid?>" class="t_msgfont"><?=$thread['freemessage']?></div>
<? } ?>
<div class="locked">
<a href="javascript:;" class="right viewpay" title="��������" onclick="showWindow('pay', 'misc.php?action=pay&tid=<?=$tid?>&pid=<?=$post['pid']?>')">��������</a>
<em class="right">
�ѹ�������:<?=$thread['payers']?>&nbsp; <a href="misc.php?action=viewpayments&amp;tid=<?=$tid?>" onclick="showWindow('pay', this.href);return false;">��¼</a>
</em>
<? if($thread['price'] > 0) { ?>��������������֧�� <strong><?=$thread['price']?> <?=$extcredits[$creditstransextra['1']]['title']?> </strong> �������<? } if($thread['endtime']) { ?>�����⹺���ֹ����Ϊ <?=$thread['endtime']?>�����ں����<? } ?>
</div>
</div><? } else { ?>
<?=$pluginhooks['viewthread_posttop'][$postcount]?>
<? if($bannedmessages & 1 && (($post['authorid'] && !$post['username']) || ($post['groupid'] == 4 || $post['groupid'] == 5))) { ?>
<div class="locked">��ʾ: <em>���߱���ֹ��ɾ�� �����Զ����Σ�ֻ�й���Ա�ɼ�</em></div>
<? } elseif($post['status'] & 1) { ?>
<div class="locked">��ʾ: <em>����������Ա��������Σ�ֻ�й���Ա�ɼ�</em></div>
<? } if($post['first']) { if($thread['price'] > 0 && $thread['special'] == 0) { ?>
<div class="locked"><em class="right"><a href="misc.php?action=viewpayments&amp;tid=<?=$tid?>" onclick="showWindow('pay', this.href);return false;">��¼</a></em>��������, �۸�:<strong><?=$extcredits[$creditstransextra['1']]['title']?> <?=$thread['price']?> <?=$extcredits[$creditstransextra['1']]['unit']?> </strong></div>
<? } if($typetemplate) { ?>
<?=$typetemplate?>
<? } elseif($optionlist && !($post['status'] & 1) && !$threadpay) { ?>
<div class="typeoption">
<h4><?=$forum['threadsorts']['types'][$thread['sortid']]?></h4>
<table summary="������Ϣ" cellpadding="0" cellspacing="0" class="formtable datatable"><? if(is_array($optionlist)) { foreach($optionlist as $option) { ?><tr class="<? echo swapclass('colplural'); ?>">
<th><?=$option['title']?></th>
<td><? if($option['value']) { ?><?=$option['value']?> <?=$option['unit']?><? } else { ?>-<? } ?></td>
</tr><? } } ?></table>
</div>
<? } if($thread['special'] == 1) { include template('viewthread_poll', '0', ''); } elseif($thread['special'] == 3) { include template('viewthread_reward_price', '0', ''); } elseif($thread['special'] == 4) { include template('viewthread_activity_info', '0', ''); } elseif($thread['special'] == 5) { include template('viewthread_debate_umpire', '0', ''); } elseif($threadplughtml) { ?>
<?=$threadplughtml?>
<? } } ?>
<div class="<? if(!$thread['special']) { ?>t_msgfontfix<? } else { ?>specialmsg<? } ?>">
<table cellspacing="0" cellpadding="0"><tr><td class="t_msgfont" id="postmessage_<?=$post['pid']?>"><?=$post['message']?></td></tr></table>
<? if($post['first']) { if($thread['special'] == 2) { include template('viewthread_trade', '0', ''); } elseif($thread['special'] == 3) { if($bapid) { $bestpost = $postlist[$bapid];unset($postlist[$bapid]); } include template('viewthread_reward', '0', ''); } elseif($thread['special'] == 4) { include template('viewthread_activity', '0', ''); } elseif($thread['special'] == 5) { include template('viewthread_debate', '0', ''); } } if($post['attachment']) { ?>
<div class="locked">����: <em><? if($discuz_uid) { ?>�����ڵ��û����޷����ػ�鿴����<? } else { ?>����Ҫ<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;" class="lightlink">��¼</a>�ſ������ػ�鿴������û���ʺţ�<a href="<?=$regname?>" onclick="hideWindow('login');showWindow('register', this.href);return false;" title="ע���ʺ�" class="lightlink"><?=$reglinkname?></a><? } ?></em></div>
<? } elseif($hideattach[$post['pid']] && $post['attachments']) { ?>
<div class="locked">����: <em>����������Ҫ�ظ��ſ����ػ�鿴</em></div>
<? } elseif($post['imagelist'] || $post['attachlist']) { ?>
<div class="postattachlist">
<? if($post['imagelist']) { ?>
<?=$post['imagelist']?>
<? } if($post['attachlist']) { ?>
<?=$post['attachlist']?>
<? } ?>
</div>
<? } if($relatedthreadlist && !$qihoo['relate']['position'] && $post['first']) { ?>
<div class="tagrelated">
<h3><em><a href="http://search.qihoo.com/sint/qusearch.html?kw=<?=$searchkeywords?>&amp;sort=rdate&amp;ics=<?=$charset?>&amp;domain=<?=$site?>&amp;tshow=1" target="_blank">�����������</a></em>�������</h3>
<ul><? if(is_array($relatedthreadlist)) { foreach($relatedthreadlist as $key => $threads) { if($threads['tid'] != $tid) { ?>
<li>
<? if(!$threads['insite']) { ?>
[վ��] <a href="topic.php?url=<? echo urlencode($threads['tid']); ?>&amp;md5=<? echo md5($threads['tid']); ?>&amp;statsdata=<?=$fid?>||<?=$tid?>" target="_blank"><?=$threads['title']?></a>&nbsp;&nbsp;&nbsp;
[ <a href="post.php?action=newthread&amp;fid=<?=$fid?>&amp;extra=<?=$extra?>&amp;url=<? echo urlencode($threads['tid']); ?>&amp;md5=<? echo md5($threads['tid']); ?>&amp;from=direct" style="color: #090" target="_blank">ת��</a> ]
<? } else { ?>
<a href="viewthread.php?tid=<?=$threads['tid']?>&amp;statsdata=<?=$fid?>||<?=$tid?>" target="_blank"><?=$threads['title']?></a>
<? } ?>
</li>
<? } } } ?></ul>
</div>
<? } if($post['first'] && $relatedtagstatus) { ?>
<div id="relatedtags"></div>
<script src="tag.php?action=relatetag&rtid=<?=$tid?>" type="text/javascript" reload="1"></script>
<? } ?>
</div>
<?=$pluginhooks['viewthread_postbottom'][$postcount]?>

<? if(!empty($post['ratelog'])) { ?>
<dl class="newrate">
<dt>
<? if(!empty($postlist[$post['pid']]['totalrate'])) { ?>
<strong><a href="misc.php?action=viewratings&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>" onclick="showWindow('viewratings', this.href);return false;" title="����������ּ�¼"><? echo count($postlist[$post['pid']]['totalrate']);; ?></a></strong>
<p>��������</p>
<? } ?>
</dt>
<dd>
<ul class="s_clear">
<div id="post_rate_<?=$post['pid']?>"></div>
<? if($ratelogon) { ?>
<ul class="s_clear ratelist"><? if(is_array($post['ratelog'])) { foreach($post['ratelog'] as $uid => $ratelog) { ?><li id="rate_<?=$post['pid']?>_<?=$uid?>" class="ratelistavatar">
<a href="space.php?uid=<?=$uid?>" target="_blank"><? echo discuz_uc_avatar($uid, 'small');; ?></a><a href="space.php?uid=<?=$uid?>" target="_blank"><?=$ratelog['username']?>:</a>
<?=$ratelog['reason']?><? if(is_array($ratelog['score'])) { foreach($ratelog['score'] as $id => $score) { if($score > 0) { ?>
<em><?=$extcredits[$id]['title']?> + <?=$score?> <?=$extcredits[$id]['unit']?></em>
<? } else { ?>
<span><?=$extcredits[$id]['title']?> <?=$score?> <?=$extcredits[$id]['unit']?></span>
<? } } } ?></li><? } } ?></ul>
<? } else { if(is_array($post['ratelog'])) { foreach($post['ratelog'] as $uid => $ratelog) { ?><li>
<div id="rate_<?=$post['pid']?>_<?=$uid?>_menu" class="attach_popup" style="display: none;">
<p class="cornerlayger"><?=$ratelog['reason']?> &nbsp;&nbsp;<? if(is_array($ratelog['score'])) { foreach($ratelog['score'] as $id => $score) { if($score > 0) { ?>
<em><?=$extcredits[$id]['title']?> + <?=$score?> <?=$extcredits[$id]['unit']?></em>
<? } else { ?>
<span><?=$extcredits[$id]['title']?> <?=$score?> <?=$extcredits[$id]['unit']?></span>
<? } } } ?></p>
<p class="minicorner"></p>
</div>
<p id="rate_<?=$post['pid']?>_<?=$uid?>" onmouseover="showMenu({'ctrlid':this.id,'pos':'12'})" class="rateavatar"><a href="space.php?uid=<?=$uid?>" target="_blank"><? echo discuz_uc_avatar($uid, 'small');; ?></a></p>
<p><a href="space.php?uid=<?=$uid?>" target="_blank"><?=$ratelog['username']?></a></p>
</li><? } } } ?>
</ul>
</dd>
</dl>
<? } else { ?>
<div id="post_rate_div_<?=$post['pid']?>"></div>
<? } } if($post['first']) { if($lastmod['modaction']) { ?><div class="modact"><a href="misc.php?action=viewthreadmod&amp;tid=<?=$tid?>" title="���������¼" onclick="showWindow('viewthreadmod', this.href);return false;">�������� <?=$lastmod['modusername']?> �� <?=$lastmod['moddateline']?> <?=$lastmod['modaction']?></a></div><? } if($lastmod['magicname']) { ?><div class="modact"><a href="misc.php?action=viewthreadmod&amp;tid=<?=$tid?>" title="���������¼" onclick="showWindow('viewthreadmod', this.href);return false;">�������� <?=$lastmod['modusername']?> �� <?=$lastmod['moddateline']?> ʹ�� <?=$lastmod['magicname']?> ����</a></div><? } ?>
<div class="useraction<? if($allowrecommend && $recommendthread['status']) { ?> nrate<? } ?>">
<a href="javascript:;" onclick="showDialog($('favoritewin').innerHTML, 'info', '�ղ�/��ע')">�ղ�</a>
<a href="javascript:;" id="share" onclick="showDialog($('sharewin').innerHTML, 'info', '����')">����</a>
<? if($allowrecommend && $recommendthread['status']) { ?>
<div id="ajax_recommendlink">
<div id="recommendv" onclick="switchrecommendv()" title="��������ָ��"<? if($recommendthread['defaultshow']) { ?> style="display: none"<? } ?>><?=$thread['recommends']?></div>
<ul id="recommendav" onclick="switchrecommendv()" title="��������ָ��"<? if(!$recommendthread['defaultshow']) { ?> style="display: none"<? } ?> class="recommend_act s_clear">
<li id="recommendv_add" title="<?=$recommendthread['addtext']?>������"><?=$thread['recommend_add']?></li>
<li id="recommendv_subtract"  title="<?=$recommendthread['subtracttext']?>������"><?=$thread['recommend_sub']?></li>
</ul>
<ul class="recommend_act s_clear">
<li><a id="recommend_add" <? if($discuz_uid) { ?>href="misc.php?action=recommend&amp;do=add&amp;tid=<?=$tid?>" onclick="ajaxmenu(this, 3000, 1, 0, '43', 'recommendupdate(<?=$allowrecommend?>)');;doane(event);"<? } else { ?>href="logging.php?action=login" onclick="showWindow('login', this.href);return false;"<? } ?>><?=$recommendthread['addtext']?></a></li>
<li><a id="recommend_subtract"<? if($discuz_uid) { ?>href="misc.php?action=recommend&amp;do=subtract&amp;tid=<?=$tid?>" onclick="ajaxmenu(this, 3000, 1, 0, '43', 'recommendupdate(-<?=$allowrecommend?>)');;doane(event);"<? } else { ?>href="logging.php?action=login" onclick="showWindow('login', this.href);return false;"<? } ?>><?=$recommendthread['subtracttext']?></a></li>
</ul>
</div>
<? } ?>
<?=$pluginhooks['viewthread_useraction']?>
</div>
<? } ?>
</div>

</div>
</td></tr>
<tr><td class="postcontent postbottom">
<? if($post['signature'] && ($bannedmessages & 4 && (($post['authorid'] && !$post['username']) || ($post['groupid'] == 4 || $post['groupid'] == 5) || ($post['status'] & 1)))) { ?>
<div class="signatures">ǩ��������</div>
<? } elseif($post['signature'] && !$post['anonymous'] && $showsignatures) { ?>
<div class="signatures" style="max-height:<?=$maxsigrows?>px;maxHeightIE:<?=$maxsigrows?>px;"><?=$post['signature']?></div>
<? } if($admode && !empty($advlist['thread1'][$post['count']])) { ?><div class="ad_textlink1" id="ad_thread1_<?=$post['count']?>"><?=$advlist['thread1'][$post['count']]?></div><? } else { ?><div id="ad_thread1_<?=$post['count']?>"></div><? } ?>
</td>
</tr>
<tr>
<td class="postauthor"></td>
<td class="postcontent">
<div class="postactions">
<? if($forum['ismoderator'] && ($allowdelpost || $allowbanpost)) { ?>
<span class="right">
<label for="manage<?=$post['pid']?>">
<? if($post['first'] && $thread['digest'] == -1) { ?>
<input type="checkbox" id="manage<?=$post['pid']?>" disabled="disabled" />
<? } else { ?>
<input type="checkbox" id="manage<?=$post['pid']?>" <? if(!empty($modclick)) { ?>checked="checked" <? } ?>onclick="pidchecked(this);modclick(this, <?=$post['pid']?>)" value="<?=$post['pid']?>" />
<? } ?>
����
</label>
</span>
<? } ?>
<div class="postact s_clear">
<em>
<? if($allowpostreply) { ?>
<a class="fastreply" href="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;reppost=<?=$post['pid']?>&amp;extra=<?=$extra?>&amp;page=<?=$page?>" onclick="showWindow('reply', this.href);return false;">�ظ�</a>
<? if(!$needhiddenreply) { ?>
<a class="repquote" href="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;repquote=<?=$post['pid']?>&amp;extra=<?=$extra?>&amp;page=<?=$page?>" onclick="showWindow('reply', this.href);return false;">����</a>
<? } } if((($forum['ismoderator'] && $alloweditpost && !(in_array($post['adminid'], array(1, 2, 3)) && $adminid > $post['adminid'])) || ($forum['alloweditpost'] && $discuz_uid && $post['authorid'] == $discuz_uid)) && ($thread['digest'] >= 0 || !$post['first'])) { ?>
<a class="editpost" href="post.php?action=edit&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>&amp;page=<?=$page?>"><? if($thread['special'] == 2 && !$post['message']) { ?>���ӹ�̨����<? } else { ?>�༭</a><? } } ?>
<?=$pluginhooks['viewthread_postfooter'][$postcount]?>
</em>
<p>
<? if($thread['special'] == 3 && ($forum['ismoderator'] || $thread['authorid'] == $discuz_uid) && $discuz_uid != $post['authorid'] && $post['authorid'] != $thread['authorid'] && $post['first'] == 0 && $thread['price'] > 0) { ?>
<a href="javascript:;" onclick="setanswer(<?=$post['pid']?>)">��Ѵ�</a>
<? } if($raterange && $post['authorid']) { ?>
<a href="misc.php?action=rate&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>" onclick="showWindow('rate', this.href);return false;">����</a>
<? } if($post['rate'] && $forum['ismoderator']) { ?>
<a href="misc.php?action=removerate&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>&amp;page=<?=$page?>" onclick="showWindow('rate', this.href);return false;">��������</a>
<? } if(!$forum['ismoderator'] && $discuz_uid && $reportpost && $discuz_uid != $post['authorid']) { ?>
<a href="misc.php?action=report&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;pid=<?=$post['pid']?>" onclick="showWindow('report', this.href);doane(event);">����</a>
<? } if($discuz_uid && $magicstatus) { ?>
<a href="magic.php?action=getmagic&amp;fid=<?=$fid?>&amp;pid=<?=$post['pid']?>" id="usermagicopt<?=$post['pid']?>" class="dropmenu" onmouseover="SMAM=setTimeout(function() {ajaxmenu($('usermagicopt<?=$post['pid']?>'), 1000, 1, 2);doane(event);}, 500)" onmouseout="clearTimeout(SMAM)" onclick="if($(this.id + '_menu') && $(this.id + '_menu').style.display == '') {hideMenu(this.id + '_menu')} else {ajaxmenu(this, 1000, 1, 2);}doane(event);">ʹ�õ���</a>
<? } if(!$post['first']) { ?>
<a href="javascript:;" onclick="scrollTo(0,0);">TOP</a>
<? } ?>
</p>
</div>
</div>

</td>
</tr>
<tr class="threadad">
<td class="postauthor"></td>
<td class="adcontent">
<? if($post['first'] && $thread['replies']) { if($admode && !empty($advlist['interthread'])) { ?><div class="ad_column" id="ad_interthread"><?=$advlist['interthread']?><? } else { ?><div id="ad_interthread"><? } ?></div><? } ?>
</td>
</tr>
<? if($post['first'] && $thread['special'] == 5 && $stand != '') { ?>
<tr class="threadad stand_select">
<td class="postauthor" style="background: #EBF2F8;"></td>
<td>
<div class="itemtitle s_clear">
<h2>������ɸѡ: </h2>
<ul>
<li><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>" hidefocus="true"><span>ȫ��</span></a></li>
<li <? if($stand == 1) { ?>class="current"<? } ?>><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=1" hidefocus="true"><span>����</span></a></li>
<li <? if($stand == 2) { ?>class="current"<? } ?>><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=2" hidefocus="true"><span>����</span></a></li>
<li <? if($stand == 0) { ?>class="current"<? } ?>><a href="viewthread.php?tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;stand=0" hidefocus="true"><span>����</span></a></li>
</ul>
</div>
<hr class="solidline" />
</td>
</tr>
<? } ?>
</table>
<? if($aimgs[$post['pid']]) { ?>
<script type="text/javascript" reload="1">aimgcount[<?=$post['pid']?>] = [<? echo implode(',', $aimgs[$post['pid']]);; ?>];attachimgshow(<?=$post['pid']?>);</script>
<? } ?>
<?=$pluginhooks['viewthread_endline'][$postcount]?><? $postcount++; ?></div><? } } ?></div>

<div id="postlistreply" class="mainbox viewthread"><div id="post_new" class="viewthread_table" style="display: none"></div></div>

<form method="post" name="modactions" id="modactions">
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="optgroup" />
<input type="hidden" name="operation" />
<input type="hidden" name="listextra" value="<?=$extra?>" />
</form>

<?=$tagscript?>

<div class="forumcontrol s_clear">
<table cellspacing="0" cellpadding="0" <? if($fastpost) { ?>class="narrow"<? } ?>>
<tr>
<td class="modaction">
<? if($forum['ismoderator'] && $modopt) { ?>
<span id="modopttmp" onclick="$('modopt').id = 'modopttmp';this.id = 'modopt';showMenu({'ctrlid':this.id})" class="dropmenu">�������</span>
<? } ?>
</td>
<td>
<?=$multipage?>
<span class="pageback"<? if($visitedforums) { ?> id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id})"<? } ?>><a href="<?=$upnavlink?>">�����б�</a></span>
<? if(!$fastpost) { ?>
<span class="replybtn"><a href="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>" onclick="showWindow('reply', this.href);return false;">�ظ�</a></span>
<span class="postbtn" id="newspecialtmp" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"><a href="post.php?action=newthread&amp;fid=<?=$fid?>" onclick="showWindow('newthread', this.href);return false;">����</a></span>
<? } ?>
</td>
</tr>
</table>
</div>

<?=$pluginhooks['viewthread_middle']?>

<? if($fastpost && $allowpostreply) { ?><script type="text/javascript">
var postminchars = parseInt('<?=$minpostsize?>');
var postmaxchars = parseInt('<?=$maxpostsize?>');
var disablepostctrl = parseInt('<?=$disablepostctrl?>');
</script>

<div id="f_post" class="mainbox viewthread">
<form method="post" id="fastpostform" action="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>&amp;extra=<?=$extra?>&amp;replysubmit=yes<? if($ordertype != 1) { ?>&amp;infloat=yes&amp;handlekey=fastpost<? } ?>" <? if($ordertype != 1) { ?>onSubmit="return fastpostvalidate(this)"<? } ?>>
<table cellspacing="0" cellpadding="0">
<tr>
<td class="postauthor">
<? if($discuz_uid) { ?><div class="avatar"><? echo discuz_uc_avatar($discuz_uid); ?></div><? } ?>
<?=$pluginhooks['viewthread_fastpost_side']?>
</td>
<td class="postcontent">
<?=$pluginhooks['viewthread_fastpost_content']?>
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="subject" value="" />
<input type="hidden" name="usesig" value="<?=$usesigcheck?>" />
<? if($uchome['addfeed'] && $ucappopen['UCHOME'] && $forum['allowfeed']) { ?>
<input type="hidden" name="addfeed" value="1" />
<? } ?>

<span id="fastpostreturn"></span>
<? if($thread['special'] == 5 && empty($firststand)) { ?>
<div class="s_clear">
<label class="left">ѡ��۵�: </label>
<div class="float_typeid short_select">
<select id="stand" name="stand">
<option value="0">����</option>
<option value="1">����</option>
<option value="2">����</option>
</select>
</div>
<script type="text/javascript">simulateSelect('stand');</script>
</div>
<? } ?>
<div class="editor_tb">
<span class="right">
<a href="post.php?action=reply&amp;fid=<?=$fid?>&amp;tid=<?=$tid?>" onclick="return switchAdvanceMode(this.href)">�߼�ģʽ</a>
<span class="pipe">|</span>
<span id="newspecialtmp" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"><a href="post.php?action=newthread&amp;fid=<?=$fid?>" onclick="showWindow('newthread', this.href);return false;">���»���</a></span>
</span><? $seditor = array('fastpost', array('bold', 'color', 'img', 'link', 'quote', 'code', 'smilies')); ?><link rel="stylesheet" type="text/css" href="forumdata/cache/style_<?=STYLEID?>_seditor.css?<?=VERHASH?>" />
<div>
<? if(in_array('bold', $seditor['1'])) { ?>
<a href="javascript:;" title="����" class="tb_bold" onclick="seditor_insertunit('<?=$seditor['0']?>', '[b]', '[/b]')">B</a>
<? } if(in_array('color', $seditor['1'])) { ?>
<a href="javascript:;" title="��ɫ" class="tb_color" id="<?=$seditor['0']?>forecolor" onclick="showColorBox(this.id, 2, '<?=$seditor['0']?>')">Color</a>
<? } if(in_array('img', $seditor['1'])) { ?>
<a href="javascript:;" title="ͼƬ" class="tb_img" onclick="seditor_insertunit('<?=$seditor['0']?>', '[img]', '[/img]')">Image</a>
<? } if(in_array('link', $seditor['1'])) { ?>
<a href="javascript:;" title="��������" class="tb_link" onclick="seditor_insertunit('<?=$seditor['0']?>', '[url]', '[/url]')">Link</a>
<? } if(in_array('quote', $seditor['1'])) { ?>
<a href="javascript:;" title="����" class="tb_quote" onclick="seditor_insertunit('<?=$seditor['0']?>', '[quote]', '[/quote]')">Quote</a>
<? } if(in_array('code', $seditor['1'])) { ?>
<a href="javascript:;" title="����" class="tb_code" onclick="seditor_insertunit('<?=$seditor['0']?>', '[code]', '[/code]')">Code</a>
<? } if(in_array('smilies', $seditor['1'])) { ?>
<a href="javascript:;" class="tb_smilies" id="<?=$seditor['0']?>smilies" onclick="showMenu({'ctrlid':this.id,'evt':'click','layer':2});return false">Smilies</a>
<script src="forumdata/cache/smilies_var.js?<?=VERHASH?>" type="text/javascript" reload="1"></script>
<script type="text/javascript" reload="1">smilies_show('<?=$seditor['0']?>smiliesdiv', <?=$smcols?>, '<?=$seditor['0']?>');</script>
<? } ?>
</div></div>
<textarea rows="5" cols="80" name="message" id="fastpostmessage" onKeyDown="seditor_ctlent(event, <? if($ordertype != 1) { ?>'fastpostvalidate($(\'fastpostform\'))'<? } else { ?>'$(\'fastpostform\').submit()'<? } ?>);" tabindex="4" class="txtarea"></textarea>
<? if($secqaacheck || $seccodecheck) { ?><div class="fastcheck"><? include template('seccheck', '0', ''); ?></div><? } ?>
<p><button type="submit" name="replysubmit" id="fastpostsubmit" value="replysubmit" tabindex="5">�����ظ�</button>
<? if($ordertype != 1) { ?>
<input id="fastpostrefresh" type="checkbox" /> <label for="fastpostrefresh">��������ת�����һҳ</label></p><script type="text/javascript">if(getcookie('discuz_fastpostrefresh') == 1) {$('fastpostrefresh').checked=true;}</script>
<? } ?>
</p>
</td>
</tr>
</table>
</form>
</div><? } if($relatedthreadlist && $qihoo['relate']['position']) { include template('viewthread_relatedthread', '0', ''); } ?>

<?=$pluginhooks['viewthread_bottom']?>

<? if($visitedforums) { ?>
<ul class="popupmenu_popup" id="visitedforums_menu" style="display: none">
<?=$visitedforums?>
</ul>
<? } if($forumjump) { ?>
<div class="popupmenu_popup" id="fjump_menu" style="display: none">
<?=$forummenu?>
</div>
<? } ?>

<div id="favoritewin" style="display: none">
<h5>
<a href="javascript:;" onclick="ajaxget('my.php?item=favorites&tid=<?=$tid?>', 'favorite_msg');return false;" class="lightlink">[�ղش�����]</a>&nbsp;
<a href="javascript:;" onclick="ajaxget('my.php?item=attention&action=add&tid=<?=$tid?>', 'favorite_msg');return false;" class="lightlink">[��ע��������»ظ�]</a>
</h5>
<span id="favorite_msg"></span>
</div>

<div id="sharewin" style="display: none">
<h5>
<a href="javascript:;" onclick="setCopy('<?=$threadshare?>\n<?=$boardurl?>viewthread.php?tid=<?=$tid?><?=$fromuid?>', '���ӵ�ַ�Ѿ����Ƶ�������<br />�������ÿ�ݼ� Ctrl + V ճ���� QQ��MSN �')" class="lightlink" />[ͨ�� QQ��MSN ����������]</a><br /><br />
<? if($discuz_uid) { ?>
<a href="javascript:;" class="lightlink" onclick="hideWindow('confirm');showWindow('sendpm', 'pm.php?action=new&operation=share&tid=<?=$tid?>');">[ͨ��վ�ڶ���Ϣ����������]</a>
<? } ?>
</h5>
</div>

<? if($maxpage > 1) { ?>
<script type="text/javascript">document.onkeyup = function(e){keyPageScroll(e, <? if($page > 1) { ?>1<? } else { ?>0<? } ?>, <? if($page < $maxpage) { ?>1<? } else { ?>0<? } ?>, 'viewthread.php?tid=<?=$tid?><? if($authorid) { ?>&authorid=<?=$authorid?><? } ?>', <?=$page?>);}</script>
<? } if(!empty($_DCACHE['focus']['data']) && CURSCRIPT == 'viewthread' && empty($_COOKIE['discuz_nofocus'])) { $focus = $_DCACHE['focus'];$focustid = array_rand($focus['data']); ?><div class="focus" id="focus">
<h3 class="float_ctrl">
<em><? if($focus['title']) { ?><?=$focus['title']?><? } else { ?>վ���Ƽ�<? } ?></em>
<span><a href="javascript:;" onclick="setcookie('discuz_nofocus', 1, 3600);$('focus').style.display='none'" class="close deloption" title="�ر�">�ر�</a></span>
</h3>
<hr class="shadowline" />
<div class="detail">
<h4><a href="<?=$focus['data'][$focustid]['url']?>" target="_blank"><?=$focus['data'][$focustid]['subject']?></a></h4>
<p>
<? if($focus['data'][$focustid]['image']) { ?>
<a href="<?=$focus['data'][$focustid]['url']?>" target="_blank">
<img src="<?=$focus['data'][$focustid]['image']?>" width="58" height="58" /></a>
<? } ?>
<?=$focus['data'][$focustid]['summary']?>
</p>
</div>
<hr class="shadowline" />
<a href="<?=$focus['data'][$focustid]['url']?>" class="moreinfo" target="_blank">�鿴</a>
</div>
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
</html><? if($relatedthreadupdate) { ?>
<script src="relatethread.php?tid=<?=$tid?>&subjectenc=<?=$thread['subjectenc']?>&tagsenc=<?=$thread['tagsenc']?>&verifykey=<?=$verifykey?>&up=<?=$qihoo_up?>" type="text/javascript"></script>
<? } if($tagupdate) { ?>
<script src="relatekw.php?tid=<?=$tid?>" type="text/javascript"></script>
<? } if($qihoo['relate']['bbsnum'] && $statsdata) { ?>
<img style="display:none;" src="http://pvstat.qihoo.com/dimana.gif?_pdt=discuz&amp;_pg=s100812&amp;_r=<?=$randnum?>&amp;_dim_k=orgthread&amp;_dim_v=<? echo urlencode($boardurl);; ?>||<?=$statsdata?>||0" width="1" height="1" alt="" />
<img style="display:none;" src="http://pvstat.qihoo.com/dimana.gif?_pdt=discuz&amp;_pg=s100812&amp;_r=<?=$randnum?>&amp;_dim_k=relthread&amp;_dim_v=<?=$statskeywords?>||<?=$statsurl?>" width="1" height="1" alt="" />
<? } ?>