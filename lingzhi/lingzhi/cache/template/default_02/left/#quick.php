<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div class="t_1 mb10"><div><h3>快速通道</h3></div></div>
<div class="quick mb10">
<?php $t=position_p($typeid=3);?>
<a href="<?php echo $t['url'];?>" class="q_1"><?php echo $t['name'];?></a>
<?php $t=position_p($typeid=4);?>
<a href="<?php echo $t['url'];?>" class="q_2"><?php echo $t['name'];?></a>
<?php $t=position_p($typeid=5);?>
<a href="<?php echo $t['url'];?>" class="q_3"><?php echo $t['name'];?></a>
<?php $t=position_p($typeid=1);?>
<a href="<?php echo $t['url'];?>" class="q_4"><?php echo $t['name'];?></a>
<a href="<?php echo $base_url;?>/index.php?case=guestbook&act=index" class="q_5">在线订购</a>
</div>