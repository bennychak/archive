<?php

/*	##################################
	SETTINGS
	################################## */

define('TS_THEME', 'deStyle');
define('TS_DOMAIN', 'destyle');
define('TS_SHORT', 'ds');
define('TS_VERSION', '0.9.2');
define('TS_IMG', get_bloginfo('template_url').'/img/');
define('TS_ADMIN', get_bloginfo('template_url') .'/lib/admin/');
define('TS_SCRIPTS', get_bloginfo('template_url') .'/lib/scripts/');


/*	##################################
   	INIT LOCALIZATION
	################################## */

load_theme_textdomain('destyle',TEMPLATEPATH . '/lang');


/*	##################################
   	GET THEME OPTIONS
	################################## */
	
function ts_get_option($key) {
	
	global $ts_options;	
	$ts_options = get_option('ts_options');
	
	$ts_defaults = array(
		'ts_color' => 'blue',
		'ts_bg' => 'noise',
		'ts_logo' => get_bloginfo('template_url').'/img/logo.png',
		'ts_rss' => get_bloginfo('rss2_url')
	);
	
	foreach($ts_defaults as $k=>$v) {
		if (!$ts_options[$k])
			$ts_options[$k] = $ts_defaults[$k];
	}
	
	return $ts_options[$key];
}


/*	##################################
	THEME SUPPORT
	################################## */

add_theme_support('menus');

if (function_exists('register_nav_menu')) {
	register_nav_menu('top', __('Top Menu', TS_DOMAIN));
	register_nav_menu('main', __('Main Menu', TS_DOMAIN));
}

if (function_exists('add_custom_background')) {
	add_custom_background();
}

if (function_exists('add_theme_support')) {
	add_theme_support('post-thumbnails');
	// Default thumbnail size
	set_post_thumbnail_size(180, 180, true);
}


/*	##################################
   	ADD COLOR SCHEME (BODY CLASS)
	################################## */

add_filter('body_class','ts_body_classes');
	
function ts_body_classes($classes) {
	$classes[] = ts_get_option('ts_bg');
	$ts_color = $_COOKIE['ts-style'] ? $_COOKIE['ts-style'] : ts_get_option('ts_color');
	$classes[] = $ts_color;
    return $classes;
}


/*	##################################
   	POST CLASS
	################################## */

add_filter('post_class','ts_post_class');
function ts_post_class($classes) {
	$classes[] = 'box-left';
	$classes[] = 'clearfix';
	return $classes;
}


/*	##################################
	TIMTHUMB (incl. WPMU SUPPORT)
	################################## */

function ts_image($ts_image_url) {
    global $blog_id, $wpmu_version;
    if(isset($wpmu_version)) {
        if (isset($blog_id) && $blog_id > 0) {
            $ts_image_parts = explode('/files/', $ts_image_url);
            if (isset($ts_image_parts[1])) {
                $ts_image_src = '/blogs.dir/' . $blog_id . '/files/' . $ts_image_parts[1];
                return $ts_image_src;
            } else
                return $ts_image_url;
        }
    } else {
        return $ts_image_url;
    }
}


/*	##################################
   	TS THEME HEADER
	################################## */
	
add_action('wp_enqueue_scripts', 'ts_scripts');

function ts_scripts() {

	wp_enqueue_script('jquery');
	
	wp_enqueue_script('superfish', TS_SCRIPTS . 'superfish/superfish.js', array('jquery'), '1.4.8', true);
	wp_enqueue_script('supersubs', TS_SCRIPTS . 'superfish/supersubs.js', array('jquery'), '1.4.8', true);
	wp_enqueue_style('superfish', TS_SCRIPTS . 'superfish/superfish.css', false, '1.4.8', 'all' );
	
	if (is_singular()) wp_enqueue_script('comment-reply');
	
	wp_enqueue_script('prettyPhoto', TS_SCRIPTS . 'pretty/js/jquery.prettyPhoto.js', array('jquery'), '2.5.6', true);
	wp_enqueue_style('pretty', TS_SCRIPTS . 'pretty/css/prettyPhoto.css', false, '1', 'all' );
	
	wp_enqueue_script('cookies', TS_ADMIN . 'admin-cookie.js', array('jquery'), '0.9.2', true);
	wp_enqueue_script('style', TS_SCRIPTS . 'styleswitcher.js', array('jquery'), '0.9.2', true);
	
}

add_filter('the_generator', 'ts_theme_generator');

function ts_theme_generator($generator) {
	$generator .= "\r\n" . '<meta name="generator" content="'.TS_THEME.' '.TS_VERSION.'" />';
	return $generator;
}

add_action('wp_head','ts_theme_head');

function ts_theme_head() { ?>
<?php if(ts_get_option('ts_css')) : ?>

<style type="text/css" media="screen">
<?php echo ts_get_option('ts_css'); ?>

</style><?php echo "\n"; endif; ?>

<!--[if IE 7]>
<link href="<?php echo TS_SCRIPTS; ?>admin/ie.css" rel="stylesheet" type="text/css">
<![endif]-->

<?php }

add_action('wp_footer','ts_theme_footer');

function ts_theme_footer() {

	include(TEMPLATEPATH . '/lib/scripts/validate-search.php');
	if (is_singular()) include(TEMPLATEPATH . '/lib/scripts/validate-comments.php');
	echo "\n".ts_get_option('ts_tracking')."\n";

}


/*	##################################
   	CUSTOM MORE LINK
	################################## */

