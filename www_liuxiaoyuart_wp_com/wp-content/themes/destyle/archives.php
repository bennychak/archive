<?php
$latest = new WP_Query("showposts=20");
if ($latest->have_posts()) : ?>
	
<div class="box-left">

    <h3><?php _e('Latest Posts',TS_DOMAIN); ?></h3>

    <ul>

    	<?php while ($latest->have_posts()) : $latest->the_post(); ?>
    
    		<li><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a> - <?php the_time(get_option('date_format')); ?></li>
    
    	<?php endwhile; ?>

    </ul>

</div>
	
<?php endif; ?>

<div class="box-left">

	<h3><?php _e('Archive by Month',TS_DOMAIN); ?></h3>
				
	<ul>
		<?php wp_get_archives('type=monthly'); ?>
	</ul>

</div>

<div class="box-left">

	<h3><?php _e('Categories',TS_DOMAIN); ?></h3>
			
	<ul>
		<?php wp_list_categories('title_li='); ?>
	</ul>

</div>