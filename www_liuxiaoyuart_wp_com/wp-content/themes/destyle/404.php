<?php get_header(); ?>

<div id="content-left">
	
	<div class="box-left">
		
			<h2 class="article-title"><?php _e('Error 404, no posts found!',TS_DOMAIN); ?></h2>
		
	</div>
	
	<?php include (TEMPLATEPATH . "/archives.php"); ?>
	
</div><!-- end content-left -->

<?php get_sidebar(); ?>
	
<?php get_footer(); ?>