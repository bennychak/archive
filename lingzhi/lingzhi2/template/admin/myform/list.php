
<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
<a href="javascript :history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：浏览表单提交信息列表
</div>

<div class="padding5">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到查看表单页面，您可以查看已经提交的表单数据。
</div>


<div class="blank10"></div>
<div class="hr"></div>

<?php helper::filterField($field,$fieldlimit);?>

<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

  <?php
  if(get('table')=='type')
  $this->render('_table/type/_list.php');
  else { ?>

  
<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
<thead>
<tr>
<th width="60px">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
{loop $field $f}
          <th align="center"><!--{$f.name}-->{$f.name|lang}</th>
{/loop}
          <th align="center">操作</th>
        </tr>

</thead>
<tbody>
{loop $data $d}
<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

<td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /> </td>

{loop $field $f}
<?php $name=$f['name']; ?>
<td>{cut($d[$name])}</td>
{/loop}

<td align="center">

<a href='<?php echo url("table/show/table/$table/id/$d[$primary_key]");?>' class="button">查看</a>
<a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]");?>" class="button">删除</a>


</td>
</tr>
{/loop}


      </tbody>
    </table>


<div class="blank10"></div>

    <input type="hidden" name="batch" value=""  class="button" />

<input  class="button" type="button" value=" 删除 " name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}" />

<?php } ?>


</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>