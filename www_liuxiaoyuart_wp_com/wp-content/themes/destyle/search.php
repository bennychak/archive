<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : ?>
	
	<?php // Get number of search results
	    $results = new WP_Query("s=$s&showposts=-1"); 
	    $term = wp_specialchars($s, 1); 
	    $number = $results->post_count;
	    wp_reset_query(); 
	?>
	
	<h1 class="category-title"><?php echo $number; ?> <?php _e('entries found for',TS_DOMAIN); ?> <em><?php echo $term; ?></em></h1>
	
	<?php while (have_posts()) : the_post(); ?>
	    
	<div class="box-left clearfix">
	    
	    <h2 class="article-title"><a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>
	    		
	    <div class="article-meta"><?php the_time(get_option('date_format')); ?> <?php _e('in',TS_DOMAIN); ?> <?php the_category(', '); ?></div>
	
	    <?php the_content('',TRUE); ?>
    			
		<?php the_more(); ?>
	    
	</div><!-- end box-left -->
	
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