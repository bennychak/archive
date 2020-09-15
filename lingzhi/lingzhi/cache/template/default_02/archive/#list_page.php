<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php echo template('header.html'); ?>
<div class="box line_4">
<?php echo template('left.html'); ?>
<!--left_1 end-->

<div class="right_2">
<div class="t_2 mb10"><div><h3><?php echo $category[$catid]['catname'];?></h3><span>Archive list</span></div></div>
<?php echo template('position.html'); ?>

<div id="title">
<h1><?php echo $category[$catid]['catname'];?></h1>
<div class="text"><?php echo $category[$catid]['categorycontent'];?></div>
<div class="blank10"></div>
</div>
<div class="blank30"></div>
<a title="返回顶部" href="#" class="clear floatright"><img alt="返回顶部" src="<?php echo $skin_url;?>/gotop.gif"></a>
<div class="clear"></div>

</div>
<div class="clear"></div>
</div>
<!--box end-->
<?php echo template('footer.html'); ?>