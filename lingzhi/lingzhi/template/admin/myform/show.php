<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：浏览表单提交结果页面
</div>

<div class="padding5">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到表单查看页面。您可以预览表单样式以便更好的使用。 <a href="{url('/table/list/table/'.get('table'))}"><img alt="返回" src="{$skin_path}/icon-pve.gif" /><span style="color:red">返回</span></a>
</div>

<div class="blank10"></div>

<table border="0" cellspacing="1" cellpadding="4" class="list" name="table" id="table">
        <tbody>
            <tr bgcolor="#CCCCCC">
                <td align="center" width="180">字段名称</td>
                <td align="center" width="480">内容</td>
            </tr>
            
        
{user_cb_data($data,$table)}
            {loop $field $f}
                <?php

                $name=$f['name'];
                if(!preg_match('/^my_/',$name)) continue;

                if(!isset($data[$name])) $data[$name]='';
                ?>

            <tr>
                <td width="180" align="center">{$name|lang}</td>
                <td width="480" align="center">{$data[$name]}</td>
            </tr>

            {/loop}

        </tbody></table>
