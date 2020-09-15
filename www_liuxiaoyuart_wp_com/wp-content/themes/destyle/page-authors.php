<?php /*
Template Name: Authors
*/ ?>

<?php get_header(); ?>

<div id="content-left">

	<?php if (have_posts()) : the_post(); ?>
		
	<h2 class="article-title"><?php the_title(); ?></h2>
	
	<div class="box-left">
	
	    <?php the_content(); ?>
	    
	    <?php edit_post_link(__('Edit Page',TS_DOMAIN), '<p>', '</p>'); ?>
	
	</div>
	    
	<?php global $wpdb;
	$query = "SELECT ID, user_nicename from $wpdb->users ORDER BY user_nicename";
	$author_ids = $wpdb->get_results($query);
	foreach($author_ids as $author) :
	    $curauth = get_userdata($author->ID);
	    if($curauth->user_level > 0 || $curauth->user_login == 'admin') :
	    $user_link = get_author_posts_url($curauth->ID);
	?>
	
	<div class="box-left box-author clearfix">
	
	    <a href="<?php echo $user_link; ?>" title="<?php echo $curauth->display_name; ?>">
	    	<?php echo get_avatar($curauth->user_email, '100'); ?>
	    </a>
	    
	    <h3><a href="<?php echo $user_link; ?>" title="<?php echo $curauth->display_name; ?>">
	    	<?php echo $curauth->display_name; ?></a></h3>
	    
	    <p><?php echo $curauth->description; ?></p>
	
	</div>
	
	<?php endif; endforeach; ?>
	
	<?php endif; ?>
	
</div><!-- end content-left -->

<?php get_sidebar(); ?>
	
<?php get_footer(); ?>