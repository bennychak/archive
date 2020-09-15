<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>
<head profile="http://gmpg.org/xfn/11">

<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php wp_title(' &raquo; ',true,'right'); ?><?php bloginfo('name'); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="alternate" type="application/rss+xml" title="RSS Feed" href="<?php echo ts_get_option('ts_rss'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<?php wp_head(); ?>

</head>

<body <?php body_class(); ?>>

<div id="main">

	<div id="header-top-wrap">

		<div id="header-top">		
		
		    <div id="social">
		    	<?php if(ts_get_option('ts_twitter')) : ?>	    	
		    	<a href="http://twitter.com/<?php echo ts_get_option('ts_twitter'); ?>" id="social-twitter"><?php _e('Follow me',TS_DOMAIN); ?></a>
		    	<?php endif; ?>
		    	<a href="<?php echo ts_get_option('ts_rss'); ?>" id="social-rss"><?php _e('Subscribe RSS',TS_DOMAIN); ?></a>
		    </div>
		
		    <?php if(function_exists('wp_nav_menu')) :
		    wp_nav_menu( array( 'sort_column' => 'menu_order', 'container_class' => 'ts-menu-top', 'menu_class' => 'sf-menu', 'fallback_cb' => 'ts_top', 'theme_location' => 'top' ) );
		    else : ?>
		    
		    <div class="ts-menu-top">
		        <ul class="sf-menu">
		            <?php $ex_pages = ts_get_option('ts_ex_pages'); wp_list_pages('title_li=&sort_column=menu_order&exclude='.$ex_pages); ?>
		        </ul>
		    </div>
		    
		    <?php endif; ?>
		
		</div>
	
	</div>

	<div id="header" class="clearfix">
		
		<div id="logo" class="clearfix">		
			<a href="<?php bloginfo('url'); ?>"><img src="<?php echo ts_get_option('ts_logo'); ?>" alt="<?php bloginfo('name'); ?>" /></a>
			<h2><?php bloginfo('description'); ?></h2>
		</div>
	
	</div><!-- end header -->
	
	<div id="menu-wrap">
	
		<?php if(function_exists('wp_nav_menu')) :
		wp_nav_menu( array( 'sort_column' => 'menu_order', 'container_class' => 'ts-menu-main', 'menu_class' => 'sf-menu', 'fallback_cb' => 'ts_menu', 'theme_location' => 'main' ) );
		else : ?>
		
		<div class="ts-menu-main">
		    <ul class="sf-menu">
		        <?php if(!ts_get_option('ts_ex_home')) : ?>
		        <li<?php if(is_front_page()) echo ' class="current"'; ?>><a href="<?php bloginfo('url'); ?>" title="<?php _e('Home',TS_DOMAIN); ?>"><?php _e('Home',TS_DOMAIN); ?></a></li>
		        <?php endif; ?>
		        <?php if(is_single()) : $category = get_the_category(); $current_cat = $category[0]->cat_ID; else : $current_cat = ''; endif;
		        $ex_cats = ts_get_option('ts_ex_cats'); wp_list_categories('title_li=&current_category='.$current_cat.'&exclude='.$ex_cats.'&orderby=ID'); ?>
		    </ul>
		</div>
		
		<?php endif; ?>
	
	</div>
	
	<div id="content-top"></div>
	
	<div id="content-wrap">
		
		<div id="content">