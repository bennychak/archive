<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：数据库备份
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到数据库备份页面。您可以对网站数据备份，数据将保存在data文件夹中。
</div>

<div class="blank10"></div>
<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
      <thead>
        <tr>
           <th style="width:60px;">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /></th>
          <th>表名</th>
           <th>记录数</th>
           <th>大小</th>
        </tr>
</thead>
<tbody>
        {loop tdatabase::getInstance()->getTables() $table}
      <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
           <td style="width:60px;" align="center"><input onclick="c_chang(this)" type="checkbox" value="{$table.name}" name="select[]" class="checkbox" /></td>
          <td>{$table.name}</td>
          <td align="right">{$table.count}</td>
          <td align="right">{=ceil($table['size']/1024)}K</td>
        </tr>
       {/loop}

      </tbody>
    </table>


<div class="blank10"></div>
    <?php /*兼容MySQL4<input type="checkbox" name="mysql4" value="1"> */ ?>
    &nbsp;{form::select('bagsize',0,array(0=>'请选择分卷大小...',1=>'1M',2=>'2M',5=>'5M',10=>'10M'))}
    <input type="submit" name="submit" value=" 备份 " class="button" />



</form>