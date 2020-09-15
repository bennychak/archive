<div id="position">
<a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：链接模块设置
</div>

<div class="padding10">
<img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到链接模块设置页面。您可以管理与您合作的站点链接，以便获得良好的外链支持，从而使网站得到良好的推广效果。
</div>

<div class="blank10"></div>

<form name="settingform" id="settingform"  action="<?php echo uri();?>" method="post">

<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
<thead>
            <tr><th colspan="3">友情链接设置</th>
            </tr>

</thead>
<tbody>

            <tr>
                <td class="left">分类</td>
                <td width="320">
                    {form::textarea('types',get('types')?get('types'):$settings['types'],'cols=50 rows=10')}
                </td>
				<td align="top">
				  分类如：<br />
                  (1)网站首页<br />
				  (2)链接首页
				</td>
            </tr>

        </tbody>
    </table>


    <div class="blank20"></div>
    <input type="submit" name="submit" value=" 提交 " class="button" />
</form>

