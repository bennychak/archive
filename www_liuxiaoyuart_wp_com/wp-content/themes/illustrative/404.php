<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

	<title><?php bloginfo('name'); ?><?php wp_title(); ?></title>
	<link rel="alternate" type="application/rss+xml" title="<?php _e('RSS 2.0 - all posts', 'illustrative'); ?>" href="<?php echo $feed; ?>" />
	<link rel="alternate" type="application/rss+xml" title="<?php _e('RSS 2.0 - all comments', 'illustrative'); ?>" href="<?php bloginfo('comments_rss2_url'); ?>" />

	<!-- style START -->
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/404.css" type="text/css" media="screen" />
	<!-- style END -->

	<?php wp_head(); ?>
</head>

<body>
	<div id="wrapper">
		<img src="<?php bloginfo('template_url'); ?>/images/oops.jpg" alt="404 Error Oops!" title="404 Error Oops!" />
		<h1 class="loud"><?php _e('Sorry! We could not find it', 'illustrative'); ?></h1>
		<p class="loud"><?php _e('You have requested a page or file which does not exist so we notified the web administrator to check it out.', 'illustrative'); ?></p>
		<p class="small"><?php _e('Here are a few options to find what you are looking for.', 'illustrative'); ?></p>
		<ol>
			<li><span><?php _e('Double check the web address for typos', 'illustrative'); ?></span></li>
			<li><span><?php _e('Head back to our home page via the navigation below', 'illustrative'); ?></span></li>
			<li><span><?php _e('Visit our full website', 'illustrative'); ?> 
            <a href="<?php bloginfo('url'); ?>"><?php _e('sitemap here', 'illustrative'); ?></a></span></li>
		</ol>
		<ul>
			<li><a href="<?php bloginfo('url'); ?>"><?php _e('Home', 'illustrative'); ?></a></li>
			<li><a href="<?php bloginfo('url'); ?>"><?php _e('Blog', 'illustrative'); ?></a></li>
			<li><a href="<?php bloginfo('url'); ?>"><?php _e('About', 'illustrative'); ?></a></li>
			<li class="last"><a href="<?php bloginfo('url'); ?>"><?php _e('Contact', 'illustrative'); ?></a></li>
		</ul>
	</div><!-- end div #wrapper -->
<?php wp_footer(); ?>
</body>
</html>