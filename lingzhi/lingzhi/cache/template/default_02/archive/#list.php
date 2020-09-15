<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php echo template('header.html'); ?>
<div class="box line_4">
<?php echo template('left.html'); ?>
<!--left_1 end-->

<div class="right_2">
<div class="t_2 mb10"><div><h3><?php echo $category[$catid]['catname'];?></h3><span>Archive list</span></div></div>
<?php echo template('position.html'); ?>

<ul class="news_list">
<?php foreach($archives as $i => $arc) { ?>
<li class="list<?php echo $i+1;?>"><span class="date"><?php echo $arc['adddate'];?></span><span class=date>评分<?php echo $arc['strgrade'];?></span><a title="<?php echo $arc['title'];?>" target="_blank" href="<?php echo $arc['url'];?>"><?php echo $arc['title'];?></a></li>
<?php } ?>
</ul>
<div class="blank10"></div>
<?php if(isset($pages)) { ?>
<?php echo category_pagination($catid);?>
<?php } ?>
<div class="blank30"></div>
<a title="返回顶部" href="#" class="clear floatright"><img alt="返回顶部" src="<?php echo $skin_url;?>/gotop.gif"></a>
<div class="clear"></div>
</div>
<div class="clear"></div>
</div>
<!--box end-->
<?php echo template('footer.html'); ?>