<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		    
	<div <?php post_class(); ?>>
	
	    <?php if((function_exists('has_post_thumbnail')) && (has_post_thumbnail())) : ?>
	
	    <a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_post_thumbnail('post-thumbnail', array('alt' => ''.get_the_title().'', 'title' => ''.get_the_title().'', 'class' => 'article-img')); ?></a>
	    
	    <?php elseif(get_post_meta($post->ID, 'image_value', true)) : ?>
	    
	    <a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><img src="<?php echo TS_SCRIPTS; ?>thumb.php?src=<?php echo ts_image(get_post_meta($post->ID, "image_value", true)); ?>&amp;w=180&amp;h=180&amp;zc=1&amp;q=95" class="article-img-single" width="180" height="180" alt="<?php the_title(); ?>" /></a>
	    
	    <?php endif; // endif post thumbnail ?>
	    	
		<div class="article-right">
		
		    <h2 class="article-title"><a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>
		    
		    <p><span class="article-meta"><?php the_time(get_option('date_format')); ?> <?php _e('in',TS_DOMAIN); ?> <?php the_category(', '); ?></span></p>
		
		    <?php the_content('',TRUE); ?>
    			
			<?php the_more(); ?>
			
			<span class="article-comments"><?php comments_popup_link('0', '1', '%','',__('off',TS_DOMAIN)); ?></span>
		
		</div>
	    	
	</div>
		
	<?php endwhile; ?>
	
	<?php include(TEMPLATEPATH . '/lib/inc/paging.php'); ?>
	
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