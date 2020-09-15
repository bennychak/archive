<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" src="{$base_url}/common/js/common.js"></script>
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：邮件发送
</div>
<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到用户邮件发送页面。您可以给网站的用户发送邮件，使得网站与浏览者可以完成良好的互动形式。
</div>

<div class="blank10"></div>

<form name="listform" id="listform"  action="?case=table&act=send&table=user&admin_dir=admin&getSelect(this.form)" method="post">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
        <tr>
           <th width="60px">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
          <th align="center"><!--userid-->编号</th>
          <th align="center"><!--username-->用户名</th>
          <th align="center"><!--nickname-->昵称</th>
          <th align="center"><!--groupid-->用户组</th>
          <th align="center">操作</th>
        </tr>
</thead>
<tbody>

{loop $data $d}
<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

<td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /> </td>

<td>{cut($d['userid'])}</td>
<td>{cut($d['username'])}</td>
<td>{cut($d['nickname'])}</td>
<td>{usergroupname($d['groupid'])}</td>

<td align="center">
<a href="<?php echo modify("st/1/act/send/table/$table/id/$d[$primary_key]");?>">发送邮件</a> 
</td>
</tr>
{/loop}


      </tbody>
    </table>


<div class="blank20"></div>

    <input type="hidden" name="batch" value="" />
<input  class="button" type="button" value=" 群发邮件(下一步) " name="sendall" onclick="if(getSelect(this.form) && confirm('确实要给ID为('+getSelect(this.form)+')的记录发送邮件吗?')){this.form.action='?case=table&act=send&table=user&admin_dir=admin&st=1&id='+getSelect(this.form); this.form.submit();}"/> 




</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>