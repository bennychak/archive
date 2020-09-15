<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div id="position">
<strong><?php echo lang(nowposition);?>：</strong><a title="<?php echo get('sitename');?>" href="<?php echo $base_url;?>"><?php echo get('sitename');?></a><?php foreach(position($catid) as $t) { ?><a title="<?php echo $t['name'];?>" href="<?php echo $t['url'];?>"><?php echo $t['name'];?></a><?php } ?>
</div>