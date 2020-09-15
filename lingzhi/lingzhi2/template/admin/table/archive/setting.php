<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：内容模块设置
</div>


<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到内容模块设置页面。您可以设置内容模块推荐位置，结合模板制作出极具个性的网页样式。
</div>

<div class="blank10"></div>

<form name="settingform" id="settingform"  action="<?php echo uri();?>" method="post">
<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
            <tr><th colspan="3">内容模块设置</th>
            </tr></thead>
<tbody>
            <tr>
                <td class="left">附加推荐属性：
                </td>
                <td>
                    {form::textarea('attr1',get('attr1')?get('attr1'):$settings['attr1'],'cols=50 rows=10')}
                    <span>
                        <br/>每行一项，格式： (值)项，如：
                        <br/>(1)首页推荐
                        <br/>(2)首页焦点
                        <br/>(3)首页头条
                        <br/>(4)列表页推荐
                        <br/>(5)内容页推荐
                    </span>
                </td>
            </tr>

        </tbody>
    </table>


<div class="blank20"></div>
<input type="submit" name="submit" value="提交" class="button"/>
</form>

