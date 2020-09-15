<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：编辑公告
</div>


<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到编辑公告页面。您可以编辑网站公告信息，及时提示浏览者网站最新公告信息。
</div>

<div class="blank10"></div>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>


<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">

<div class="hid_box">
<strong>公告标题</strong>
<div class="hbox" style="background:none;">
{form::getform('title',$form,$field,$data)}    <font color="red">*</font>
</div>
</div>

<div class="hid_box">
<strong>公告内容</strong>
<div class="hbox" style="background:none;">
{form::getform('content',$form,$field,$data)} 
</div>
</div>

<div class="blank30"></div>
<input type="submit" name="submit" value="提交" class="button"/>

</form>  
<div class="blank30"></div>