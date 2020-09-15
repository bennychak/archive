<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/list.js"></script>
<script language="javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>

<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：公告列表
</div>

<div class="padding10">
<img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到公告列表页面。您可以编辑网站公告信息，及时提示浏览者网站最新公告信息。
</div>

<div class="blank10"></div>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
      <thead>
        <tr>
           <th width="60px">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
          <th align="center"><!--id-->编号</th>
          <th align="center"><!--title-->标题</th>
          <th align="center"><!--content-->内容</th>
          <th align="center"><!--adddate-->添加时间</th>
          <th align="center">操作</th>
        </tr>

</thead>
<tbody>
<?php foreach($data as $d) { ?>
<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

<td align="center" ><input onclick="c_chang(this)" type="checkbox" value="<?php echo $d[$primary_key];?>" name="select[]" class="checkbox" /> </td>

<td><?php echo cut($d['id']);?></td>
<td><?php echo cut($d['title']);?></td>
<td><?php echo cut($d['content']);?></td>
<td><?php echo cut($d['adddate']);?></td>

<td align="center">
<a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]");?>">编辑</a> 
<a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]");?>">删除</a>
</td>
</tr>
<?php } ?>


      </tbody>
    </table>


<div class="blank30"></div>

    <input type="hidden" name="batch" value="">
<input  class="button" type="button" value=" 删除 " name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}"/>

</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>