	<div class="sidebar_h" id="sidebar">
		<ul class="sidebar sideber_right" style="padding:0px;">
		<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('right_top') ) : else : endif; ?>
		<li>
			<div style="text-align:center;">
				<a href="<?php bloginfo('rss2_url'); ?>"><img src="<?php echo get_bloginfo('template_directory'); ?>/images/rss1.jpg" alt="" /></a>
				<a href="<?php bloginfo('comments_rss2_url'); ?>"><img src="<?php echo get_bloginfo('template_directory'); ?>/images/rss2.jpg" alt="" /></a>
			</div>
			<?php
			
			$data=array(
					'title_before'=>'<div class="sidebar_title"><div class="sidebar_title2">',
					'title_after'=>'</div></div>',
					'category_before'=>'',
					'category_after'=>''
					);
			wp_list_bookmarks($data);
			?>
		</li>
		<li class="sidebar_split"></li>
		<?php wp_list_categories('show_count=1&title_li=<div class="sidebar_title"><div class="sidebar_title2">Categories</div></div>'); ?>
		
		<li><?php include (TEMPLATEPATH . '/searchform.php'); ?></li>
		<li class="sidebar_split"></li>
		<li><div class="sidebar_title"><div class="sidebar_title2">Archives</div></div>
			<ul>
				<?php wp_get_archives('type=monthly'); ?>
			</ul>
		</li>
		<li class="sidebar_split"></li>
		<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('right_bottom') ) : else : endif; ?>
		</ul>
		
	</div>
	<div id="ad_bar">
		<ul class="ad_sidebar">
		<?php if ( !function_exists('dynamic_sidebar') ||!dynamic_sidebar('left') ); ?>
		</ul>
	</div>