<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：编辑内链
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到编辑内链页面。您可以编辑内容中的关键词链接，增加网站内链，以便达到更好的SEO优化效果。
</div>

<div class="blank10"></div>

<form method="post" name="form1" action="<?php if(front::$act=='edit') $id="/id/".$data[$primary_key]; else $id=''; echo modify("/act/".front::$act."/table/".$table.$id);?>"  onsubmit="return checkform();">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <tbody>
            
                                            
            <tr>
                <td class="left">链接词</td>
                <td>
                        {form::getform('linkword',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">URL</td>
                <td>
                        {form::getform('linkurl',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">链接权重值</td>
                <td>
                        {form::getform('linkorder',$form,$field,$data)}                </td>
            </tr>

                            
            <tr>
                <td class="left">链接次数</td>
                <td>
                        {form::getform('linktimes',$form,$field,$data)}                </td>
            </tr>

                        
            

            

        </tbody></table>

<div class="blank20"></div>
<input type="submit" name="submit" value=" 提交 " class="button" />
    </form>