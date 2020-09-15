<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php echo template('header.html'); ?><!-- 调用页头模板 -->
<div id="c">
<?php echo template('position.html'); ?><!-- 调用导航模板 -->
<!-- 右侧内容 -->
<div id="right">
<div style="padding:30px 0px 0px 15px;">
<ul class="news_list">
<!-- 内容列表循环 -->
<?php foreach($archives as $i => $arc) { ?>
<li><span class="date"><?php echo $arc['adddate'];?></span><a title="<?php echo $arc['title'];?>" target="_blank" href="<?php echo $arc['url'];?>"><?php echo $arc['title'];?></a></li>
<?php } ?>
</ul>
<div class="blank30"></div>
<!-- 内容列表分页 -->
<?php if(isset($pages)) { ?>
<?php echo category_pagination($catid);?>
<?php } ?>

<div class="blank30"></div>
<a title="<?php echo lang(gotop);?>" href="#" class="clear floatright"><img alt="<?php echo lang(gotop);?>" src="<?php echo $skin_url;?>/gotop.gif"></a>
<div class="blank30"></div>

</div>
</div>

<?php echo template('left.html'); ?><!-- 调用通用左栏 -->

<div class="clear"></div>
</div>
<!-- 调用页底模板 -->
<?php echo template('footer.html'); ?>