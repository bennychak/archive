<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php echo template('header.html'); ?><!-- 调用页头模板 -->
<div id="c">
<?php echo template('position.html'); ?><!-- 调用导航模板 -->

<div id="right">
<div style="padding:30px 0px 0px 15px;">
<!-- 内容_内容简介列表 -->
<?php foreach($archives as $i => $arc) { ?>
<div class="news_text">
<h5><span class=date><?php echo $arc['adddate'];?></span><a title="<?php echo $arc['title'];?>" href="<?php echo $arc['url'];?>"><?php echo $arc['title'];?></a><?php if($archive['attr2']) { ?>&nbsp;&nbsp;<a title="<?php echo lang(makeorders);?>" target="_blank" href="<?php echo url('archive/orders/aid/'.$archive['aid'],true);?>" class="orders"><?php echo lang(makeorders);?></a><?php } ?></h5>
<p><?php echo cut(strip_tags($arc['introduce']),100);?>…<a title="<?php echo $arc['title'];?>" href="<?php echo $arc['url'];?>">[<?php echo lang(more);?>]</a><p>
<div class="clear"></div>
</div>
<?php } ?>
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