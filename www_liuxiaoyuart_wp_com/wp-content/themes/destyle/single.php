<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
				
	<div <?php post_class(); ?>>
	
		<?php if((function_exists('has_post_thumbnail')) && (has_post_thumbnail())) : ?>
		
		<?php the_post_thumbnail('post-thumbnail', array('alt' => ''.get_the_title().'', 'title' => ''.get_the_title().'', 'class' => 'article-img')); ?>
		
		<?php elseif(get_post_meta($post->ID, 'image_value', true)) : ?>
		
		<img src="<?php echo TS_SCRIPTS; ?>thumb.php?src=<?php echo ts_image(get_post_meta($post->ID, "image_value", true)); ?>&amp;w=180&amp;h=180&amp;zc=1&amp;q=95" class="article-img" width="180" height="180" alt="<?php the_title(); ?>" />
		
		<?php endif; // endif post thumbnail ?>
	    
	    <h2 class="article-title"><?php the_title(); ?></h2>
	        	
	    <p><span class="article-meta"><?php the_date(); ?> <?php _e('in'); ?> <?php the_category(', '); ?></span></p>
	
	    <?php the_content(); ?>
	    
	    <?php the_tags('<p class="tags">'.__('Tags',TS_DOMAIN).': ', ', ', '</p>'); ?>
	    
	    <?php edit_post_link(__('Edit Post',TS_DOMAIN), '<p>', '</p>'); ?>
	    
	</div>
	
	<?php include( TEMPLATEPATH . '/lib/inc/gallery.php'); ?>
	    
	<?php if(!ts_get_option('ts_auth_dsp')) : ?>
	<div class="box-left box-author clearfix">
	
	    <?php echo get_avatar(get_the_author_email(), '100'); ?>
	    
	    <h3><?php the_author_posts_link(); ?></h3>
	    
	    <p><?php the_author_description(); ?></p>
	
	</div>
	<?php endif; ?>
	
	<?php comments_template('', true); ?>
	
	<?php endwhile; else : ?>
	
	<div class="box-left">
	
	    <h2 class="article-title"><?php _e('Not found!',TS_DOMAIN); ?></h2>
	    <p><?php _e('Sorry, no posts matched your criteria.',TS_DOMAIN); ?></p>
	    <?php include (TEMPLATEPATH . "/searchform.php"); ?>
	
	</div>
	
	<?php endif; ?>

</div><!-- end content-left -->

<?php get_sidebar(); ?>
	
<?php get_footer(); ?>