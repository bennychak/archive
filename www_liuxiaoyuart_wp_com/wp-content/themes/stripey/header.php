<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type');?> charset=<?php bloginfo("charset"); ?>" />
<title><?php wp_title("&laquo;",true, "right"); bloginfo("name"); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url');?>" type="text/css" media="screen" />
<link rel="alternate" href="<?php bloginfo("rss2_url");?>" type="application/rss+xml" title="<?php bloginfo('name');?> RSS Feed" />
<link rel="alternate" href="<?php bloginfo("atom_url");?>" type="application/atom+xml" title="<?php bloginfo('name');?> Atom Feed" />
<link rel="pingback" href="<?php bloginfo('pingback_url');?>" />

<?php wp_head();?>

</head>

<body>

	<div id="webPage" class="aligncenter">
	
		<div id="header">
	
			<h1><a href="<?php bloginfo("url");?>"><?php bloginfo("title");?></h1>
			<p class="description"><?php bloginfo("description");?></p>
			
			<div class="rssFeeds"><a href="<?php bloginfo("rss2_url");?>">Rss Feeds</a><a class="lastRss" href="<?php bloginfo("comments_rss2_url");?>">Comments RSS</a></div>
	
		</div><!-- header -->
		
		<ul id="nav" class="aligncenter">
		
			<li <?php if(is_home()):?> class="current_page_item" <?php endif;?>><a href="<?php bloginfo("url");?>">Home</a></li>
			<?php wp_list_pages("title_li=&depth=1");?>

		</ul><!-- nav -->