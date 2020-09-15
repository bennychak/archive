<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<script language="javascript" type="text/javascript" src="<?php echo $base_url;?>/common/js/list.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>

<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：专题列表
</div>

<div class="padding10">
    <img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到专题列表页面。您可以编辑添加内容专题，将网站内容加以专题整理。
</div>

<div class="blank10"></div>


<div class="membericon"><h5><?php if (front::get('deletestate')) { ?>(回收站)<?php } ?></h5></div>
<div class="blank10"></div>

<form name="listform" id="listform"  action="<?php echo uri(); ?>" method="post">

<table><tr><td style="text-align:right;">
    <a href="<?php echo url('table/add/table/special') ?>" class="button">添加专题</a>
</td></tr></table>
    <div class="blank10"></div>
    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <tbody id="listtable">
            <tr>
                <th width="60" align="center">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall"> </th>
                <th>排序</th>
                <th><!--spid-->专题ID</th>
                <th><!--catname-->专题名称</th>
                <th>操作</th>
            </tr>

            <?php foreach($data as $d) { ?>
            <?php $spid=$d['spid']; ?>
            <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)" lang="<?php echo $d['level'];?>" <?php if($d['level']>0) { ?>style="display:none"<?php } ?>>
                <td align="center" ><input onclick="c_chang(this)" type="checkbox" value="<?php echo $spid;?>" name="select[]"> </td>
                <td><?php echo form::input("listorder[$d[$primary_key]]",$d['listorder'],'size=3');?></td>
                <td align="center"><?php echo $d['spid'];?></td>
                <td align="center"><?php echo $d['title'];?></td>

                <td>
                    <a href="<?php echo url("special/show/spid/$spid", false); ?>" title="查看动态页面" target="_blank">查看</a>
                    <a href="<?php echo modify("/act/list/table/archive/spid/$spid"); ?>">管理内容</a>
                    <a href="<?php echo modify("/act/edit/table/$table/id/$spid"); ?>">编辑</a> <a onclick="javascript: return confirm('确实要删除吗?');" href="<?php echo modify("/act/delete/table/special/id/$spid"); ?>">删除</a></td>
            </tr>

            <?php } ?>

        </tbody>
    </table>


    <div class="blank10"></div>
    <input type="hidden" name="batch" value="">

</form>


<div class="page"><?php echo pagination::html($record_count); ?></div>