<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="CmsEasy 3_1_100908_UTF8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><?php if(!empty($archive['mtitle'])) { ?><?php echo $archive['mtitle'];?>-<?php } elseif (!empty($archive['title'])) { ?><?php echo $archive['title'];?>-<?php } ?><?php if($type['meta_title']) { ?><?php echo $type['meta_title'];?>-<?php } elseif (typename($type['typeid'])) { ?><?php echo typename($type['typeid']);?>-<?php } ?><?php if($category[$catid][meta_title]) { ?><?php echo $category[$catid]['meta_title'];?>-<?php } elseif (!empty($catid)) { ?><?php echo catname($catid);?>-<?php } ?><?php echo get('fullname');?> - Powered by CmsEasy</title>
<meta name="keywords" content="<?php if($archive['keyword']) { ?><?php echo $archive['keyword'];?><?php } else { ?><?php if($type['keyword']) { ?><?php echo $type['keyword'];?><?php } elseif ($category[$catid][keyword]) { ?><?php echo $category[$catid]['keyword'];?><?php } else { ?><?php echo get('site_keyword');?><?php } ?><?php } ?>" />
<meta name="description" content="<?php if($archive['description']) { ?><?php echo $archive['description'];?><?php } else { ?><?php if($type['description']) { ?><?php echo $type['description'];?><?php } elseif ($category[$catid][description]) { ?><?php echo $category[$catid]['description'];?><?php } else { ?><?php echo get('site_description');?><?php } ?><?php } ?>" />
<meta name="author" content="CmsEasy Team" />
<link rel="icon" href="<?php echo get(site_url);?>favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<?php echo get(site_url);?>favicon.ico" type="image/x-icon" />
<link href="<?php echo $skin_path;?>/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
<!-- 
function ResumeError()  
{ 
    return true; 
} 
window.onerror = ResumeError; 
function check()
{
if(document.search.keyword.value.length==0){
     alert("<?php echo lang(pleaceinputtext);?>");
     document.search.keyword.focus();
     return false;
    }

}
// --> 
</script>
</head>
 <body>
 <div id="body">
<div id="main">
     
<div id="i_head">
<div id="i_topmenu">
<?php echo login_js();?>
<a id="StranLink" title="繁简转换">繁体 - </a>
<a title="<?php echo lang(feedback);?>" href="<?php echo url('guestbook');?>" target="_blank"><?php echo lang(feedback);?> - </a>
<a href="<?php echo $site_url;?>" onclick="window.external.addFavorite(this.href,this.title);return false;" title='<?php echo get(sitename);?>' rel="sidebar"><?php echo lang(favorite);?> - </a>
</div>
<div id="logo"><a href="<?php echo get(site_url);?>" title="<?php echo get(sitename);?>"><img src="<?php echo get(site_url);?><?php echo get(site_logo);?>" width="<?php echo get(logo_width);?>" alt="<?php echo get(sitename);?>" /></a></div>
</div>

<div id="i_banner"><img src="<?php echo $skin_path;?>/banner_i.jpg" /></div>
<div id="i_menu">
<a title="<?php echo lang(homepage);?>" href="<?php echo get(site_url);?>" class="home"><?php echo lang(homepage);?></a>
<?php foreach(categories_nav() as $t) { ?>
<a title="<?php echo $t['catname'];?>" href="<?php echo $t['url'];?>"<?php if(isset($topid) && $topid==$t['catid']) { ?> class="on"<?php } ?>><?php echo $t['catname'];?></a>
<?php } ?>
</div>

<div id="i_announ">
<h5><?php echo lang(siteannoun);?></h5>
<ul>
<?php foreach(announ(5) as $an) { ?>
<li><a href="<?php echo $an['url'];?>"><?php echo $an['title'];?></a></li>
<?php } ?>
</ul>
<div id="i_search">
<form name='search' action="<?php echo url('archive/search');?>" onsubmit="search_check();" method="post">
<input  id="i_search_text" name="keyword" type="text" align="absmiple" />
<input type="submit" id="i_search_btn" align="absmiple" name='submit' value=" " />
</form>
</div>
</div>

<div id="i_c">

<div class="i_news">
<div class="title"><?php $t=position_p($typeid=2);?>
<a href="<?php echo $t['url'];?>" title="<?php echo $t['name'];?>"><?php echo $t['name'];?></a>
<?php?></div>
<ul>

<?php foreach(archive(2,0,0,'0,0,0',16,'aid',5,false,0) as $i => $archive) { ?> 
<li><a href="<?php echo $archive['url'];?>" title="<?php echo $arc['title'];?>"><?php echo $archive['title'];?></a></li>
<?php } ?>
</ul>
</div>

<div class="i_product">
<div class="title"><?php $t=position_p($typeid=3);?>
<a href="<?php echo $t['url'];?>" title="<?php echo $t['name'];?>"><?php echo $t['name'];?></a>
<?php?></div>



