<? if(!defined('IN_DISCUZ')) exit('Access Denied'); ?>
<div class="itemtitle s_clear">
<form method="post" action="member.php?action=list" class="right">
<input type="hidden" name="formhash" value="<?=FORMHASH?>" />
<input type="text" size="15" name="srchmem" class="txt" />
&nbsp;<button type="submit">����</button>
<? if($regstatus > 1) { ?>&nbsp;<button onclick="window.location='invite.php'; return false;">�������</button><? } ?>
</form>
<h1>�ҵĺ���</h1>
<ul>
<li<? if(empty($type)) { ?> class="current"<? } ?>><a href="my.php?item=buddylist"><span>����</span></a></li>
<li<? if(!empty($type)) { ?> class="current"<? } ?>><a href="my.php?item=buddylist&amp;type=fans"><span>��ע</span></a></li>
</ul>
</div>
<div class="datalist">
<table cellspacing="0" cellpadding="0" class="datatable" style="table-layout:fixed;margin-top:10px;">
<? if($buddylist) { ?>
<tr><? $i=0; if(is_array($buddylist)) { foreach($buddylist as $buddy) { $i++; ?><td valign="top">
<div class="friendavatar"><a href="space.php?uid=<?=$buddy['friendid']?>" target="_blank"><?=$buddy['avatar']?></a></div>
<div class="friendinfo">
<h5 class="buddyname">
<a href="space.php?uid=<?=$buddy['friendid']?>" target="_blank"><?=$buddy['username']?></a>
<? if($buddy['online']) { ?><img src="<?=IMGDIR?>/online_buddy.gif" title="��ǰ����" class="online_buddy" /><? } if($buddy['msn']['1']) { ?>
<a target='_blank' href='http://settings.messenger.live.com/Conversation/IMMe.aspx?invitee=<?=$buddy['msn']['1']?>@apps.messenger.live.com&mkt=zh-cn' title="MSN ����"><img class='online_buddy' src='http://messenger.services.live.com/users/<?=$buddy['msn']['1']?>@apps.messenger.live.com/presenceimage?mkt=zh-cn' width='16' height='16' /></a>
<? } ?>
</h5>
<p>
<span id="commenthide_<?=$buddy['friendid']?>"><?=$buddy['comment']?></span> <span id="commentedit_<?=$buddy['friendid']?>">[<a href="javascript:;" onclick="editcomment(<?=$buddy['friendid']?>)"><? if($buddy['comment']) { ?>+�༭��ע<? } else { ?>+��ӱ�ע<? } ?></a>]</span>
<span id="commentbox_<?=$buddy['friendid']?>" style="display:none"><input name="comment_<?=$buddy['friendid']?>" value="<?=$buddy['comment']?>" id="comment_<?=$buddy['friendid']?>" class="txt" tabindex="1" onBlur="updatecomment(<?=$buddy['friendid']?>)"/ size="30"></span>
</p>
<p class="friendctrl">
<a href="pm.php?action=new&amp;uid=<?=$buddy['friendid']?>" onclick="showWindow('sendpm', this.href);return false;" title="������Ϣ">������Ϣ</a> |
<? if($uchomeurl) { ?><a href="<?=$uchomeurl?>/space.php?uid=<?=$buddy['friendid']?>" target="_blank">���ѿռ�</a><? } else { ?><a href="space.php?uid=<?=$buddy['friendid']?>" target="_blank">��������</a><? } ?> |
<a href="search.php?srchuid=<?=$buddy['friendid']?>&amp;srchfid=all&amp;srchfrom=0&amp;searchsubmit=yes" target="_blank"><? if($buddy['gender'] == 2) { ?>��<? } else { ?>��<? } ?>������</a> |
<a href="my.php?item=buddylist&amp;action=delete&amp;friendid=<?=$buddy['friendid']?><?=$extratype?>&amp;buddysubmit=yes">ɾ��</a>
</p>
</div>
</td>
<? if($i%2==0) { ?></tr><tr><? } } } ?></tr>
<? } else { ?>
<tr><th><p class="nodata">����ǰû�к���</p></th></tr>
<? } ?>
</table>
</div>

<?=$multipage?>

<script type="text/javascript" reload="1">
function changediv(buddyid) {
display('commenthide_' + buddyid);
display('commentbox_' + buddyid);
display('commentedit_' + buddyid);
}

function editcomment(buddyid) {
changediv(buddyid);
$('comment_' + buddyid).focus();
}

function updatecomment(buddyid) {
changediv(buddyid);
var comment = BROWSER.ie && document.charset == 'utf-8' ? encodeURIComponent($('comment_'+ buddyid).value) : $('comment_'+ buddyid).value;
$('commenthide_' + buddyid).innerHTML =  preg_replace(['&', '<', '>', '"'], ['&amp;', '&lt;', '&gt;', '&quot;'], comment);
ajaxget('my.php?item=buddylist&action=edit&friendid=' + buddyid + '&buddysubmit=yes&comment=' + comment, 'commnethide_' + buddyid, 'commnethide_' + buddyid);
}

function preg_replace(search, replace, str) {
var len = search.length;
for(var i = 0; i < len; i++) {
re = new RegExp(search[i], "ig");
str = str.replace(re, typeof replace == 'string' ? replace : (replace[i] ? replace[i] : replace[0]));
}
return str;
}
</script>