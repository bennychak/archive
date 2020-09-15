<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div id="foot">
<?php $t=position_p($typeid=1);?>
<a href="<?php echo $t['url'];?>" title="<?php echo $t['name'];?>"><?php echo $t['name'];?></a>	|	
<?php?>
<!-- <?php foreach(archive(1,0,0,'0,0,0',20,'aid',10,false,0) as $i => $arc) { ?> -->
<a href="<?php echo $arc['url'];?>" title="<?php echo $arc['title'];?>"><?php echo $arc['title'];?></a>	|	
<!-- <?php } ?> --><?php $t=position_p($typeid=5);?>
<a href="<?php echo $t['url'];?>" title="<?php echo $t['name'];?>"><?php echo $t['name'];?></a>	|	
<?php?>
<a href="#">TOP</a><br />
Copyright © 2010 <a href="<?php echo get(site_url);?>"><?php echo get(sitename);?></a>. All Rights Reserved.
<a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo get('site_icp');?></a>
<!-- 非商业用户请勿删除 -->
<div class="copyright"><a href="http://www.cmseasy.cn" title="Powered by CmsEasy.cn" target="_blank">Powered by CmsEasy</a>&nbsp;&nbsp;<?php echo getcnzzcount();?></div>
</div>
</div>
<?php echo template('system/servers.html'); ?>
<script src="/lingzhi/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>