<? if(!defined('IN_DISCUZ')) exit('Access Denied'); ?>
<div class="pages_btns s_clear">
<span class="postbtn" id="prompt_index_postbtn"><a href="misc.php?action=nav" onclick="showWindow('nav', this.href);return false;">����</a></span>
<? if(!$discuz_uid) { ?>
<p>�����<a href="<?=$regname?>" onclick="showWindow('register', this.href);return false;" class="lightlink">ע��</a>һ���ʺţ����Դ�<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;" class="lightlink">��¼</a>����������ྫ�����ݣ�����ʱ�����۵㣬���ҽ�����</p>
<? } else { ?>
��ӭ���� <?=$discuz_userss?>, <? if($lastvisit) { ?>���ϴη���ʱ������ <?=$lastvisit?>, <? } ?><a href="my.php?item=threads" class="lightlink" target="_blank">�ҵ�����</a>, <a href="search.php?srchfrom=<?=$newthreads?>&amp;searchsubmit=yes" class="lightlink">�鿴����</a>, <a href="member.php?action=markread" id="ajax_markread" onclick="ajaxmenu(this);doane(event);" class="lightlink">����Ѷ�</a>
<? } ?>
</div>

<? if(empty($gid) && $announcements) { ?>
<div id="ann">
<dl>
<dt>����:</dt>
<dd>
<div id="annbody"><ul id="annbodylis"><?=$announcements?></ul></div>
</dd>
</dl>
</div>
<script type="text/javascript">announcement();</script>
<? } ?>