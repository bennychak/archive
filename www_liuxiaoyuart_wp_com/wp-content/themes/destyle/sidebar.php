<div id="content-right">
	
<?php
	if(is_front_page() && is_active_sidebar('sidebar-home')) : dynamic_sidebar('sidebar-home'); 
    elseif(is_archive() && is_active_sidebar('sidebar-category')) : dynamic_sidebar('sidebar-category');
    elseif(is_single() && is_active_sidebar('sidebar-post')) : dynamic_sidebar('sidebar-post');
    elseif(is_page() && is_active_sidebar('sidebar-page')) : dynamic_sidebar('sidebar-page');
else : ?>

    <?php if (!dynamic_sidebar('sidebar')) : ?>
				
	<?php include(TEMPLATEPATH .'/lib/inc/sidebar-ads.php'); ?>

    <div id="sidebar-recent" class="box-right">
    
    	<h3 class="sidebar-title"><?php _e('最近的文章',TS_DOMAIN); ?></h3>
    	
    	<ul>
    	<?php $recent = new WP_Query("showposts=5"); while($recent->have_posts()) : $recent->the_post();?>
    		<li><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></li>
    	<?php endwhile; ?>
    	</ul>
    
    </div><!-- end box-right -->
    
    <div id="sidebar-search" class="box-right clearfix">
    
    	<h3 class="sidebar-title"><?php _e('站内搜索',TS_DOMAIN); ?></h3>

    	<?php include(TEMPLATEPATH .'/searchform.php'); ?>
    
    </div><!-- end box-right -->
    
    <div id="sidebar-bookmarks">
    
    	<?php wp_list_bookmarks('title_li=&category_before=<div class="box-right">&category_after=</div>&title_before=<h3 class="sidebar-title">&title_after=</h3>'); ?>
    
    </div>
    
    <?php endif; // endif dynamic sidebar ?>
    	
<?php endif; // endif active Sidebar - Home ?>

</div><!-- end content-right -->