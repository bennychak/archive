<script language="javascript" src="{$base_url}/common/js/common.js"></script>
<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：添加标签
</div>

<div class="padding10">
    <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到添加标签页面。您可以添加模板中的标签，从而方便调用各种网站数据，制作出各种各样的模板样式。
</div>


{template 'table/templatetag/listtag_helper.php'}
<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id='';
      echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">
    <input type="hidden" name="onlymodify" value=""/>
    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table">
        <tbody>


            <tr>
                <td>中文标签名称</td></tr>


            <tr>
                <td>
                    {form::getform('name',$form,$field,$data)}                </td>
            </tr>


            <tr>
                <td>标签代码内容</td></tr>


            <tr>
                <td>
                    {form::getform('tagcontent',$form,$field,$data)}    </td>
            </tr>




        </tbody></table>

    <div class="blank20"></div>
    <input type="submit" name="submit" value="提交" class="button" />
</form>