<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：内容生成
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到内容生成Html页面。您可以在生成内容的html静态页面，以便获得更好的SEO效果。
</div>
<div id="info">
<?php if(hasflash()) { ?>
<span style="float:left"><?php echo showflash(); ?></span>
<span style="cursor:pointer;color:blue;float:right" onclick="hide('message')">(×)</span>
<?php } ?>
</div>
<div class="blank10"></div>

<form name="aidform" method="post" action="<?php echo front::$uri;?>">
<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
<tbody>
<tr>
	<td class="left">按ID:</td>
	<td><?php
	$archive=new archive();
	$aid=$archive->rec_query_one("select min(aid) as min,max(aid) as max from ".$archive->name);
	echo " 从 ".form::input('aid_start',max($aid['max']-100,1));
	echo " 到 ".form::input('aid_end',$aid['max']);
	?>
	&nbsp;&nbsp;
	<?php echo form::submit('更新');
	?>
	&nbsp;&nbsp;(ID范围: {$aid['min']}~{$aid['max']} )
    </td></tr></tbody>

</form>&nbsp;

<form name="aidform2" method="post" action="<?php echo front::$uri;?>">

<tbody>
<tr>
	<td class="left">按栏目:</td>
	<td><?php
	$archive=archive::getInstance();
	echo form::select('catid',get('catid'),category::option());
	?>
	&nbsp;&nbsp;
	<?php echo form::submit('更新');
	?>
    </td></tr></tbody>
</table>
</form>&nbsp;