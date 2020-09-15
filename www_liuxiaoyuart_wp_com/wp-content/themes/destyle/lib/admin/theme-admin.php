<?php

/*	##################################
	TS ADMIN HEAD
	################################## */

if($_REQUEST['page']=='ts-options' || $_REQUEST['page']=='ts-themes' || $_REQUEST['page']=='ts-news') :

	add_action( 'admin_init', 'ts_admin_head' );
	
	function ts_admin_head() {
	
		wp_enqueue_script('media-upload');
		wp_enqueue_script( 'thickbox' );
		wp_enqueue_style( 'thickbox' );
		wp_register_script('ts-upload', TS_ADMIN .'admin-upload.js', array('jquery'));
		wp_enqueue_script('ts-upload');
		wp_register_script('ts-cookie', TS_ADMIN .'admin-cookie.js', array('jquery'));
		wp_enqueue_script('ts-cookie');
		wp_register_script('ts-toggle', TS_ADMIN .'admin-toggle.js', array('jquery'));
		wp_enqueue_script('ts-toggle');	
		wp_enqueue_style('ts-options', TS_ADMIN .'admin-style.css', false, "1.0", "all");
	
	}

endif;


/*	##################################
	TS ADMIN MENU
	################################## */

add_action('admin_menu', 'ts_create_menu');

function ts_create_menu() {

	global $ts_options;
	add_menu_page(TS_THEME.' Theme Settings', TS_THEME, 'administrator', 'ts-options', 'ts_settings_page', TS_ADMIN .'img/ts-admin-icon.png', 61);
	add_submenu_page('ts-options', TS_THEME.' Theme Settings', 'Theme Options', 'administrator', 'ts-options', 'ts_settings_page');
	add_submenu_page('ts-options', 'ThemeShift Themes', 'TS Themes', 'administrator', 'ts-themes', 'ts_themes_page');
	add_submenu_page('ts-options', 'ThemeShift News', 'TS News', 'administrator', 'ts-news', 'ts_news_page');
	
}


/*	##################################
	TS ADMIN DASHBOARD
	################################## */

function ts_dashboard() {

	include_once(ABSPATH . WPINC . '/feed.php');
	$rss = fetch_feed('http://themeshift.com/feed/');
	$maxitems = $rss->get_item_quantity(5); 
	$items = $rss->get_items(0, $maxitems);			
	$i=1; foreach ( $items as $item ) :	
		echo '<p><a href="'.$item->get_permalink().'" class="rsswidget" title="'.$item->get_description().'">'.$item->get_title().'</a></p>';
	$i++; endforeach;

}

function ts_dashboard_setup() {
    wp_add_dashboard_widget( 'ts_dashboard', 'ThemeShift News', 'ts_dashboard' );
}
add_action('wp_dashboard_setup', 'ts_dashboard_setup');

?>