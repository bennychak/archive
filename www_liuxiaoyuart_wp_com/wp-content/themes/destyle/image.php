<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	    
	    <div class="box-left clearfix">
	    	
	    	<h2 class="article-title"><?php the_title(); ?></h2>
	    			
	    	<div class="article-meta"><?php the_date(); ?> <?php _e('in'); ?> <?php the_category(', '); ?></div>
	    	
	    	<?php if (wp_attachment_is_image($post->id)) {
	    	$att_image = wp_get_attachment_image_src( $post->ID, array(570,570) );
	    	?>
	    	<p class="attachment">
	    		<a href="<?php echo wp_get_attachment_url($post->id); ?>" title="<?php the_title(); ?>">
	    			<img src="<?php echo $att_image[0];?>" width="<?php echo $att_image[1];?>" height="<?php echo $att_image[2];?>"  class="attachment-image" alt="<?php the_title(); ?>" />
	    		</a>
	    	</p>
	    	<?php } ?>
	    
	    </div>
	    
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
	
	    <h2 class="article-title">Not found!</h2>
	    <p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
	    <?php include (TEMPLATEPATH . "/searchform.php"); ?>
	
	</div>
	
	<?php endif; ?>
	
</div><!-- end content-left -->
	  
<?php get_sidebar(); ?>
	
<?php get_footer(); ?>