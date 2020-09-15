<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：栏目生成
</div>

<div class="padding5">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到栏目生成Html页面。您可以在生成栏目的html静态页面，以便获得更好的SEO效果。
</div>




<div class="blank10"></div>

<form name="typeform" method="post" action="<?php echo front::$uri;?>">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead> <tr><th colspan="2">
               栏目生成管理
            </th>
			</tr>
</thead>
<tbody>
<tr>
	<td class="left">栏目:</td>
	<td class="right"><?php
	$archive=archive::getInstance();
	echo form::select('catid',get('catid'),category::option());
	?>
	&nbsp;&nbsp;
	<?php echo form::submit('更新');
	?>
    </td></tr></tbody>
</table>
</form>
