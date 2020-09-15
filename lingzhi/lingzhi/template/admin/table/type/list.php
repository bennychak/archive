<script language="javascript" type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" type="text/javascript" src="{$base_url}/common/js/common.js"></script>

<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：分类列表
</div>

<div class="padding10">
    <img src="{$skin_path}/wj.gif" style="margin-right:10px;" />欢迎来到分类列表页面。您可以编辑添加内容分类，将网站内容加以分类整理。
</div>

<div class="blank10"></div>


<div class="membericon"><h5><?php if(front::get('deletestate')) {?>(回收站)<?php } ?></h5></div>
<div class="blank10"></div>

<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

    <?php
    $data=type::gettypedata();
    ?><table><tr><td style="text-align:right;">
    <a href="index.php?case=table&act=add&table=type&admin_dir={get('admin_dir')}" class="button">添加分类</a>
	</td></tr></table>
    <div class="blank10"></div>
    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <tbody id="listtable">
            <tr>
                <th width="60" align="center">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall"> </th>
                <th>排序</th>
                <th><!--typeid-->分类</th>
                <th><!--typename-->分类名称</th>
                <!--th><!--htmldir-->目录名称<!--/th-->
                <th>操作</th>
            </tr>

            {loop $data $d}

            <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)" lang="{$d['level']}" {if $d['level']>0}style="display:none"{/if}>
                <td align="center" ><input onclick="c_chang(this)" type="checkbox" value="{$d[$primary_key]}" name="select[]"> </td>
                <td>{form::input("listorder[$d[$primary_key]]",$d['listorder'],'size=3')}</td>
                <td>
                    {$d['typeid']}            </td>
                <td>
                    <span style="float:left">{$d['typename']}</span>
                    <?php if(type::hasson($d['typeid'])) { ?>
                    {if $d['level']==0}<span style="float:right;cursor:pointer" onclick="child(this)" title="点击展开/收起"><img src="{$skin_path}/info_i.gif" style="margin-right:20px;" /></span>{/if}
                            <?php } ?>
                </td>

                <!--td>
            {$d['htmldir']}            </td-->

                <td>
                    <a href="<?php echo url("type/list/typeid/$d[$primary_key]",false);?>" title="查看动态页面" target="_blank">查看</a>
                    <a href="<?php echo modify("/act/add/table/archive/typeid/$d[$primary_key]");?>">添加内容</a>
                    <a href="<?php echo modify("/act/list/table/archive/typeid/$d[$primary_key]");?>">管理内容</a>
                    <a href="<?php echo modify("/act/add/table/type/parentid/$d[$primary_key]");?>">添加子分类</a>
                    <a href="<?php echo modify("/act/edit/table/$table/id/$d[$primary_key]");?>">编辑</a> <a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/$table/id/$d[$primary_key]");?>">删除</a></td>
            </tr>

            {/loop}

        </tbody>
    </table>


    <div class="blank10"></div>
<!--    <input type="hidden" name="batch" value="">

    <input  class="button" type="button" value=" 排序 " name="order" onclick="this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='order'; this.form.submit();"/>
    &nbsp;&nbsp;
    移动分类：<?php echo form::select('typeid',0,type::option());?>&nbsp;
    <input  class="button" type="button" value=" 移动 " name="delete" onclick="if(getSelect(this.form) && confirm('确实要移动ID为('+getSelect(this.form)+')的类吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='move'; this.form.submit();}"/>-->
</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>