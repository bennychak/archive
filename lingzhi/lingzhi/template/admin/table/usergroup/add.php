
<script language="javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：添加用户组
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到添加用户组页面。您可以建立可登录网站用户的组别，以便更好的管理，使得网站与浏览者可以完成良好的互动形式。
</div>

<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <tbody>
            
                                            
            <tr>
                <td class="left">用户组</td>
                <td>
                        {form::getform('groupid',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">名称</td>
                <td>
                        {form::getform('name',$form,$field,$data)}                </td>
            </tr>

                        
            

            

        </tbody></table>

<div class="blank20"></div>
<input type="submit" name="submit" value="提交" class="button" />

</form>