<?php global $wp_query; if($wp_query->max_num_pages > 1) : ?>
<div id="paging" class="clearfix">

	<?php if(function_exists('wp_pagenavi')) : wp_pagenavi(); else: ?>
	
	<p style="float:left">
	    <?php next_posts_link(__('&laquo; Previous entries',TS_DOMAIN)); ?>
	</p>
	<p style="float:right">
	 	<?php previous_posts_link(__('Next entries &raquo;',TS_DOMAIN)); ?>
	</p>
	
	<?php endif; ?>

</div><!-- end paging -->
<?php endif; ?>