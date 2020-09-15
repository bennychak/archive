<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：管理表单
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到表单管理页面。您可以已经存在的表单进行修改、增加、编辑、查看。
<br /><br />表单链接调用格式：<font color="#FF0000">{lang::get(demoform)}</font>
</div>

<div class="blank10"></div>
<style>td {padding-left:10px;}a.j{padding:0px 8px;}</style>
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
        <tr>
          <th>名称(记录数)</th>
          <th>表名</th>
          <th>操作</th>
        </tr>
</thead>
<tbody>
{loop $tables $t}
<tr>
<td>{=@setting::$var[$t]['myform']['cname']}
    (<a href="{url('table/list/table/'.$t)}" class="j"><font color="red"><?php  $_table=new defind($t); echo $_table->rec_count();?></font></a>)
</td>
<td>{$t}</td>
<td> <a  href="{url('form/add/form/'.$t,false)}" target="_blank" class="button">预览</a> &nbsp;
 <a  href="<?php echo modify("/act/edit/table/$t");?>" class="button">修改</a> &nbsp;
<a href="<?php echo url::create('field/list/table/'.$t)?>" class="button">管理字段</a> &nbsp;
<a href="<?php echo url::create('field/add/table/'.$t)?>" class="button">添加字段</a>
<a  onclick="javascript: return confirm('删除表单会删除表单中所有的记录！确认删除吗?');" href="<?php echo modify("/act/delete/table/$t");?>" class="button">删除表单</a>
</td>
</tr>
{/loop}

      </tbody>
    </table>