<div class="scoll_img">
        <table width="400" height="154" border="0" cellPadding="0" cellSpacing="0">
          <tr>
            <td width="16" ><div class="GalleryPictureScrollerMoveLeft" title="Turn to left" onmouseover=r_left() onMouseDown="r_f_left()" onMouseUp="r_left()"></div></td>
            <td width="362"><div class="GalleryPictureScroller" id=demo>
                <div id=demo1 style="FLOAT:left">
                 <div id=demo1 style="FLOAT:left">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                      <tr>
                      <?php foreach(archive(3,0,0,'0,0,0',20,'aid',10,true,0) as $i => $archive) { ?> <td class="GalleryPictureScrollerImageArea"><div class="GalleryPictureScrollerImage"><a href="<?php echo $archive['url'];?>" title="<?php echo $archive['title'];?>"><img src="<?php echo get(site_url);?><?php echo $archive['thumb'];?>" alt="<?php echo $archive['title'];?>" /></a></div>
                              <div class="GalleryPictureScrollerDetails"><a href="<?php echo $archive['url'];?>" title="<?php echo $archive['title'];?>"><?php echo $archive['title'];?></a></div>
                            </td><?php } ?>

                      </tr>
                    </tbody>
                  </table>
                </div>
                <DIV id=demo2 style="FLOAT: left"></DIV>
              </div></td>
            <td width="22"><div class="GalleryPictureScrollerMoveRight" title="Turn to right"  onmouseover=r_right() onMouseDown="r_f_right()" onMouseUp="r_right()"></div></td>
          </tr>
               
          <script src="<?php echo $skin_path;?>/contentscroller.js" type="text/javascript"></script>
        </table>
      </div>

</div>

<div class="i_contact">
<ul>
<li style="font-size:18px;"><?php echo lang(servertel);?></li>
<li style="line-height:32px;font-size:22px;border-bottom:1px solid #f5f5f5;"><?php echo get(tel);?></li>
<li style="font-size:16px;line-height:26px;"><?php echo lang(contactmode);?></li> 
<li><a href=""><?php echo lang(email);?>：<?php echo get(email);?></a></li> 
<li><a href=""><?php echo lang(servers);?>：<?php echo get(qq1);?></a></li>
</ul>
</div>

</div>
</div>
<div id="foot">
<div class="foot">

<style type="text/css">
#links {
position:relative;
float:right;
width:168px;
height:19px;
line-height:16px;color:#fff;
background:url(<?php echo $skin_path;?>/links.gif) right 2px no-repeat;
}

#links ul li a, #links ul li a:visited {color:#fff;display:block; text-decoration:none; width:168px; height:19px; text-align:left; padding-left:10px;  line-height:19px; font-size:12px;}
#links ul {padding:0; margin:0;list-style-type: none; }
#links ul li {float:left; position:relative;}
#links ul li ul {display: none;}
/* specific to non IE browsers */

#links ul li:hover ul {display:block; position:absolute; bottom:18px; left:0;}
#links ul li:hover ul li a.hide {}
#links ul li:hover ul li {display:block; width:168px; clear:both;
background:url(<?php echo $skin_path;?>/links_bg.gif) left top repeat-y;
}

</style>
<!--[if lte IE 6]>
<style type="text/css">
table {border-collapse:collapse; margin:0; padding:0;}
#links ul li a.hide, #links ul li a:visited.hide {display:none;}
#links ul li a:hover ul li a.hide {display:none;}
#links ul li a:hover {color:#fff; background:none;}
#links ul li a:hover ul {display:block; position:absolute; bottom:22px; right:0;}
#links ul li a:hover ul li {display:block; background:none; color:#fff; width:168px;overflow:hidden;
background:url(<?php echo $skin_path;?>/links_bg.gif) repeat-y left top;}
</style>
<![endif]-->

<div id="links">
<ul>


<li><a class="hide" style="text-align:right;font-size:10px;color:#999;">Links<span style="padding-right:80px;"></span></a>
<!--[if lte IE 6]>
<a href="#" style="text-align:right;font-size:10px;padding-right:80px;color:#999;">Links
<table><tr><td>
<![endif]-->
<ul>
<li style="height:7px;background:url(<?php echo $skin_path;?>/links_top.png) no-repeat left top !important; /*For Firefox*/*background:none;/*For IE7 & IE6*/_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<?php echo $skin_path;?>/links_top.png',sizingMethod='crop');/*For IE6*/display: block;"></li>
<?php foreach(friendlink('text',0,6) as $flink) { ?>
<li><?php echo $flink['link'];?></li>
<?php } ?>
<li style="height:41px;background:url(<?php echo $skin_path;?>/links_bt.png) no-repeat left top !important; /*For Firefox*/*background:none;/*For IE7 & IE6*/_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<?php echo $skin_path;?>/links_bt.png',sizingMethod='crop');/*For IE6*/display: block;"><a title="<?php echo get('sitename');?>" href="<?php echo get(site_url);?>"><?php echo get('sitename');?></a></li>

</ul>
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>
</ul>
</div>

Copyright © 2010 <a href="<?php echo get(site_url);?>"><?php echo get(sitename);?></a>. All Rights Reserved.
<a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo get('site_icp');?></a>
<!-- 非商业用户请勿删除 -->
<div class="copyright"><a href="http://www.cmseasy.cn" title="Powered by CmsEasy.cn" target="_blank">Powered by CmsEasy</a>&nbsp;&nbsp;<?php echo getcnzzcount();?></div>
</div>
</div>
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
<?php echo template('system/servers.html'); ?>
<script src="/lingzhi/js/common.js" language="javascript" type="text/javascript"></script>
</body>
</html>