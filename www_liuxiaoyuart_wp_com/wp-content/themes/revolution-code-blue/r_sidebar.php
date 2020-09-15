<!-- begin r_sidebar -->

<div id="r_sidebar">

	<ul id="r_sidebarwidgeted">
	<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar(2) ) : else : ?>
	
		<li id="recent-posts">
		<h2>Recent Posts</h2>
			<ul>
				<?php get_archives('postbypost', 5); ?>
			</ul>
		</li>
		
	<?php endif; ?>
	</ul>
			
</div>

<!-- end r_sidebar -->