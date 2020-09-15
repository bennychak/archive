<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：添加表单
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到添加表单页面。您可以设计并制作一份电子表单，方便您获取用户提交的表单类信息。
</div>

<div class="blank10"></div>

<form method="post" action="" name="form1" id="form1" onsubmit="checkform1()">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>

<tr>
<th colspan="2" >
添加表单
</th>
</tr>
</thead>
<tbody>
<tr>
	<td class="left">表单名称</td>
	<td class="right"><input size="20" name="cname" id="cname" value="{get('cname')}" /></td>
</tr>


<tr>
	<td class="left">表名</td>
	<td class="right">
	<input size="20" name="name" id="name" value="{=get('name')?get('name'):'my_'}"  />
	</td>
</tr>


<tr>
	<td class="left">模板</td>
	<td class="right">
            {form::select('template','',front::$view->myform_tpl_list())}
        </td>
</tr>


</tbody>
</table>

<div class="blank10"></div>
<input type="submit" name="submit" value=" 提交 " class="button" />

</form>