<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('pm');
0
|| checktplrefresh('D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/pm.htm', 'D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/pm_node.htm', 1283657925, '2', './templates/uchome')
|| checktplrefresh('D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/pm.htm', 'D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/seditor.htm', 1283657925, '2', './templates/uchome')
|| checktplrefresh('D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/pm.htm', 'D:\Users\bienfantaisie\Documents\My Web Sites\acghunter\bbs\./templates/default/personal_navbar.htm', 1283657925, '2', './templates/uchome')
;?><? include template('header', '0', ''); ?><div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> &raquo; ����Ϣ</div>

<div id="wrap" class="wrap with_side s_clear">
<div class="main">
<div class="content">
<div class="itemtitle s_clear">
<form id="pm_search" method="get" action="pm.php" class="right">
<input name="search" type="hidden" value="yes" />
<input name="srchtxt" type="text" value="<? if(!empty($search) && $srchtxt !== '') { ?><?=$srchtxtinput?><? } ?>" class="txt" />
<input type="submit" value="����" />
</form>
<h1>����Ϣ</h1>
</div>

<div class="pm_header colplural itemtitle s_clear">
<a href="pm.php?action=new" onclick="showWindow('sendpm', this.href);return false;" class="postpm">+ ���Ͷ���Ϣ</a>
<ul>
<li <? if($filter == 'newpm') { ?>class="current"<? } ?>><a href="pm.php?filter=newpm" hidefocus="true"><span>δ����Ϣ</span></a></li>
<li <? if($filter == 'privatepm') { ?>class="current"<? } ?>><a href="pm.php?filter=privatepm" hidefocus="true"><span>˽����Ϣ</span></a></li>
<li <? if($filter == 'announcepm') { ?>class="current"<? } ?>><a href="pm.php?filter=announcepm" hidefocus="true"><span>������Ϣ</span></a></li>
<li <? if($action == 'viewblack') { ?>class="current"<? } ?>><a href="pm.php?action=viewblack" hidefocus="true"><span>��Ϣ����</span></a></li>
</ul>
</div>

