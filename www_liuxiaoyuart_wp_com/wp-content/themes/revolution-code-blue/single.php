<?php get_header(); ?>

<div id="content">

	<div id="contentleft">
	
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		
		<h1><?php the_title(); ?></h1>
		
		<div class="date">
			<?php the_time('F j, Y'); ?>  by <?php the_author_posts_link(); ?><br />Filed under: <?php the_category(', ') ?>&nbsp;<?php edit_post_link('(Edit)', '', ''); ?> 
		</div>
		
		<?php the_content(__('Read more'));?><div style="clear:both;"></div>
				
		<!--
		<?php trackback_rdf(); ?>
		-->
		
		<div class="postmeta">
			<p>Tags: <?php the_tags('') ?> </p>
		</div>
					
		<?php endwhile; else: ?>
		
		<p><?php _e('Sorry, no posts matched your criteria.'); ?></p><?php endif; ?>
		
		<h3>Comments</h3>
		<?php comments_template(); // Get wp-comments.php template ?>
	
	</div>
	
<?php include(TEMPLATEPATH."/l_sidebar.php");?>

<?php include(TEMPLATEPATH."/r_sidebar.php");?>

</div>

<!-- The main column ends  -->

<?php get_footer(); ?>