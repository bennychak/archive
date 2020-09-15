<?php /* Please do not remove this line */ global $opt; ?>

<div id="sidebar">

	<h2>Blog Subscription</h2>
	<div class="box">
	<p class="rssfeed"><a href="<?php bloginfo('rss2_url'); ?>">Subscribe via RSS Feed</a> stay updated with blog articles</p>
	</div>
	

	<?php include (TEMPLATEPATH . "/sidebar_c.php"); ?>
	<?php include (TEMPLATEPATH . "/sidebar_l.php"); ?>
	<?php include (TEMPLATEPATH . "/sidebar_r.php"); ?>
	<div class="clear"></div>

	<h2>Place anything here!</h2>
	

	<h2>about the author</h2>
	<div class="box">
	<?php include (TEMPLATEPATH . "/about.php"); ?>
	</div>

</div>