<? if(!$action) { if($pmlist) { ?>
<form method="post" id="pmform" action="pm.php?action=del&amp;filter=<?=$filter?>&amp;page=<?=$page?>">
<input name="readopt" type="hidden" value="0" />
<ul class="pm_list"><? $range = array('', '����', '����', 'ǰ��'); if(is_array($pmlist)) { foreach($pmlist as $key => $pm) { ?><li id="pm_<?=$pm['pmid']?>" class="s_clear <? echo swapclass('colplural'); ?>">
<? if($filter == 'privatepm') { ?>
<a<? if($pm['msgfromurl']) { ?> href="<?=$pm['msgfromurl']?>"<? } ?> target="_blank" class="avatar"><? echo discuz_uc_avatar($pm['touid'], 'small');; ?></a>
<? } else { ?>
<a class="avatar"><? echo discuz_uc_avatar($pm['touid'], 'small');; ?></a>
<? } ?>
<p class="cite">
<? if($pm['msgfrom']) { ?><cite><a<? if($pm['msgfromurl']) { ?> href="<?=$pm['msgfromurl']?>"<? } ?> target="_blank"><?=$pm['msgfrom']?></a></cite><? } if($range[$pm['daterange']]) { ?><?=$range[$pm['daterange']]?> <?=$pm['time']?><? } else { ?><?=$pm['date']?> <?=$pm['time']?><? } if($pm['new'] && $filter != 'announcepm') { ?>&nbsp;&nbsp;<img src="<?=IMGDIR?>/notice_newpm.gif" alt="NEW" /><? } ?>
</p>
<div class="summary">
<? if($filter != 'announcepm') { if($pm['touid']) { ?>
<?=$pm['message']?></div>
<p class="more"><a href="pm.php?uid=<?=$pm['touid']?>&amp;filter=<?=$filter?><? if(!empty($search)) { ?>#pm_<?=$pm['pmid']?><? } else { ?>&amp;daterange=<?=$pm['daterange']?>#new<? } ?>" class="to">�鿴��Ϣ</a></p>
<span class="action">
<input name="uid[]" class="checkbox" type="checkbox" value="<?=$pm['touid']?>" />
<a href="pm.php?action=del&amp;uid=<?=$pm['touid']?>&amp;filter=<?=$filter?>" id="pmd_<?=$pm['pmid']?>" onclick="deletepm(this, <?=$pm['pmid']?>);return false;" class="delete" title="ɾ��">ɾ��</a>									
</span>
<? } else { ?>
<a href="pm.php?pmid=<?=$pm['pmid']?>&amp;filter=<?=$filter?>"><?=$pm['message']?></a>
</div>
<span class="action">
<input name="pmid[]" class="checkbox" type="checkbox" value="<?=$pm['pmid']?>" />
<a href="pm.php?action=del&amp;pmid=<?=$pm['pmid']?>&amp;filter=<?=$filter?>" id="pmd_<?=$pm['pmid']?>" onclick="deletepm(this, <?=$pm['pmid']?>);return false;" class="delete" title="ɾ��">ɾ��</a>									
</span>
<? } } else { ?>
<a href="pm.php?pmid=<?=$pm['pmid']?>&amp;filter=<?=$filter?>"><?=$pm['message']?></a></div>
<? } ?>
</li><? } } ?></ul>
<div class="s_clear" style="margin: 10px 0;">
<? if($filter != 'announcepm') { ?>
<span class="right">
<input class="checkbox" type="checkbox" id="chkall" name="chkall" onclick="checkall(this.form);" /> <label for="chkall">ȫѡ</label>						
<span class="pipe">|</span><a href="javascript:;" onclick="doane(event);$('pmform').readopt.value = 0;$('pmform').submit()" class="lightlink">ɾ��</a>
<button type="submit" value="yes" class="button" id="delallpm" style="display: none;">ɾ��</button>
</span>
<? } ?>
�� <?=$ucdata['count']?> ����Ϣ
</div>
<div>
<? if(!empty($search) && $filter !== '') { if($page > 1) { ?><a href="pm.php?search=yes&amp;srchtxt=<?=$srchtxtenc?>">��һҳ</a><? } ?>
<a href="pm.php?search=yes&amp;srchtxt=<?=$srchtxtenc?>&amp;page=<? echo $page+1; ?>">��������</a>
<? } else { ?>
<?=$multipage?>
<? } ?>
</div>
</form>
<script type="text/javascript">
function deletepm(obj, pmid) {
str = 'ajaxget(\'' + obj.href + '\', \'pm_' + pmid + '\', \'ajaxwaitid\', \'ajaxwaitid\', \'\', \'$(\\\'pm_' + pmid + '\\\').style.display = \\\'none\\\'\');';
showDialog('ȷ��ɾ��ָ������Ϣ��?', 'confirm', '', str);
}
</script>
<? } else { ?>
<p class="nodata">��������</p>
<? } } elseif($action == 'view') { if(empty($pmid)) { ?>
<div class="itemtitle newpm_notice s_clear">
<span class="right">
���ж���Ϣ <? echo count($pmlist);; ?><span class="pipe">|</span><a href="pm.php?uid=<?=$uid?>&amp;daterange=5&amp;export=yes">����</a>
<span class="pipe">|</span><a href="pm.php?action=del&amp;uid=<?=$uid?>&amp;filter=<?=$filter?>" onclick="return confirm('ȷ��Ҫ������ж���Ϣ��¼��');">���</a>
<span class="pipe">|</span><a href="pm.php?action=addblack&amp;formhash=<?=FORMHASH?>&amp;user=<? echo rawurlencode($user);; ?>" class="addblack">���������</a>
</span>
<a href="javascript:history.go(-1);" class="back">����</a>
<span class="left">�� <strong><?=$user?></strong> �Ķ���Ϣ��¼��</span>
<ul>
<li<? if($daterange <= 3) { ?> class="current"<? } ?>><a href="pm.php?uid=<?=$uid?>&amp;daterange=3" hidefocus="true"><span>�������</span></a></li>
<li<? if($daterange == 4) { ?> class="current"<? } ?>><a href="pm.php?uid=<?=$uid?>&amp;daterange=4" hidefocus="true"><span>����</span></a></li>
<li<? if($daterange == 5) { ?> class="current"<? } ?>><a href="pm.php?uid=<?=$uid?>&amp;daterange=5" hidefocus="true"><span>ȫ��</span></a></li>
</ul>
</div>
<? } ?>

<div id="pmlist">

<ul class="pm_list">
<? if($pmlist) { $new = 0; if(is_array($pmlist)) { foreach($pmlist as $pm) { if($pm['daterange']) { ?><li class="pm_date"><strong><?=$pm['daterange']?></strong></li><? } ?>
<li id="pm_<?=$pm['pmid']?>" class="s_clear <? if($pm['msgfromid'] == $discuz_uid) { ?>self<? } ?>">
<a name="pm_<?=$pm['pmid']?>"></a>
<? if(!$new && $pm['new']) { ?><a name="new"></a><? $new = 1; } ?>
<a<? if($msgfromurl && $pm['msgfromid'] != $discuz_uid) { ?> href="<?=$msgfromurl?>"<? } ?> class="avatar"><? echo discuz_uc_avatar($pm['msgfromid'], 'small');; ?></a>
<p class="cite">
<cite><? if($pm['msgfromid'] != $discuz_uid) { ?><?=$pm['msgfrom']?><? } else { ?><?=$discuz_userss?><? } ?></cite>
<?=$pm['dateline']?>
<? if($pm['new']) { ?>&nbsp;&nbsp;<img src="<?=IMGDIR?>/notice_newpm.gif" alt="NEW" /><? } ?>
</p>
<div class="summary"><?=$pm['message']?></div>
<span class="action">
<a href="pm.php?action=new&amp;pmid=<?=$pm['pmid']?>" onclick="showWindow('sendpm', this.href);return false;">ת��</a>
</span>
</li>
<? if($inajax) { ?><script type="text/javascript" reload="1">appendpmnode();</script><? } } } } else { if($daterange == 3) { ?>
<li>�������û���¶���Ϣ���鿴<a href="pm.php?uid=<?=$uid?>&amp;daterange=4">����ʱ��</a>�Ķ���Ϣ��ʷ��</li>
<? } elseif($daterange == 4) { ?>
<li>����û���¶���Ϣ���鿴<a href="pm.php?uid=<?=$uid?>&amp;daterange=5">����ʱ��</a>�Ķ���Ϣ��ʷ��</li>
<? } else { ?>
<li>û���¶���Ϣ��</li>
<? } } ?>
</ul>
<? if(empty($pmid) && $allowsendpm) { ?>
<div id="pm_list">
<ul id="pm_new" class="pm_list" style="display: none"></ul>
</div>
<form id="pmform" method="post" action="pm.php?action=send&amp;uid=<?=$uid?>&amp;pmsubmit=yes&amp;infloat=yes" class="pmreply">
<input type="hidden" name="formhash" id="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="handlekey" value="pmreply" />
<input type="hidden" name="lastdaterange" value="<?=$lastdaterange?>" />
<div class="editor_tb" style="width: 514px"><? $seditor = array('pmreply', array('bold', 'img', 'link', 'quote', 'code', 'smilies')); ?><link rel="stylesheet" type="text/css" href="forumdata/cache/style_<?=STYLEID?>_seditor.css?<?=VERHASH?>" />
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
<textarea onKeyDown="seditor_ctlent(event, 'pmreplysubmit()')" id="pmreplymessage" name="message" class="txtarea" cols="30" rows="5" style="margin-top: -1px; border-top: none;"></textarea>
<p style="margin: 5px 0;"><button onclick="pmreplysubmit();return false;">�ظ�</button><? $policymsgs = $p = ''; if(is_array($creditspolicy['sendpm'])) { foreach($creditspolicy['sendpm'] as $id => $policy) { ?><?
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
?><? $policymsgs .= $p.$policymsg;$p = ', '; } } if($policymsgs) { ?>&nbsp;ÿ����һ������Ϣ���۳� <?=$policymsgs?><? } ?>
</p>
</form>
<? } ?>
</div>
<script type="text/javascript">
function pmreplysubmit() {
$('pmreplymessage').value = parseurl($('pmreplymessage').value);
ajaxpost('pmform', 'pm_new', 'pm_new', 'onerror');
}
function messagehandle_pmreply() {
$('pm_new').style.display = '';
}
function appendpmnode() {
$('pm_new').className = 'pm_list';
$('pm_new').style.display = '';
$('pm_new').id = '';
ul = document.createElement('ul');
ul.id = 'pm_new';
ul.className = 'pm_list';
ul.style.display = 'none';
$('pm_list').appendChild(ul);
$('pmform').message.value = '';
showCreditPrompt();
if(document.body.stat) document.body.stat('pm_send_succeed', 'pm.php');
}
</script>

<? } elseif($action == 'viewblack') { ?>
<div class="blacklist">
<form class="allblocked" method="post" action="pm.php?user=%7BALL%7D">
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="hidden" name="action" value="" />
<label><input name="black" type="radio" class="radio" value="0" onclick="this.form.action.value = 'delblack'"<? if(!$blackall) { ?> checked="checked"<? } ?> /> �������л�Ա��Ϣ</label>
<label><input name="black" type="radio" class="radio" value="1" onclick="this.form.action.value = 'addblack'"<? if($blackall) { ?> checked="checked"<? } ?> /> �������л�Ա��Ϣ</label>
<input type="submit" name="submit" value="�ύ" />
</form>
<h3 class="blocktitle lightlink">������: </h3>
<ul class="commonlist inlinelist"><? $dataexist=0; if(is_array($blackls)) { foreach($blackls as $user) { if($user !== '' && $user != chr(0x7B).'ALL'.chr(0x7D)) { $dataexist=1; ?><li style="padding: 4px 0;" onmouseover="this.className='hover'" onmouseout="this.className=''">
<a href="space.php?username=<?=$user?>" target="_blank"><?=$user?></a>
<a href="pm.php?action=delblack&amp;formhash=<?=FORMHASH?>&amp;user=<? echo urlencode($user);; ?>" title="�Ƴ�" class="remove">�Ƴ�</a>
</li>
<? } } } if(!$dataexist) { ?>
<li>��������<li>
<? } ?>
</ul>
</div>
<? } ?>
</div>
</div>
<div class="side"><h2>��������</h2>
<div class="sideinner">
<ul class="tabs">
<? if($regverify == 1 && $groupid == 8) { ?>
<li<? if(CURSCRIPT=='memcp' && $action == 'emailverify') { ?> class="current"<? } ?>><a href="member.php?action=emailverify">������֤ Email</a></li>
<? } if($regverify == 2 && $groupid == 8) { ?>
<li<? if(CURSCRIPT=='memcp' && $action == 'validating') { ?> class="current"<? } ?>><a href="memcp.php?action=validating">�˻����</a></li>
<li<? if(CURSCRIPT=='memcp' && $action == 'profile' && $typeid == '2') { ?> class="current"<? } ?>><a href="memcp.php?action=profile&amp;typeid=2">��������</a></li>
<? } else { ?>
<li<? if(CURSCRIPT=='memcp' && $action == 'profile' && $typeid == '3') { ?> class="current"<? } ?>><a href="memcp.php?action=profile&amp;typeid=3" id="uploadavatar" prompt="uploadavatar">�޸�ͷ��</a></li>
<li<? if(CURSCRIPT=='memcp' && $action == 'profile' && $typeid == '2') { ?> class="current"<? } ?>><a href="memcp.php?action=profile&amp;typeid=2">��������</a></li>
<li<? if(CURSCRIPT=='pm') { ?> class="current"<? } ?>><a href="pm.php">����Ϣ</a></li>
<li<? if(CURSCRIPT=='notice') { ?> class="current"<? } ?>><a href="notice.php">����</a></li>
<li<? if(CURSCRIPT=='my' && $item == 'buddylist') { ?> class="current"<? } ?>><a href="my.php?item=buddylist&amp;<?=$extrafid?>">�ҵĺ���</a></li>
<? if($regstatus > 1) { ?><li><a href="invite.php">����ע��</a></li><? } if($ucappopen['UCHOME']) { ?>
<li><a href="<?=$uchomeurl?>/space.php?uid=<?=$discuz_uid?>" target="_blank">�ҵĿռ�</a></li>
<? } elseif($ucappopen['XSPACE']) { ?>
<li><a href="<?=$xspaceurl?>/?uid-<?=$discuz_uid?>" target="_blank">�ҵĿռ�</a></li>
<? } } ?>
</ul>
</div>

