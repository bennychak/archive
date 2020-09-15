<?php
if ( function_exists('register_sidebar') )
        register_sidebars(2, array(
        'before_widget' => '<li><div id="%1$s" class="%2$s">',
        'after_widget' => '</div></li>',
        'before_title' => '<h3>',
        'after_title' => '</h3>'
    ));
function widget_mytheme_search() {
?>

<li><div>

<form method="get" action="<?php bloginfo('home'); ?>">
   <input type="text" name="s" id="s" size="16" />
   <input class="searchbutton" type="submit" value="<?php _e('Search'); ?>" />
</form>

</div></li>
<?php
}
if ( function_exists('register_sidebar_widget') )
    register_sidebar_widget(__('Search'), 'widget_mytheme_search');

?>
