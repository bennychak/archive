<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>

<?php if ( is_home() ) : ?><title><?php bloginfo('name'); ?></title><meta name="keywords" content="italiasw, italia sw, www.italiasw.com, recensioni, web2, web 2, apps, applicativi, software, windows, windows xp, windows vista, vista, ict, recensioni ict, recensioni software, news, news high tech, blog italia, blog software, italia software, sw, blog informatica, news informatica, articoli informatica, recensioni web 2.0" /><meta name="description" content="<?php bloginfo('description'); ?>" />
<?php endif ;?><?php if ( is_single()) { ?><title><?php the_title(); ?> &raquo; <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_search()) { ?><title>Search Result</title><?php } ?><?php if ( is_archive()) { ?><title><?php single_cat_title(); ?> &raquo; <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_page()) { ?><title><?php the_title(); ?> &raquo; <?php bloginfo('name'); ?></title><?php } ?><?php if ( is_404()) { ?><title>Error 404, Page not Found &raquo; <?php bloginfo('name'); ?></title><?php } ?>

	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />
	<meta http-equiv="Content-Language" content="en-us" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="MSSmartTagsPreventParsing" content="true" />
	<meta name="description" content="" />
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<?php bloginfo('rss2_url'); ?>" />
	<link rel="alternate" type="text/xml" title="RSS .92" href="<?php bloginfo('rss_url'); ?>" />
	<link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="<?php bloginfo('atom_url'); ?>" />
	<?php wp_head(); ?>
</head>
<body>
	<div id="header">
	<h1><a id="top"></a><a href="<?php echo get_settings('home'); ?>/"><?php bloginfo('name'); ?></a></h1>
	<h2><?php bloginfo('description'); ?></h2>
				<?php include (TEMPLATEPATH . '/searchform.php'); ?></div>
<div id="navigation">
<li class="selected"><a href=<?php echo get_settings('home'); ?>>Home</a></li>
<?php wp_list_pages('sort_column=menu_order&depth=1&title_li='); ?>
</div>