<? if($groupid != 8) { ?>
<hr class="shadowline" />

<div class="sideinner">
<ul class="tabs">
<li<? if(CURSCRIPT=='my' && in_array($item, array('threads', 'posts', 'polls', 'reward', 'activities', 'debate', 'buytrades', 'tradethreads', 'selltrades', 'tradestats'))) { ?> class="current"<? } ?>><a href="my.php?item=threads<?=$extrafid?>">�ҵ�����</a></li>
<li<? if(CURSCRIPT=='my' && $item == 'favorites') { ?> class="current"<? } ?>><a href="my.php?item=favorites&amp;type=thread<?=$extrafid?>">�ҵ��ղ�</a></li>
<li<? if(CURSCRIPT=='my' && $item == 'attention') { ?> class="current"<? } ?>><a href="my.php?item=attention&amp;type=thread<?=$extrafid?>">�ҵĹ�ע</a></li>
<? if(!empty($plugins['plinks_my'])) { if(is_array($plugins['plinks_my'])) { foreach($plugins['plinks_my'] as $module) { if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?><li<? if(CURSCRIPT == 'plugin' && $_GET['id'] == $module['id']) { ?> class="current"<? } ?>><?=$module['url']?></li><? } } } } ?>
</ul>
</div>

<hr class="shadowline" />

