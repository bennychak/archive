<?php
if ( function_exists('register_sidebar') )
    {register_sidebar(array(
        'name'=>'left',
		'before_widget' => '<li>',
        'after_widget' => '</li>',
        'before_title' => '<div class="sidebar_title"><div class="sidebar_title2">',
        'after_title' => '</div></div>',
    ));
	
	register_sidebar(array(
        'name'=>'right_top',
		'before_widget' => '<li>',
        'after_widget' => '</li>',
        'before_title' => '<div class="sidebar_title"><div class="sidebar_title2">',
        'after_title' => '</div></div>',
    ));
	
	register_sidebar(array(
        'name'=>'right_bottom',
		'before_widget' => '<li>',
        'after_widget' => '</li>',
        'before_title' => '<div class="sidebar_title"><div class="sidebar_title2">',
        'after_title' => '</div></div>',
    ));
	
	}
?>
