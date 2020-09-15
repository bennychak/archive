<?php get_header(); ?>

<div id="content"> 

	<div id="contentleft">
	
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		
		<h1><a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a></h1>
		
		<div class="date">
			<?php the_time('F j, Y'); ?>  by <?php the_author_posts_link(); ?> &middot; <?php comments_popup_link('Leave a Comment', '1 Comment', '% Comments'); ?><br />Filed under: <?php the_category(', ') ?>&nbsp;<?php edit_post_link('(Edit)', '', ''); ?> 
		</div>
		
		<?php the_content(__('Read more'));?><div style="clear:both;"></div>
		
		<div class="postmeta">
			<p>Tags: <?php the_tags('') ?> </p>
		</div>
		
		<?php endwhile; else: ?>
		
		<p><?php _e('Sorry, no posts matched your criteria.'); ?></p><?php endif; ?>
		<p><?php posts_nav_link(' &#8212; ', __('&laquo; Previous Page'), __('Next Page &raquo;')); ?></p>
	
	</div>
		
	<?php include(TEMPLATEPATH."/l_sidebar.php");?>
	
	<?php include(TEMPLATEPATH."/r_sidebar.php");?>

</div>

<!-- The main column ends  -->

<?php get_footer(); ?>