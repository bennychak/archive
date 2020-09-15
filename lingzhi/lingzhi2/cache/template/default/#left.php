<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div id="left">


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
<div id="menu">
<a href="javascript:void(0)" class="home" id="listnav" onclick="displayblock(labelarr)">+<?php echo lang(quicknav);?></a>
<!-- <?php foreach(category::listcategorydata() as $i => $category) { ?> -->
<?php
if ($category['level'] == '0'){
 $_pid = $category['catid'];
}
$pid1 = get('catid');
for($_j=0;$_j<=$category['level'];$_j++){
 $pid1 = category::getattr($pid1,'parentid');
 if(empty($pid1)){
 continue;
 }else{
 $_pid1 = $pid1;
 }
}
?>
<span id="level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>">
<script language="javascript" type="text/javascript">
labelarr[<?php echo $i;?>] = 'level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>';
<?php if($_pid != $_pid1 && $category['level'] != 0 && $catid != $_pid) { ?>
displaynone('level_<?php echo $category['level'];?>_<?php echo $category['catid'];?>_<?php echo $category['parentid'];?>_<?php echo $catid;?>');
<?php } ?>
</script>
<a href="<?php echo $category['url'];?>" title="<?php echo $category['catname'];?>" class="<?php if($category['catid']==$catid) { ?>on<?php } ?>"><?php echo $category['catname'];?></a></span>
<!-- <?php } ?> -->
</div>
<!--左侧栏目导航结束-->


<div class="left_box">
<div class="title"><?php echo lang(contentspecial);?></div>
<ul>
<!-- <?php foreach(special::listdata() as $special) { ?> -->
<li><a href="<?php echo $special['url'];?>" title="<?php echo $special['title'];?>"><?php echo $special['title'];?></a></li>
<!-- <?php } ?> -->
</ul>
</div>


<div class="title"><?php echo lang(arealist);?></div>
<ul class="area_box">
<!-- <?php foreach(area::listdata(0,50) as $area) { ?> -->
<a href="<?php echo $area['url'];?>" title="<?php echo $area['name'];?>"><?php echo $area['shortname'];?></a>
<!-- <?php } ?> -->
<div class="clear"></div>
</ul>

<div class="left_box">
<div class="title"><?php echo lang(contactus);?></div>
<ul>
<li><?php echo lang(address);?>：<?php echo get(address);?></li>
<li><?php echo lang(tel);?>：<?php echo get(tel);?></li>
<li><?php echo lang(fax);?>：<?php echo get(fax);?></li> 
<li><?php echo lang(email);?>：<?php echo get(email);?></li> 
</ul>
</div>


</div>

