<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="{$skin_path}/undo.gif" style="float:right;" /></a>当前位置：专题内容管理
</div>

<div class="blank10"></div>

<script type="text/javascript" src="{$base_url}/common/js/list.js"></script>
<script language="javascript" src="{$base_url}/common/js/common.js"></script>


<table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
    <thead>
        <tr>
            <th  colspan="11">
                专题-   <a href="{special::url($special['spid'])}" target="_blank">{$special[title]}</a>  内容管理
            </th></tr>
    </thead>
</table>

<div class="blank10"></div>

<div>
    <div style="float: left">
        <form name="searchform" id="searchform"  action="<?php echo uri();?>" method="post">
            栏目
            <?php echo form::select('search_catid',get('search_catid')?get('search_catid'):0,category::option()); ?>
            分类
            <?php echo form::select('search_typeid',get('search_typeid')?get('search_typeid'):0,type::option()); ?>
            标题
            <input type="text" name="search_title" id="search_title" value=""/>

            <input type="submit" value="搜索" name="submit" class="button"/>

            <div class="blank10"></div>
            地区
            <?php echo form::select('search_province_id',get('search_province_id')?get('search_province_id'):0,area::province_option()); ?>
            <?php echo form::select('search_city_id',get('search_city_id')?get('search_city_id'):0,area::city_option(get('search_city_id'))); ?>
            <?php echo form::select('search_section_id',get('search_section_id')?get('search_section_id'):0,area::section_option(get('search_section_id'))); ?>

            专题
            <?php echo form::select('search_spid',get('search_spid')?get('search_spid'):0,special::option()); ?>
        </form>
    </div>

    <div style="float: right">
        <a href="index.php?case=table&act=add&table=archive&admin_dir={get('admin_dir')}" class="button">添加内容</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{url::modify("table/".get('table')."/deletestate/1/page/1")}" class="button">回收站</a>
    </div>
</div>

<div class="blank10"></div>

<!--form name="searchform" id="searchform"  action="<?php echo uri();?>" method="post">
    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <thead>
            <tr>
                <th  colspan="11">
                    内容管理<?php if(front::get('deletestate')) {?>(回收站)<?php } ?>
                </th></tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="10">
                    <table><tr><td>
                                类别：</td><td>
<?php echo form::select('_typeid',get('_typeid')?get('_typeid'):0,type::option()); ?>
                            </td><td>
                                标题:</td><td>
                                <input type="text" name="_title" id="_title" value=""  />    </td><td>
                                <input type="submit" value="搜索" name="submit"  onclick="this.form.action='{url::modify('table/'.get('table'))}'" class="button"/>
                            </td></tr>
        </tbody>
    </table></td>
<td width="200">
    <a href="index.php?case=table&act=add&table=archive&admin_dir={get('admin_dir')}" class="button">添加内容</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{url::modify("table/".get('table')."/deletestate/1/page/1")}" class="button">回收站</a>
</td>
</tr>

</tbody>

</form-->




<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <thead>
            <tr>
                <th width="60">全选<input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
                <th align="center"><!--aid-->编号</th>
                <th align="center"><!--typeid-->所属类别</th>
                <th align="left"><!--title-->标题</th>
                <th align="center"><!--spid-->属于本专题</th>
                <th align="center"><!--username-->用户名</th>
                <th align="center"><!--view-->浏览</th>
                <th align="center"><!--adddate-->添加时间</th>
                <th align="center"><!--checked-->审核</th>
                <th align="center">操作</th>
            </tr>

        </thead>
        <tbody>
            {loop $data $d}
            <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

                <td align="center"><input onclick="c_chang(this)" type="checkbox" value="{$d.$primary_key}" name="select[]" class="checkbox" /> </td>
                <td align="center">{cut($d['aid'])}</td>
                <td align="center"><a href="<?php echo url("archive/list/catid/".$d[catid],false);?>" target="_blank">{catname($d['catid'])}</a></td>
                <td align="left">{cut($d['title'])}</td>
                <td align="center">{helper::yes($d['spid']==$special['spid'],false)}</td>
                <td align="center">{cut($d['username'])}</td>
                <td align="right">{cut($d['view'])}</td>
                <td align="center">{cut($d['adddate'])}</td>
                <td align="center">{helper::yes($d['checked'])}</td>
                <td align="center">
                    <a href='<?php if($d['linkto'])   echo $d['linkto']; else echo url("archive/show/aid/$d[$primary_key]",false);?>' target="_blank" title="查看动态页面">查看</a>
                    <a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]");?>">编辑</a>
                </td>
            </tr>
            {/loop}


        </tbody>
    </table>


    <div class="blank10"></div>

    <input type="hidden" name="batch" value="">

    <input type="hidden" name="spid" value="<?php echo get('spid'); ?>">
    <input  class="button" type="button" value="加入本专题 " name="addtospecial"  onclick="this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='addtospecial'; this.form.submit();" />
    <input  class="button" type="button" value="移出本专题 " name="addtospecial"  onclick="this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='removefromspecial'; this.form.submit();" />


</form>


<div class="page"><?php echo pagination::html($record_count); ?></div>