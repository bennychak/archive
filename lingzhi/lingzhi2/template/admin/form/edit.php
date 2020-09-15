<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：编辑表单
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到编辑表单页面。您可以已经存在的表单进行修改、增加、编辑、查看。
</div>

<div class="blank10"></div>

<form method="post" action="" name="form1" id="form1" onsubmit="checkform1()">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
<tr>
<th colspan="2" >
编辑表单
</th>
</tr>
</thead>
<tbody>

<tr>
	<td class="left">表单名称</td>
	<td class="right"><input size="20" name="cname" id="cname" value="{=@setting::$var[$table]['myform']['cname']?setting::$var[$table]['myform']['cname']:get('cname')}" /></td>
</tr>


<tr>
	<td class="left">表名</td>
	<td class="right">
	<b>{$table}</b>
    <input type="hidden"  name="name" id="name" value="{$table}" />
	</td>
</tr>


<tr>
	<td class="left">模板</td>
	<td class="right">
            {form::select('template',@setting::$var[$table]['myform']['template']?setting::$var[$table]['myform']['template']:get('template'),front::$view->myform_tpl_list())}
        </td>
</tr>


</tbody>
</table>

<div class="blank10"></div>
<input type="submit" name="submit" value=" 提交 " class="button" />

</form>