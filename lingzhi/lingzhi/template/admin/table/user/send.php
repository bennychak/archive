<script type="text/javascript" src="{$base_url}/common/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="{$base_url}/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="{$base_url}/common/js/ThumbAjaxFileUpload.js"></script>
<link rel="stylesheet" href="{$base_url}/common/js/jquery/ui/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
<script language="javascript" src="{$base_url}/common/js/jquery/ui/ui.datepicker.js"></script>

<script language="javascript" src="{$base_url}/common/js/common.js"></script>
<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：发送邮件
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到用户邮件发送页面。您可以给网站的用户发送邮件，使得网站与浏览者可以完成良好的互动形式。
</div>

<div class="blank10"></div>
<?php
$st=$_GET['st'];
?>

<form method="post" name="mail_form1" action=""  onsubmit="return checkform();">
      <input type="hidden" name="onlymodify" value=""/>
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">

        <tbody>
            
                                            
            <tr>
                <td class="left">用户名</td>                
                <td><textarea name="mail_address" cols="40" rows="10"><?php if($st) {?>{table_user::mail_before()}<?php }?></textarea>
                <br />发送格式示例: username1 [username1@cmseasy.cn],username2 [username2@cmseasy.cn]                </td>
            </tr>
            
            <tr>
                <td class="left">邮件标题</td>                
                <td><input name="title" type="text" value="" size="50" />                </td>
            </tr>
            
            <tr>
                <td class="left">发送内容</td>
                <td>
                       <div style="width:99%;">
<textarea name="content" cols="40" rows="10"></textarea><br />可以输入合法的html代码.
             
</div>            </td>
            </tr>

   
            

        </tbody></table>

<div class="blank20"></div>
<input type="submit" name="submit" value="发送" class="button" />
    </form>