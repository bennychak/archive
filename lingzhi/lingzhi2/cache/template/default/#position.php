<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div id="position">
<span><a title="<?php echo get('sitename');?>" href="<?php echo get(site_url);?>"><?php echo get('sitename');?></a><?php foreach(position($catid) as $t) { ?><a title="<?php echo $t['name'];?>" href="<?php echo $t['url'];?>"><?php echo $t['name'];?></a><?php } ?></span><strong><?php echo lang(nowposition);?></strong>
</div>