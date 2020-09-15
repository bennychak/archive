<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div id="position">
    <a href="javascript:history.back(-1)" title="返回上一页"><img alt="返回上一页" src="<?php echo $skin_path;?>/undo.gif" style="float:right;" /></a>当前位置：编辑内容
</div>

<div class="padding10">
    <img src="<?php echo $skin_path;?>/wj.gif" style="margin-right:10px;" />欢迎来到编辑内容页面。您可以编辑修改网站内容，展示网站信息。
</div>

<div class="blank10"></div>

<script type="text/javascript" src="<?php echo $base_url;?>/common/js/list.js"></script>
<script language="javascript" src="<?php echo $base_url;?>/common/js/common.js"></script>


<table border="0" cellspacing="0" cellpadding="4" class="list">
    <thead>
        <tr>
            <th>
                内容管理<?php if(front::get('deletestate')) {?>(回收站)<?php } ?>
            </th>
</tr>
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

            <input type="submit" value="搜索" name="submit"  onclick="this.form.action='<?php echo url::modify('table/'.get('table'));?>'" class="button"/>

            <div class="blank10"></div>
            地区
            <?php echo form::select('search_province_id',get('search_province_id')?get('search_province_id'):0,area::province_option()); ?>
            <?php echo form::select('search_city_id',get('search_city_id')?get('search_city_id'):0,area::city_option(get('search_city_id'))); ?>
            <?php echo form::select('search_section_id',get('search_section_id')?get('search_section_id'):0,area::section_option(get('search_section_id'))); ?>

            专题
            <?php echo form::select('search_spid',get('search_spid')?get('search_spid'):0,special::option()); ?>
        </form>
    </div>

    <table><tr><td style="text-align:right;">
        <a href="index.php?case=table&act=add&table=archive&admin_dir=<?php echo get('admin_dir');?>" class="button">添加内容</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo url::modify("table/".get('table')."/deletestate/1/page/1");?>" class="button">回收站</a>
    </td></tr></table>


<div class="blank10"></div>

<!--form name="searchform" id="searchform"  action="<?php echo uri();?>" method="post">
    <table border="0" cellspacing="0" cellpadding="4" class="list">
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
<?php echo form::select('_catid',get('_catid')?get('_catid'):0,category::option()); ?>
                            </td><td>
                                标题:</td><td>
                                <input type="text" name="_title" id="_title" value=""  />    </td><td>
                                <input type="submit" value="搜索" name="submit"  onclick="this.form.action='<?php echo url::modify('table/'.get('table'));?>'" class="button"/>
                            </td></tr>
        </tbody>
    </table></td>
<td width="200">
    <a href="index.php?case=table&act=add&table=archive&admin_dir=<?php echo get('admin_dir');?>" class="button">添加内容</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo url::modify("table/".get('table')."/deletestate/1/page/1");?>" class="button">回收站</a>
</td>
</tr>

</tbody>

</form-->




