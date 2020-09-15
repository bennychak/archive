<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="CmsEasy 3_1_100908_UTF8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><?php if(!empty($archive['mtitle'])) { ?>
  <?php echo $archive['mtitle'];?>-
<?php } elseif (!empty($archive['title'])) { ?>
  <?php echo $archive['title'];?>-
<?php } else { ?>
  <?php if($type['meta_title']) { ?>
    <?php echo $type['meta_title'];?>-
  <?php } elseif (typename($type['typeid'])) { ?>
    <?php echo typename($type['typeid']);?>-
  <?php } ?>
  <?php if($category[$catid][meta_title]) { ?>
    <?php echo $category[$catid]['meta_title'];?>-
  <?php } elseif (!empty($catid)) { ?>
    <?php echo catname($catid);?>-
  <?php } ?>
<?php } ?>
<?php echo get('fullname');?> - Powered by CmsEasy</title>
<meta name="keywords" content="<?php if($archive['keyword']) { ?><?php echo $archive['keyword'];?><?php } else { ?><?php if($type['keyword']) { ?><?php echo $type['keyword'];?><?php } elseif ($category[$catid][keyword]) { ?><?php echo $category[$catid]['keyword'];?><?php } else { ?><?php echo get('site_keyword');?><?php } ?><?php } ?>" />
<meta name="description" content="<?php if($archive['description']) { ?><?php echo $archive['description'];?><?php } else { ?><?php if($type['description']) { ?><?php echo $type['description'];?><?php } elseif ($category[$catid][description]) { ?><?php echo $category[$catid]['description'];?><?php } else { ?><?php echo get('site_description');?><?php } ?><?php } ?>" />
<meta name="author" content="CmsEasy Team" />
<link rel="icon" href="<?php echo get(site_url);?>favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<?php echo get(site_url);?>favicon.ico" type="image/x-icon" />
<link href="<?php echo $skin_path;?>/reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $skin_path;?>/style.css" rel="stylesheet" type="text/css" />
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
<div class="header box">
<div class="logo"><a href="<?php echo $site_url;?>"><img src="<?php echo get('site_logo');?>" alt="<?php echo $sitename;?>" width="<?php echo get('logo_width');?>"></a></div>
<div class="topnav">
<a href="<?php echo $site_url;?>"><?php echo lang(homepage);?></a>|
<a href="<?php echo $site_url;?>" onclick="window.external.addFavorite(this.href,this.title);return false;" title='<?php echo get(sitename);?>' rel="sidebar"><?php echo lang(favorite);?></a>|
<a title="留言" href="<?php echo url('guestbook');?>" target="_blank"><?php echo lang(feedback);?></a>
</div>
<div class="blank10"></div>
<div class="topmenu">
<div>
<a title="<?php echo lang(backhome);?>" href="<?php echo get(site_url);?>" class="on"><?php echo lang(homepage);?></a>
<?php foreach(categories_nav() as $t) { ?>
| <a title="<?php echo $t['catname'];?>" href="<?php echo $t['url'];?>"<?php if(isset($topid) && $topid==$t['catid']) { ?> class="on"<?php } ?>><?php echo $t['catname'];?></a>
<?php } ?>
</div>
</div>
</div>
<div class="blank10"></div>
<div class="banner_1 box">
<script type="text/javascript">
switch(<?php echo get('slide_number');?>){/*幻灯片数量控制*/
case 1:
var files='<?php echo get(site_url);?><?php echo get(slide_pic1);?>';/*广告图片*/
    var links='<?php echo get(slide_pic1_url);?>';/*图片上的链接,注意链接中的&要用%26替换*/
    var texts='<?php echo get(slide_pic1_title);?>';/*图片标题*/
break
case 2:
var files='<?php echo get(site_url);?><?php echo get(slide_pic1);?>|<?php echo get(site_url);?><?php echo get(slide_pic2);?>';/*广告图片*/
var links='<?php echo get(slide_pic1_url);?>|<?php echo get(slide_pic2_url);?>';/*图片上的链接,注意链接中的&要用%26替换*/
var texts='<?php echo get(slide_pic1_title);?>|<?php echo get(slide_pic2_title);?>';/*图片标题*/
break
case 3:
var files='<?php echo get(site_url);?><?php echo get(slide_pic1);?>|<?php echo get(site_url);?><?php echo get(slide_pic2);?>|<?php echo get(site_url);?><?php echo get(slide_pic3);?>';/*广告图片*/
var links='<?php echo get(slide_pic1_url);?>|<?php echo get(slide_pic2_url);?>|<?php echo get(slide_pic3_url);?>';/*图片上的链接,注意链接中的&要用%26替换*/
var texts='<?php echo get(slide_pic1_title);?>|<?php echo get(slide_pic2_title);?>|<?php echo get(slide_pic3_title);?>';/*图片标题*/
    case 4:
var files='<?php echo get(site_url);?><?php echo get(slide_pic1);?>|<?php echo get(site_url);?><?php echo get(slide_pic2);?>|<?php echo get(site_url);?><?php echo get(slide_pic3);?>|<?php echo get(site_url);?><?php echo get(slide_pic4);?>';/*广告图片*/
var links='<?php echo get(slide_pic1_url);?>|<?php echo get(slide_pic2_url);?>|<?php echo get(slide_pic3_url);?>|<?php echo get(slide_pic4_url);?>';/*图片上的链接,注意链接中的&要用%26替换*/
var texts='<?php echo get(slide_pic1_title);?>|<?php echo get(slide_pic2_title);?>|<?php echo get(slide_pic3_title);?>|<?php echo get(slide_pic4_title);?>';/*图片标题*/
   default:
   var files='<?php echo get(site_url);?><?php echo get(slide_pic1);?>|<?php echo get(site_url);?><?php echo get(slide_pic2);?>|<?php echo get(site_url);?><?php echo get(slide_pic3);?>|<?php echo get(site_url);?><?php echo get(slide_pic4);?>|<?php echo get(site_url);?><?php echo get(slide_pic5);?>';/*广告图片*/
var links='<?php echo get(slide_pic1_url);?>|<?php echo get(slide_pic2_url);?>|<?php echo get(slide_pic3_url);?>|<?php echo get(slide_pic4_url);?>|<?php echo get(slide_pic5_url);?>';/*图片上的链接,注意链接中的&要用%26替换*/
var texts='<?php echo get(slide_pic1_title);?>|<?php echo get(slide_pic2_title);?>|<?php echo get(slide_pic3_title);?>|<?php echo get(slide_pic4_title);?>|<?php echo get(slide_pic5_title);?>';/*图片标题*/
}

var swf_width=970;/*修改flash宽，图片广告需要适应此宽度*/
var swf_height=<?php echo get('slide_height');?>;/*修改flash高，图片广告需要适应此高度*/
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="<?php echo get(site_url);?>images/slide/focus.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
document.write('<embed src="<?php echo get(site_url);?>images/slide/focus.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>
</div>
<div class="blank10"></div>