<?php
automatic_feed_links();

if ( function_exists('register_sidebar') ) {
	register_sidebar(array(
		'name' => 'Left_Sidebar',
		'before_widget' => '<div class="leftSbTop"></div><div class="leftWidget">',
		'after_widget' => '<div class="newLine"></div></div><!--leftWidget --><div class="leftSbBottom"></div>',
		'before_title' => '<h3 class="widgettitle">',
		'after_title' => '</h3>',
	));
}

?>