<div class="sideinner">
<ul class="tabs">
<li<? if(CURSCRIPT=='memcp' && $action == 'credits') { ?> class="current"<? } ?>><a href="memcp.php?action=credits">����</a></li>
<li<? if(CURSCRIPT=='memcp' && $action == 'usergroups') { ?> class="current"<? } ?>><a href="memcp.php?action=usergroups">�û���</a></li>
<li<? if(CURSCRIPT=='task') { ?> class="current"<? } ?>><a href="task.php">��̳����</a></li>
<? if($medalstatus) { ?><li<? if(CURSCRIPT=='medal') { ?> class="current"<? } ?>><a href="medal.php">ѫ��</a></li><? } if($magicstatus) { ?><li<? if(CURSCRIPT=='magic') { ?> class="current"<? } ?>><a href="magic.php">����</a></li><? } if(!empty($plugins['plinks_tools'])) { if(is_array($plugins['plinks_tools'])) { foreach($plugins['plinks_tools'] as $module) { if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?><li<? if(CURSCRIPT == 'plugin' && $_GET['id'] == $module['id']) { ?> class="current"<? } ?>><?=$module['url']?></li><? } } } } ?>
</ul>
</div>
<? } ?>

<hr class="shadowline" />

<div class="sideinner">
<ul class="tabs">
<li<? if(CURSCRIPT=='memcp' && $action == 'profile' && $typeid == '5') { ?> class="current"<? } ?>><a href="memcp.php?action=profile&amp;typeid=5">��̳���Ի��趨</a></li>
<li<? if(CURSCRIPT=='memcp' && $action == 'profile' && $typeid == '1') { ?> class="current"<? } ?>><a href="memcp.php?action=profile&amp;typeid=1">����Ͱ�ȫ����</a></li>
</ul>
</div>

<hr class="shadowline" />

<div class="sideinner">
<ul class="tabs">
<li>����: <?=$credits?></li><? if(is_array($extcredits)) { foreach($extcredits as $id => $credit) { ?><li><?=$credit['title']?>: <?=$GLOBALS['extcredits'.$id]?> <?=$credit['unit']?></li><? } } ?></ul>
</div>
<?=$pluginhooks['memcp_side']?></div>

</div><? include template('footer', '0', ''); ?>