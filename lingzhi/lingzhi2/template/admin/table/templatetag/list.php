<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：标签列表
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到标签列表页面。您可以编辑模板中的标签，从而方便调用各种网站数据，制作出各种各样的模板样式。
</div>

<div class="blank10"></div>

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
  <thead>
  <tr>
    <th colspan="3">
    
    <span style="float:left">标签管理</span>
    </th></tr>
    
    <tr>
    <td width="400"><div class="padding10"><img src="{$skin_path}/wj.gif" style="margin-right:10px;" /><a href="{url::create('table/add/table/templatetag')}">添加标签</a><span style="color:red">(可以使用标签调用向导进行标签自动生成)</span></div></td>
    <td><a href="javascript:;" onclick="show('templatetagintro')">查看标签使用简短说明</a></td>
    </tr>
</thead>
</table>

<div id="templatetagintro" style="display:none">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
  <tbody>
  <tr>
    <td colspan="3">
    一个中文标签代替一段代码。<br>
    标签调用方法：  <b>{</b><b>tag_</b>标签名称<b>}</b><br>
    标签JS调用方法：  <b>{</b><b>js_</b>标签名称<b>}</b> <br>
    非中文标签调用直接放置代码，例如调用“ICP备案号”直接在模板插入 <b>{</b>get('site_icp')<b>}</b> 
        
    <span style="cursor:pointer;color:blue;float:right" onclick="hide('templatetagintro')">(×)</span>
    </td>
  </tr>
    </tbody>
</table>
</div>





<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
        <tr>
           <th width="60px">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
          <th align="center"><!--id-->编号</th>
          <th align="center"><!--name-->名称</th>
          <th align="center"><!--tagcontent-->代码内容</th>
          <th align="center">操作</th>
        </tr>
</thead>
<tbody>
{loop $data $d}
<tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

<td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /> </td>

<td>{cut($d['id'])}</td>
<td>{cut($d['name'])}</td>
<td> {tool::cn_substr(htmlspecialchars($d['tagcontent']),20)} </td>

<td align="center">
<a href='<?php echo url("templatetag/test/id/$d[$primary_key]",false);?>' target="_blank">测试</a>
<a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]");?>">编辑</a> 
<a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]");?>">删除</a>
</td>
</tr>
{/loop}


      </tbody>
    </table>


<div class="blank20"></div>

    <input type="hidden" name="batch" value="" />
<input  class="greenbtn" type="button" value="删除" name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}" />




</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>