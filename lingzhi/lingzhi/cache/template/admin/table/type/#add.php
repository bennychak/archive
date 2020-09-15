<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script language="javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：添加分类
</div>

<div class="padding10">
<img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到添加分类页面。您可以添加内容分类，将网站内容加以分类整理。
</div>

<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">
<input type="hidden" name="onlymodify" value=""/>

<script type="text/javascript" src="<?php echo $base_url;?>/common/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/common/js/ThumbAjaxFileUpload.js"></script>
<link rel="stylesheet" href="<?php echo $base_url;?>/common/js/jquery/ui/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
<script language="javascript" src="<?php echo $base_url;?>/common/js/jquery/ui/ui.datepicker.js"></script>

<script>
function attachment_delect(id) {
$.ajax({
url: '<?php echo url('tool/deleteattachment',false);?>&id='+id,
type: 'GET',
dataType: 'text',
timeout: 1000,
error: function(){
//	alert('Error loading XML document');
},
success: function(data){
document.form1.attachment_id.value=0;
get('attachment_path').innerHTML='';
get('file_info').innerHTML='';
}
});
}
</script>

<div class="hid_box">
<strong>上级分类</strong>
<div class="hbox" style="background:none;">
<?php echo form::getform('parentid',$form,$field,$data);?>  顶级分类可跳过
</div>
</div>


<div class="hid_box">
<strong>分类名称</strong>
<div class="hbox" style="background:none;">
<?php echo form::getform('typename',$form,$field,$data);?>  
</div>
</div>


<div class="hid_box">
<strong>目录名称</strong>
<div class="hbox" style="background:none;">
<?php echo form::getform('htmldir',$form,$field,$data);?>
</div>
</div>

<strong>分类扩展设置</strong>
<style>
.collapseda {
display: none;
}
</style>
<div id="nava">

<div class="hid_box">
<h5><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">META信息</a></h5>
<div id="ChildMenu1" class="collapseda" style="padding:20px 50px;">
网页标题：<br /><?php echo form::getform('meta_title',$form,$field,$data);?><br /><br />
关&nbsp;键&nbsp;&nbsp;词 (keywords)：<br /><?php echo form::getform('keyword',$form,$field,$data);?><br /><br />
页面描述 (description)：<br /><?php echo form::getform('description',$form,$field,$data);?>
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu2"  onclick="DoMenu('ChildMenu2')">封面内容（如使用设置栏目封面，请在模板处选择本栏目应用list_page.html模板）</a></h5>
<div id="ChildMenu2" class="collapseda" style="padding:20px 50px;">
<div style="width:77%;">
<?php echo form::getform('typecontent',$form,$field,$data);?>
</div>
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu3"  onclick="DoMenu('ChildMenu3')">分类说明图片</a></h5>
<div id="ChildMenu3" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('image',$form,$field,$data);?> 
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu4"  onclick="DoMenu('ChildMenu4')">模板</a></h5>
<div id="ChildMenu4" class="collapseda" style="padding:20px 50px;">
当前使用模板：<br />
<?php echo form::getform('template',$form,$field,$data);?>
<br /><br />
所属下级列表页模板：<br />
<?php echo form::getform('listtemplate',$form,$field,$data);?>
<br /><br />
所属内容页模板：<br />
<?php echo form::getform('showtemplate',$form,$field,$data);?> 
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu5"  onclick="DoMenu('ChildMenu5')">URL</a></h5>
<div id="ChildMenu5" class="collapseda" style="padding:20px 50px;">
当前分类URL规则：<br />
<?php echo form::getform('htmlrule',$form,$field,$data);?>
<br /><br />
列表页URL规则：<br />
<?php echo form::getform('listhtmlrule',$form,$field,$data);?>
<br /><br />
标记：<br />
<?php echo form::getform('stype',$form,$field,$data);?>
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu6"  onclick="DoMenu('ChildMenu6')">启用</a></h5>
<div id="ChildMenu6" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('isshow',$form,$field,$data);?>
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu7"  onclick="DoMenu('ChildMenu7')">动静态设置</a></h5>
<div id="ChildMenu7" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('ishtml',$form,$field,$data);?>
</div>
</div>


