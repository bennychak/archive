<?php /*
Template Name: Bookmarks
*/ ?>

<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : the_post(); ?>
		
	<h2 class="article-title"><?php the_title(); ?></h2>
	
	<?php if(get_the_content()) :  ?>
	<div class="box-left">
	
	    <?php the_content(); ?>
	    
	    <?php edit_post_link(__('Edit Page',TS_DOMAIN), '<p>', '</p>'); ?>
	
	</div>
	<?php endif; ?>
	    
	<div id="page-bookmarks" class="clearfix">
	
	    <?php wp_list_bookmarks('title_li=&category_before=<div class="box-left">&category_after=</div>&title_before=<h3>&title_after=</h3>'); ?>
	
	</div>
		
	<?php endif; ?>
	
</div><!-- end content-left -->

<?php get_sidebar(); ?>
	
<?php get_footer(); ?>