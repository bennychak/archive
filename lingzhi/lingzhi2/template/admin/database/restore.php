<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：恢复数据库
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到恢复数据库备份页面。您可以对网站数据进行恢复，请在下列备份中选择您希望还原的数据，勾选后，点选恢复按钮即后您的网站数据恢复成功。
</div>

<div class="blank10"></div>
<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
      <thead>
        <tr>
           <th style="width:60px;">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /></th>
          <th>档案</th>
          <th>操作</th>
        </tr>
		</thead>
<tbody>
        {loop $db_dirs $dir}
      <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
           <td style="width:60px;" align="center"><input onclick="c_chang(this)" type="checkbox" value="{$dir}" name="select[]" class="checkbox" /> </td>
          <td>{$dir}</td>
           <td style="width:60px;" align="center">
            <input type="button" onclick="javascript:if(confirm('确实要 【恢复】 备份档案 ( {$dir} ) 吗?' )) location.href='<?php echo url('database/dorestore/db_dir/'.$dir);?>';"  class="button" value=" 还原 " />
           </td>
        </tr>
       {/loop}

      </tbody>
    </table>


    <div class="blank10"></div>
    <input type="submit" name="submit" value=" × 删除 " onclick="return getSelect(this.form) && confirm('确实要 【删除】 备份档案 ( '+getSelect(this.form)+' ) 吗?');" class="button" />
 


</form>