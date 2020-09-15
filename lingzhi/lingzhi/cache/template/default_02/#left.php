<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div class="left_1">

<!--左侧栏目导航开始-->
<script language="javascript" type="text/javascript">
var labelarr = new Array();
function displaynone(id){
document.getElementById(id).style.display='none';
}
function displayblock(labelarr){
for(i=0;i<=labelarr.length;i++){
document.getElementById(labelarr[i]).style.display='block';
}	
}
</script>
<div class="t_1 mb5"><div><h3><a href="javascript:void(0)" class="home" id="listnav" onclick="displayblock(labelarr)">+快速导航</a></h3></div></div>
<ul class="leftmenu mb10">
<!-- <?php foreach(category::listcategorydata() as $i => $category) { ?> -->
<span id="level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>">
<script language="javascript" type="text/javascript">
labelarr[<?php echo $i;?>] = 'level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>';
<?php if($catid!=$category['parentid'] && $category['parentid']!=0 && $category['catid']!=$catid) { ?>
displaynone('level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>');
<?php } ?>
</script>
<li><a href="<?php echo $category['url'];?>" title="<?php echo $category['catname'];?>" class="<?php if($category['catid']==$catid) { ?>on<?php } ?>"><?php echo $category['catname'];?></a></li>
</span>
<!-- <?php } ?> -->
</ul>
<!--左侧栏目导航结束-->
<?php echo template('left/search.html'); ?>



<div class="t_1 mb10"><div><h3>相关内容</h3></div></div>
<ul class="f_link">
<!-- <?php foreach(archive($catid,0,0,'0,0,0',20,'aid',5,false,0) as $i => $arc) { ?> -->
<li><a href="<?php echo $arc['url'];?>" title="<?php echo $arc['title'];?>"><?php echo $arc['title'];?></a></li>
<!-- <?php } ?> -->
</ul>
</div>