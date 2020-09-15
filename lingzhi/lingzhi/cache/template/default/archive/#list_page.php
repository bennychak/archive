<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<?php echo template('header.html'); ?>
<div id="c">
<?php echo template('position.html'); ?>

<div id="right">
<h1 id="title"><?php echo $category[$catid]['catname'];?></h1>
<div id="text">

<?php echo $category[$catid]['categorycontent'];?>

<div class="blank30"></div>
<a title="<?php echo lang(gotop);?>" href="#" class="clear floatright"><img alt="<?php echo lang(gotop);?>" src="<?php echo $skin_url;?>/gotop.gif"></a>
<div class="blank30"></div>

</div>
</div>

<?php echo template('left.html'); ?><!-- 调用通用左栏 -->

<div class="clear"></div>
</div>


<script> 
function resizeImg(obj)
{ 
var obj = document.getElementById(obj); 
var objContent = obj.innerHTML;
var imgs = obj.getElementsByTagName('img'); 
if(imgs==null) return; 
for(var i=0; i<imgs.length; i++) 
{ 
if(imgs[i].width>parseInt(obj.style.width)) 
{ 
imgs[i].width = parseInt(obj.style.width);
} 
} 
} 
window.onload = function() {resizeImg('text');
} 
</script>
<?php echo template('footer.html'); ?>