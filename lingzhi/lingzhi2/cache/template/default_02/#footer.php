<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div class="bottom clear">
<div class="logo_b"><a title="<?php echo get('sitename');?>" href="<?php echo $site_url;?>"><h3><?php echo get('sitename');?></h3></a></div>
<div class="bottom_menu">
<!-- <?php foreach(archive(1,0,0,'0,0,0',6,'aid',5,false,0) as $i => $archive) { ?>  -->
<a href="<?php echo $archive['url'];?>" title="<?php echo $archive['title'];?>"><?php echo $archive['title'];?></a>	|	
<!-- <?php } ?> --><?php echo login_js();?>	|	
<a href="<?php echo get(site_url);?>index.php?case=manage&act=guestadd&manage=archive&guest=1">发布信息</a>	|	
<a href="#">TOP</a>
</div>
<p>
<?php echo get('site_right');?>  <a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo get('site_icp');?></a>
<br />
Copyright © 2010 <a href="<?php echo get(site_url);?>"><?php echo get(sitename);?></a>. All Rights Reserved.</p>
</div>
<!-- 非商业用户请勿删除 -->
<div class="copyright"><a href="http://www.cmseasy.cn" title="Powered by CmsEasy.cn" target="_blank">Powered by CmsEasy</a>&nbsp;&nbsp;<?php echo getcnzzcount();?></div>
<?php echo template('system/servers.html'); ?>
<script src="/lingzhi2/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>