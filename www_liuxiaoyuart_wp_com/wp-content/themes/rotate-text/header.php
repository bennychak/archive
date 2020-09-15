<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php bloginfo('name'); ?> <?php if ( is_single() ) { ?> &raquo; Blog Archive <?php } ?> <?php wp_title(); ?></title>

<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" /> <!-- leave this for stats -->

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
 <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/domtab.js"></script>


<?php if (is_single() and ('open' == $post-> comment_status) or ('comment' == $post-> comment_type) ) { ?>
        <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/prototype.js.php"></script>
        <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/effects.js.php"></script>
        <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/ajax_comments.js"></script>
<?php } ?>
<?php wp_head(); ?>
</head>
<body>

<div id="grungebackwrap">
<div id="wrap">

<div id="topbar">
<div class="lefthd">
<h1><a href="<?php echo get_settings('home'); ?>/"><?php bloginfo('name'); ?></a></h1>
</div>

<div class="righthd">
<div class="top">
<div id="search_box">
<form method="get" id="sform" action="<?php bloginfo('home'); ?>/">
<input id="searchfield" name="s" type="text" value="<?php echo wp_specialchars($s, 1); ?>">
<input src="<?php bloginfo('template_directory'); ?>/images/searchbutton.gif" alt="Search" border="0" type="image" width="18" height="23">
</form>    
</div>
</div>
<div class="bot">
<div class="menu">
<ul>	
<li<?php if (is_home()) echo " class=\"current_page_item\""; ?>><a href="<?php bloginfo('url'); ?>">Home</a></li>
<?php wp_list_pages('sort_column=menu_order&depth=1&title_li='); ?>
</ul>
</div></div>
</div>
</div>


<div id="subbar">
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="980" height="150">
          <param name=movie value="<?php bloginfo('template_directory'); ?>/images/header.swf">
          <param name=quality value=high>
<param name="wmode" value="transparent">
          <embed src="<?php bloginfo('template_directory'); ?>/images/header.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="980" height="150" wmode="transparent">
          </embed> 
 </object>

</div>



<div class="content">

<!--
<div id="main">
<div class="featured">
main again. main agqain.
</div>
</div>

-->


<div id="main">
<div class="padding">

