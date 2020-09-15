<?php
$scriptlang['dps_postawards'] = array(
	'wrong_request' => '错误的请求，请返回检查你的来路',
	'msg_no_reply' => '本帖没有回复，请选择有回复的帖子进行操作',
	'msg_parameter_empty' => '奖励数量或奖励类型错误，请返回补全必要的参数',
	'msg_awardpost_empty' => '请填写需要奖励的楼层',
	'msg_awardpost_error' => '奖励范围错误，请返回重新输入',
	'msg_awardpost_overrange' => '奖励范围超出最大楼层数，请返回重新输入',
	'msg_credit_over_limit' => '超出系统奖励允许的范围',
	'msg_credit_all_limit' => '超过奖励总数允许的范围',
	'msg_credittype_error' => '奖励的积分类型错误，请返回重新输入',
	'msg_over_user_credit' => '奖励积分超出自身积分',
	'msg_ratereason_empty' => '请输入评分理由',
	'msg_not_allow' => '你没有权限',
	'pm_message' => '<div class=\"f_manage\">您在帖子 <a href=\"{boardurl}viewthread.php?from=notice&tid={$thread[tid]}\">{$thread[subject]}</a> 的回复中获得了 $awardmsg 的奖励 {time}
<fieldset><ins>{$rate_msg}</ins></fieldset></div>',
	'success' => '操作成功 ',
	'group_setting' => '用户组权限设置',
	'groupname' => '用户组',
	'allow_postawards' => '允许使用楼层奖励',
	'allow_systemcredit' => '允许使用系统积分',
	'allow_systemcredit_low' => '单次评分下限',
	'allow_systemcredit_high' => '单次评分上限',
	'allow_systemcredit_all' => '单次评分总数',
	'allow_ratemode' => '允许批量评分',
	'tips' => '<li>允许使用系统积分：由系统提供奖惩的积分</li><li>单次评分下限/上限/总数：它是对“允许使用系统积分”的数值设置。</li><li>允许批量评分：对Discuz!现有评分功能增加“批量”功能，其相关设置如“重复评分/下限/上限”请参考Discuz!评分相关设置</li><li>关于下限/上限/总数参数：下限“-数字”，上限直接填写数字，“0”为禁止操作，留空为不限。</li><li>关于楼层奖惩：该功能仅是管理组可使用，并在帖内的“主题管理”中可查看并操作。</li>',
);

$templatelang['dps_postawards'] = array(
	'dps_postawards' => '楼层奖励',
	'dps_postawards_nolink' => '楼层奖惩',
	'post_count' => '本帖子共有 $replycount 楼',
	'award' => '奖惩',
	'number' => '第',
	'floor' => '楼',
	'sendmsg' => '给用户发送通知',
	'paward_success' => '楼层奖惩操作成功！',
	'awardcredittype' => '奖惩积分',
	'awardcreditnum' => '奖惩数量',
	'msg_intro_credit' => '指定输入：2,9,10<br>连续输入：2-7<br>判断式输入：?7,?2,7??,?7?<br>组合式输入：2-7,3,7,9-20,30-44,?7',
	'self_credit_mode' => '以自己的积分奖惩',
	'system_credit_mode' => '使用系统积分奖惩',
	'credit_mode' => '奖惩来源',
	'rate_mode' => '批量评分',
);

?>