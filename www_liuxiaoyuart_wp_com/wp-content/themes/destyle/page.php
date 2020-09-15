<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : the_post(); ?>
				
	<div <?php post_class(); ?>>
	
		<?php if((function_exists('has_post_thumbnail')) && (has_post_thumbnail())) : ?>
		
		<?php the_post_thumbnail('post-thumbnail', array('alt' => ''.get_the_title().'', 'title' => ''.get_the_title().'', 'class' => 'article-img')); ?>
		
		<?php elseif(get_post_meta($post->ID, 'image_value', true)) : ?>
		
		<img src="<?php echo TS_SCRIPTS; ?>thumb.php?src=<?php echo ts_image(get_post_meta($post->ID, "image_value", true)); ?>&amp;w=180&amp;h=180&amp;zc=1&amp;q=95" class="article-img" width="180" height="180" alt="<?php the_title(); ?>" />
		
		<?php endif; // endif post thumbnail ?>
	    
	    <h2 class="article-title"><?php the_title(); ?></h2>
	
	    <?php the_content(); ?>
	    
	    <?php edit_post_link(__('Edit Page',TS_DOMAIN), '<p>', '</p>'); ?>
	    
	</div>
	
	<?php else : ?>
	
	<div class="box-left">
	
	    <h2 class="article-title"><?php _e('Not found!',TS_DOMAIN); ?></h2>
	    <p><?php _e('Sorry, no posts matched your criteria.',TS_DOMAIN); ?></p>
	    <?php include (TEMPLATEPATH . "/searchform.php"); ?>
	
	</div>
	
	<?php endif; ?>

</div><!-- end content-left -->

<?php get_sidebar(); ?>
	
<?php get_footer(); ?>