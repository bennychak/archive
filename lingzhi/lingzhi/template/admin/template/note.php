<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：模板注释
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到编辑模板注释页面。您可以编辑模板注释，这样在分类和内容选择模板时会更方便。
</div>

<div class="blank10"></div>

<script type="text/javascript" src="{$base_url}/js/list.js"></script>
<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

 <input type="submit" value=" 修改 " name="submit" style="float:right;" class="button" />

<div class="blank30"></div>

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
        <tr>
          <th>档案</th>
          <th>名称</th>
          <th>简短描述</th>
        </tr>
</thead>
<tbody>
        {loop $tps $tpl $tp}
        {php $_tp=str_replace('_html','.html',$tp);}
        {php $_tp=str_replace('_css','.css',$_tp);}
        {php $_tp=str_replace('_js','.js',$_tp);}
      <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">
          <td>{$_tp}</td>
           <td>
           <input type="text" name="{$tpl}_name" size="15" value="{=@help::$var['template_note'][$tpl.'_name']}">
           </td>
           <td>
           <input type="text" name="{$tpl}_note" size="45" value="{=@help::$var['template_note'][$tpl.'_note']}">
           </td>
        </tr>
       {/loop}

      </tbody>
    </table>


<div class="blank10"></div>
    <input type="submit" value=" 修改 " name="submit" class="button" />



</form>