<form name="listform" id="listform"  action="<?php echo uri();?>" method="post">

    <table border="0" cellspacing="0" cellpadding="4" class="list" name="table" id="table">
        <thead>
            <tr>
                <th width="60" align="center">全选<br /><input title="点击可全选本页的所有项目"  onclick="CheckAll(this.form)" type="checkbox" name="chkall" class="checkbox" /> </th>
                <th align="center">排序</th>
                <th align="center"><!--aid-->编号</th>
                <th align="center"><!--catid-->类别</th>
                <th align="left"><!--title-->标题</th>
                <th align="center"><!--username-->作者</th>
                <th align="center"><!--view-->浏览</th>
                <th align="center"><!--adddate-->添加时间</th>
                <th align="center"><!--checked-->审核</th>
          
                <th align="center">操作</th>
            </tr>

        </thead>
        <tbody>
            <?php foreach($data as $d) { ?>
            <tr class="s_out" onmouseover="m_over(this)" onmouseout="m_out(this)">

                <td align="center"><input onclick="c_chang(this)" type="checkbox" value="<?php echo $d[$primary_key];?>" name="select[]" class="checkbox" /> </td>
                <td align="center"><?php echo form::input("listorder[$d[$primary_key]]",$d['listorder'],'size=3');?></td>

                <td align="center"><?php echo cut($d['aid']);?></td>
                <td align="center"><a href="<?php echo url("archive/list/catid/".$d['catid'],false);?>" target="_blank"><?php echo catname($d['catid']);?></a></td>
                <td align="left"><?php echo cut($d['title']);?></td>
                <td align="center"><?php echo cut($d['username']);?></td>
                <td align="right"><?php echo cut($d['view']);?></td>
                <td align="center"><?php echo cut($d['adddate']);?></td>
                <td align="center"><?php echo helper::yes($d['checked']);?></td>

                <td align="center">
                    <a href='<?php if($d['linkto'])   echo $d['linkto']; else echo url("archive/show/aid/$d[$primary_key]",false);?>' target="_blank" title="查看动态页面">查看</a>
                    <a href="<?php echo modify("act/edit/table/$table/id/$d[$primary_key]");?>">编辑</a>
                </td>
            </tr>
            <?php } ?>


        </tbody>
    </table>


    <div class="blank10"></div>

    <input type="hidden" name="batch" value="">
    <input  class="button" type="button" value=" 排序 " name="order" onclick="this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='listorder'; this.form.submit();"/>

    <?php  if(!front::get('deletestate')) {?>
    <input type="button" value=" 审核 " name="check" onclick="if(getSelect(this.form)  && confirm('确实要审核ID为('+getSelect(this.form)+')的记录吗?')){ this.form.action='<?php echo modify('act/batch',true);?>';this.form.batch.value='check';this.form.submit();}" class="button" />
        <?php } ?>

    <?php if(!front::get('deletestate')) {?>
    <input type="button" value="删除到回收站" name="delete" onclick="if(getSelect(this.form) && confirm('确实要把ID为('+getSelect(this.form)+')的记录放到回收站吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='deletestate'; this.form.submit();}" class="button"/>


        <?php } ?>

    <input type="button" value="<?php if(get('table')=='archive') {?>彻底<?php } ?>删除" name="delete" onclick="if(getSelect(this.form) && confirm('确实要删除ID为('+getSelect(this.form)+')的记录吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='delete'; this.form.submit();}" class="button" />

    <?php if(get('table')=='archive') {?>
    <input type="button" value=" 还原 " name="restore" onclick="if(getSelect(this.form) && confirm('确实要把ID为('+getSelect(this.form)+')的已删除记录还原吗?')){this.form.action='<?php echo modify('act/batch',true);?>'; this.form.batch.value='restore'; this.form.submit();}" class="button" />
        <?php } ?>        
        
      <div class="blank10"></div>     
      设置推荐位：<?php
preg_match_all('/\(([\d\w]+)\)(\S+)/im', $settings['attr1'], $result, PREG_SET_ORDER);
foreach($result as $val){
$result[$val['1']]=$val['2'];
}
$result['0']='请选择...';
echo form::select('attr1',0,$result);
  ?>
      <input  class="button" type="button" value="设置" name="recommend" onclick="if(getSelect(this.form)  && confirm('确实要设置ID为('+getSelect(this.form)+')的推荐位吗?')){ this.form.action='<?php echo modify('act/batch',true);?>';this.form.batch.value='recommend';this.form.submit();}"/>  
&nbsp;&nbsp;
       移动内容到：<?php echo form::select('catid',0,category::option()); ?> 
       <input  class="button" type="button" value="移动" name="movelist" onclick="if(getSelect(this.form)  && confirm('确实要移动ID为('+getSelect(this.form)+')的记录吗?')){ this.form.action='<?php echo modify('act/batch',true);?>';this.form.batch.value='movelist';this.form.submit();}"/>   
    

</form>


<div class="page"><?php if(get('table')!='type' && front::get('case')!='field') echo pagination::html($record_count); ?></div>