<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：<?php echo $ballot['title'];?>选项列表
</div>

<div class="padding10"> <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到<span style="color:#F00;"><?php echo $ballot['title'];?></span>投票的选项列表页面。</div>

<div class="blank10"></div>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
    <thead>
      <tr>
        <th width="60px">全选
          <input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" />
        </th>
        <th align="center"><!--id-->
          编号</th>
        <th align="center"><!--title-->
          选项名字</th>
        <th align="center"><!--content-->
          票数</th>
        <th align="center">操作</th>
      </tr>
	  </thead>
<tbody>
    {loop $data $d}
    <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
      <td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /></td>
      <td>{cut($d['id'])}</td>
      <td>{cut($d['name'])}</td>
      <td>{cut($d['num'])}</td>
      <td align="center"><a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]/bid/".front::$get['bid']);?>">编辑</a> <a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]"."/bid/".$ballot['id']);?>">删除</a></td>
    </tr>
    {/loop}
    </tbody>
    
  </table>
  <div class="blank20"></div>
  <input type="hidden" name="batch" value="">
  <input  class="button" type="button" value=" 删除 " name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}"/>
</form>
<div class="page">
  <?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?>
</div>

<table>
<tr><td height="20">&nbsp;</td></tr>
<tr><td height="20">&nbsp;</td></tr>
</table>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/add/table/".$table.$id."/bid/".$ballot['id']);?>"  onsubmit="return checkform();">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
      <tr>
        <th colspan="2" align="center">添加选项</th>
      </tr>
	  </thead>
    <tbody>
      <tr>
        <td class="left">选项名字</td>
        <td> {form::getform('name',$form,$field,$data)} </td>
      </tr>
    </tbody>
  </table>
  <div class="blank20"></div>
  <input type="submit" name="submit" value="提交" class="button"/>
</form>
