<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：表单管理
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到表单管理页面。您可以已经存在的表单进行修改、增加、编辑、查看。
</div>

<div class="blank10"></div>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<?php helper::filterField($field,$fieldlimit); ?>

<style type="text/css">
table td .left {width:10%;}
</style>

<form method="post" name="form1" action="">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<tbody>

{loop $field $f}
<?php
$name=$f['name'];
if(!isset($data[$name])) $data[$name]='';
if($name==$primary_key) continue; ?>
 
<tr>
	<td class="left">{$name|lang}</td>
	<td>
{form::getform($name,$form,$field,$data)}
</td>
</tr>
 
{/loop}




</tbody></table>

<div class="blank10"></div>
<input type="submit" name="submit" value=" 提交 " class="button" />

</form>