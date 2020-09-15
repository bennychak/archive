<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：订单列表
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到订单列表页面。您可以处理客户提交的订单。
</div>

<div class="blank10"></div>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
      <thead>
        <tr>
           <th width="60px">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
          <th align="center"><!--id-->编号</th>
          <th align="center"><!--oid-->订单号</th>
          <th align="center"><!--pname-->客户</th>
          <th align="center"><!--status-->状态</th>
          <th align="center"><!--adddate-->下单时间</th>
          <th align="center">操作</th>
        </tr>

</thead>
<tbody>
{loop $data $d}
<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

<td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /> </td>
<?php
if($d['status']==1){
	$d['status']='<font color="green">完成</font>';
}elseif($d['status']==0){
	$d['status']='<font color="red">新订单</font>';
}elseif($d['status']==2){
	$d['status']='<font color="blue">处理中</font>';
} 
?>
<td>{cut($d['id'])}</td>
<td>{cut($d['oid'])}</td>
<td>{cut($d['pname'])}</td>
<td>{$d['status']}</td>
<td>{cut(date('Y-m-d H:i:s',$d['adddate']))}</td>

<td align="center">
<a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]");?>">处理</a> 
<a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]");?>">删除</a>
</td>
</tr>
{/loop}


      </tbody>
    </table>


<div class="blank30"></div>

    <input type="hidden" name="batch" value="">
<input  class="button" type="button" value=" 删除 " name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}"/>

</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>