<div class="hid_box">
<h5><a href="#Menu=ChildMenu8"  onclick="DoMenu('ChildMenu8')">分页设置</a></h5>
<div id="ChildMenu8" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('ispages',$form,$field,$data);?>
</div>
</div>

<div class="hid_box">
<h5><a href="#Menu=ChildMenu9"  onclick="DoMenu('ChildMenu9')">子分类内容设置</a></h5>
<div id="ChildMenu9" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('includecatarchives',$form,$field,$data);?>
</div>
</div>


<div class="hid_box">
<h5><a href="#Menu=ChildMenu10"  onclick="DoMenu('ChildMenu10')">外部链接</a></h5>
<div id="ChildMenu10" class="collapseda" style="padding:20px 50px;">
<?php echo form::getform('linkto',$form,$field,$data);?>
</div>
</div>


<div class="hid_box">
<h5><a href="#Menu=ChildMenu11"  onclick="DoMenu('ChildMenu11')">控制限权</a></h5>
<div id="ChildMenu11" class="collapseda" style="padding:20px 50px;">
<table width="90%">
<tr>
<td width="20%">&nbsp;</td>
<td  width="35%">浏览(<font color="Red">×</font>)</td>
<td  width="35%">下载附件(<font color="Red">×</font>)</td>
</tr>
<?php foreach(usergroup::getInstance()->group as $group) { ?>
<?php if($group['groupid']=='888') continue; ?>
<tr><td><?php echo $group['name'];?></td>
<td><?php echo form::checkbox("_ranks[".$group['groupid']."][view]",-1, @$data['_ranks'][$group['groupid']]['view']);?></td>
<td><?php echo form::checkbox("_ranks[".$group['groupid']."][down]",-1, @$data['_ranks'][$group['groupid']]['down']);?></td>
</tr>
<?php } ?>
</table>
</div>
</div>
</div>


<div class="blank20"></div>
<input type="submit" name="submit" value=" 提交 " class="button" />
</form>
    <div class="blank30"></div>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
var obj = document.getElementById("nava").getElementsByTagName("li");	
for (var i=0; i<obj.length; i++) {
obj[i].onmouseover=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onMouseDown=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onMouseUp=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onmouseout=function() {
this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
}
}
}
function DoMenu(emid)
{
var obj = document.getElementById(emid);	
obj.className = (obj.className.toLowerCase() == "expanded"?"collapseda":"expanded");
if((LastLeftID!="")&&(emid!=LastLeftID))	//关闭上一个Menu
{
document.getElementById(LastLeftID).className = "collapseda";
}
LastLeftID = emid;
}
function GetMenuID()
{
var MenuID="";//默认开启
var _paramStr = new String(window.location.href);
var _sharpPos = _paramStr.indexOf("#");	
if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
{
_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
}
else
{
_paramStr = "";
}

if (_paramStr.length > 0)
{
var _paramArr = _paramStr.split("&");
if (_paramArr.length>0)
{
var _paramKeyVal = _paramArr[0].split("=");
if (_paramKeyVal.length>0)
{
MenuID = _paramKeyVal[1];
}
}

if (_paramArr.length>0)
{
var _arr = new Array(_paramArr.length);
}

//取所有#后面的，菜单只需用到Menu
for (var i = 0; i < _paramArr.length; i++)
{
var _paramKeyVal = _paramArr[i].split('=');

if (_paramKeyVal.length>0)
{
_arr[_paramKeyVal[0]] = _paramKeyVal[1];
}		
}

}

if(MenuID!="")
{
DoMenu(MenuID)
}
}

GetMenuID();	//*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>
