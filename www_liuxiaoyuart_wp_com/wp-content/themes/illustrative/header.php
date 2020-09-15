<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />
<title><?php bloginfo('name'); ?><?php wp_title(); ?></title>
	<link rel="alternate" type="application/rss+xml" title="<?php _e('RSS 2.0 - all posts', 'illustrative'); ?>" href="<?php echo $feed; ?>" />
	<link rel="alternate" type="application/rss+xml" title="<?php _e('RSS 2.0 - all comments', 'illustrative'); ?>" href="<?php bloginfo('comments_rss2_url'); ?>" />
	<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
    <!--STYLE STARTS HERE-->
	<style type="text/css" media="screen">@import url( <?php bloginfo('stylesheet_url'); ?> );</style>
     	<!--[if IE]>
        <link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/ie.css" type="text/css" media="screen" />
	 	<![endif]-->
    <!--STYLE ENDS HERE-->
	<!-- script START -->
	<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/base.js"></script>
	<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/menu.js"></script>
	<!-- script END -->
	<?php wp_head(); ?>
</head>
<?php flush(); ?>
<body>
<!--CONTAINER STARTS HERE-->
<div id="container">
  <div id="header">
    <!--HEADER STARTS HERE-->
	<div id="caption">
		<h1 id="title"><a title="<?php bloginfo('description'); ?>" href="<?php bloginfo('url'); ?>"><?php bloginfo('name'); ?></a></h1>
		<div id="tagline"><?php bloginfo('description'); ?></div>
	</div>
    <!--LOGO ENDS HERE-->
    <div id="navigation">
      <!--NAVIGATION STARTS HERE-->
      <ul class="nav-links">
		<li class="<?php echo($home_menu); ?>"><a class="home" title="<?php _e('Home', 'illustrative'); ?>" href="<?php bloginfo('url'); ?>"><?php _e('Home', 'illustrative'); ?></a></li>
		<?php wp_list_pages('depth=1&title_li=0&sort_column=menu_order'); ?>
      </ul>
      <ul class="search-form">
        <li><form action="<?php bloginfo('home'); ?>" method="get">
					<input type="text" class="textfield" name="s" size="24" value="<?php echo wp_specialchars($s, 1); ?>" />
					<input type="submit" class="button" value="" />
			</form>
<script type="text/javascript">
//<![CDATA[
	var searchbox = MGJS.$("navigation");
	var searchtxt = MGJS.getElementsByClassName("textfield", "input", searchbox)[0];
	var searchbtn = MGJS.getElementsByClassName("button", "input", searchbox)[0];
	var tiptext = "<?php _e('Type text to search here...', 'illustrative'); ?>";
	if(searchtxt.value == "" || searchtxt.value == tiptext) {
		searchtxt.className += " searchtip";
		searchtxt.value = tiptext;
	}
	searchtxt.onfocus = function(e) {
		if(searchtxt.value == tiptext) {
			searchtxt.value = "";
			searchtxt.className = searchtxt.className.replace(" searchtip", "");
		}
	}
	searchtxt.onblur = function(e) {
		if(searchtxt.value == "") {
			searchtxt.className += " searchtip";
			searchtxt.value = tiptext;
		}
	}
	searchbtn.onclick = function(e) {
		if(searchtxt.value == "" || searchtxt.value == tiptext) {
			return false;
		}
	}
//]]>
</script>
        </li>
      </ul>
    </div>
    <!--NAVIGATION ENDS HERE-->
  </div>
  <!--HEADER ENDS HERE-->