
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：自定义字段列表
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到添加自定义字段页面。您可以添加内容自定义字段，结合自定义字段可以丰富您网站的展示形式以及更多特色内容。
</div>

<div class="blank10"></div>
<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
 <thead>
<tr>
<th colspan="5" align="right">

</th>
</tr>
</thead>
<tbody>
        <tr>
          <td colspan="5" align="right">
		  <a href="<?php echo modify("/act/add/table/".$table);?>"  class="button"> 添加|编辑字段 </a>&nbsp; &nbsp; <a href="<?php echo modify("/act/list/table/".$table);?>" class="button"> 查看列表 </a>
          </td>
        </tr>
		<tr>
          <td colspan="5" align="right">

          </td>
        </tr>
</tbody>
      <thead>
        <tr>
          <th>字段名名</th>
          <th>类型</th>
          <th>长度</th>
          <th>字段中文名</th>
          <th>操作</th>
        </tr>
</thead>
 <tbody>
{loop $fields $f}
<tr>

<td align="center">{$f.name}</td>
<td align="center">{$f.type}</td>
<td align="right">{$f.len}</td>
<td align="center"><?php echo @setting::$var[$table][$f['name']]['cname'];?></td>

<td>查看 <a href="<?php echo modify("/act/edit/table/$table/name/".$f['name']);?>">编辑</a> <a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/name/".$f['name']);?>">删除</a></td>
</tr>
{/loop}

      </tbody>
    </table>