function the_more() {
	global $post;
	if (strpos($post->post_content, '<!--more-->')) :
	        $the_more = '<p><a href="'.get_permalink().'"  class="read-more" title="'.get_the_title().'">';
	        $the_more .= __('Read more',TS_DOMAIN);
	        $the_more .= '</a> &rarr;</p>';
	        echo $the_more;
	endif;
}


/*  ##################################
    BUTTON SHORTCODE
    ################################## */

function ts_btn($atts) {
    extract(shortcode_atts(array(
        'label'     => 'Your Linktext',
        'id'     => '1',
        'url'    => '',
        'p'        => 'true',
        'size'    => '',
        'color' => '',
        'target'    => ''
    ), $atts));
    
    $link = $url ? $url : get_permalink($id);
    if($target=='_blank') : $target='target="_blank"'; elseif($target=='lightbox') : $target='rel="prettyPhoto"'; else : $target=''; endif;
    
    if($p!='false') :
    	return wpautop('<a href="'.$link.'" class="btn" '.$target.'>'.$label.'</a>');
    else :
    	return '<a href="'.$link.'" class="btn" '.$target.'>'.$label.'</a>';
    endif;
}

add_shortcode('btn', 'ts_btn');


/*	##################################
   	DESTYLE COMMENTS / PINGS
	################################## */

function destyle_comments($comment, $args, $depth) {
	$GLOBALS['comment'] = $comment; ?>
	<li <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>">
		<div id="comment-<?php comment_ID() ?>">
   	   		<div class="comment-author vcard">
   	   			<p><?php echo get_avatar($comment,$size='40'); ?><?php printf(__('<span class="fn">%s</span>'), get_comment_author_link()) ?> <a href="<?php echo htmlspecialchars( get_comment_link( $comment->comment_ID ) ) ?>">#</a><?php edit_comment_link(__('(Edit)'),'  ','') ?></p>
   	   		</div>
			<?php if ($comment->comment_approved == '0') : ?>
			<p class="moderation"><?php _e('Your comment is awaiting moderation.',TS_DOMAIN) ?></p>
			<?php endif; ?>
			<?php comment_text() ?>
			<div class="reply">
				<?php comment_reply_link(array_merge( $args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
			</div>
		</div>
<?php

}

function destyle_pings($comment, $args, $depth) {
   $GLOBALS['comment'] = $comment; ?>
   <li <?php comment_class(); ?> id="comment-<?php comment_ID() ?>"><?php comment_author_link(); ?> - <?php comment_excerpt(); ?>
<?php

}


/*	##################################
	MULTISITE SIGNUP
	################################## */

add_action('before_signup_form', 'ts_before_signup');
function ts_before_signup() {
	echo '<div id="content-left">';
}

add_action('after_signup_form', 'ts_after_signup');
function ts_after_signup() {
	echo '</div><!-- end content-left -->';
	get_sidebar();
}


/*	##################################
	MENU FALLBACK
	################################## */
	
function ts_menu() {
	$ts_menu = '<div class="ts-menu-main"><ul class="sf-menu">';
	if(!ts_get_option('ts_ex_home')) :
		if(is_front_page()) $current = ' class="current"';
		$ts_menu .= '<li'.$current.'><a href="'.get_bloginfo('url').'">'.__('Home', TS_DOMAIN).'</a></li>';
	endif;
	if(is_single()) :
		$category = get_the_category(); 
		$current_cat = $category[0]->cat_ID;
	else :
		$current_cat = '';
	endif;
	$ex_cats = ts_get_option('ts_ex_cats');
	$ts_menu .= wp_list_categories('title_li=&current_category='.$current_cat.'&exclude='.$ex_cats.'&orderby=ID&echo=0');
	$ts_menu .= '</ul></div>';
	echo $ts_menu;	
}

function ts_top() {
	$ts_menu = '<div class="ts-menu-top"><ul class="sf-menu">';
	$ex_pages = ts_get_option('ts_ex_pages');
	$ts_menu .= wp_list_pages('title_li=&sort_column=menu_order&exclude='.$ex_pages.'&echo=0');
	$ts_menu .= '</ul></div>';
	echo $ts_menu;	
}


/*	##################################
	REMOVE
	################################## */

// #more from more-link
add_filter('the_content', 'ts_less');
function ts_less($content) {
	global $id;
	return str_replace('#more-'.$id.'"', '"', $content);
}

// default css for wp-pagenavi
add_action( 'wp_print_styles', 'ts_deregister_styles', 100 );
function ts_deregister_styles() {
	wp_deregister_style('wp-pagenavi');
	wp_deregister_style('contact-form-7');
}

// 'no categories' from menu
add_filter('wp_list_categories','ts_hide_no_cats');
function ts_hide_no_cats($ts_cats) {
  if (!empty($ts_cats)) {
    $ts_cats = str_replace('<li>' .__( "No categories" ). '</li>', '', $ts_cats);
  }
  return $ts_cats;
}

// recent comments widget inline CSS
add_action( 'widgets_init', 'my_remove_recent_comments_style' );
function my_remove_recent_comments_style() {
	global $wp_widget_factory;
	remove_action( 'wp_head', array( $wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style'  ) );
}


/*	##################################
   	OPTIONS / ADMIN / META BOX
	################################## */

require_once( TEMPLATEPATH . '/lib/admin/theme-options.php');
require_once( TEMPLATEPATH . '/lib/admin/widgets.php');

		
?>