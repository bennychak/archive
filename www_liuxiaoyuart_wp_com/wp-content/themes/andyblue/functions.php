<?php
if ( function_exists('register_sidebar') )
register_sidebar(array('name'=>'left_sidebar',
'before_widget' => '<ul>',
'after_widget' => '</ul>',
'before_title' => '<h5>',
'after_title' => '</h5>',
));
register_sidebar(array('name'=>'right_sidebar',
'before_widget' => '<ul>',
'after_widget' => '</ul>',
'before_title' => '<h5>',
'after_title' => '</h5>',
));
?>