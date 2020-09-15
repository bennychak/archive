<?php

/*	##################################
   	REGISTER SIDEBARS
	################################## */

if (function_exists('register_sidebar')) :

	register_sidebar(array(
	'name' => 'General Sidebar',
	'id' => 'sidebar',
	'description' => __('This is the general sidebar that on subpages can be replaced by the sidebars below.', TS_DOMAIN),
	'before_widget' => '<div id="%1$s" class="%2$s box-right clearfix">',
	'after_widget' => '</div>',
	'before_title' => '<h3 class="sidebar-title">',
	'after_title' => '</h3>'));
	
	register_sidebar(array(
	'name' => 'Sidebar Home',
	'id' => 'sidebar-home',
	'description' => __('This is the sidebar that will only be displayed on the home page.', TS_DOMAIN),
	'before_widget' => '<div id="%1$s" class="%2$s box-right clearfix">',
	'after_widget' => '</div>',
	'before_title' => '<h3>',
	'after_title' => '</h3>'));
	
	register_sidebar(array(
	'name' => 'Sidebar Category',
	'id' => 'sidebar-category',
	'description' => __('This is the sidebar that will only be displayed on category pages.', TS_DOMAIN),
	'before_widget' => '<div id="%1$s" class="%2$s box-right clearfix">',
	'after_widget' => '</div>',
	'before_title' => '<h3>',
	'after_title' => '</h3>'));
	
	register_sidebar(array(
	'name' => 'Sidebar Post',
	'id' => 'sidebar-post',
	'description' => __('This is the sidebar that will only be displayed on single post pages.', TS_DOMAIN),
	'before_widget' => '<div id="%1$s" class="%2$s box-right clearfix">',
	'after_widget' => '</div>',
	'before_title' => '<h3>',
	'after_title' => '</h3>'));
	
	register_sidebar(array(
	'name' => 'Sidebar Page',
	'id' => 'sidebar-page',
	'description' => __('This is the sidebar that will only be displayed on static pages.', TS_DOMAIN),
	'before_widget' => '<div id="%1$s" class="%2$s box-right clearfix">',
	'after_widget' => '</div>',
	'before_title' => '<h3>',
	'after_title' => '</h3>'));
        
endif;


/*	##################################
	RECENT POSTS WIDGET
	################################## */

class TS_Recent extends WP_Widget {

	function TS_Recent() {
	
		$widget_ops = array('classname' => 'widget_ts_recent', 'description' => __('Recent posts in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_recent', __(TS_THEME .'  Recent',TS_DOMAIN), $widget_ops);
		$this->alt_option_name = 'widget_recent_entries';

		add_action( 'save_post', array(&$this, 'flush_widget_cache') );
		add_action( 'deleted_post', array(&$this, 'flush_widget_cache') );
		add_action( 'switch_theme', array(&$this, 'flush_widget_cache') );
	}

	function widget($args, $instance) {
		$cache = wp_cache_get('widget_ts_recnet', 'widget');

		if ( !is_array($cache) )
			$cache = array();

		if ( isset($cache[$args['widget_id']]) ) {
			echo $cache[$args['widget_id']];
			return;
		}

		ob_start();
		extract($args);

		$title = apply_filters('widget_title', empty($instance['title']) ? __('Recent Posts',TS_DOMAIN) : $instance['title']);
		if ( !$number = (int) $instance['number'] )
			$number = 10;
		else if ( $number < 1 )
			$number = 1;
		else if ( $number > 15 )
			$number = 15;

		$r = new WP_Query(array('showposts' => $number, 'nopaging' => 0, 'post_status' => 'publish', 'caller_get_posts' => 1));
		if ($r->have_posts()) :
?>
		<?php echo $before_widget; ?>
		<?php if ( $title ) echo $before_title . $title . $after_title; ?>
		<ul>
			<?php  while ($r->have_posts()) : $r->the_post(); ?>
			<li><a href="<?php the_permalink() ?>" title="<?php echo esc_attr(get_the_title() ? get_the_title() : get_the_ID()); ?>"><?php if ( get_the_title() ) the_title(); else the_ID(); ?> </a><br /><span><?php the_time(get_option('date_format')); ?> <?php _e('in',TS_DOMAIN); ?> <?php the_category(', '); ?></span></li>
			<?php endwhile; ?>
		</ul>
		<?php echo $after_widget; ?>
<?php
			wp_reset_query();  // Restore global post data stomped by the_post().
		endif;

		$cache[$args['widget_id']] = ob_get_flush();
		wp_cache_add('widget_ts_recent', $cache, 'widget');
	}

	function update( $new_instance, $old_instance ) {
		$instance = $old_instance;
		$instance['title'] = strip_tags($new_instance['title']);
		$instance['number'] = (int) $new_instance['number'];
		$this->flush_widget_cache();

		$alloptions = wp_cache_get( 'alloptions', 'options' );

		return $instance;
	}

	function flush_widget_cache() {
		wp_cache_delete('widget_ts_recent', 'widget');
	}

	function form( $instance ) {
		$title = esc_attr($instance['title']);
		if ( !$number = (int) $instance['number'] ) $number = 10;
?>
		<p><label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title'); ?>:</label>
		<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo $title; ?>" /></p>

		<p><label for="<?php echo $this->get_field_id('number'); ?>"><?php _e('Number of posts to show:'); ?></label>
		<input id="<?php echo $this->get_field_id('number'); ?>" name="<?php echo $this->get_field_name('number'); ?>" type="text" value="<?php echo $number; ?>" size="3" /><br />
		<small><?php _e('(at most 15)'); ?></small></p>
<?php
	}
}

register_widget('TS_Recent');


/*	##################################
	TWITTER WIDGET
	################################## */

class TS_Twitter extends WP_Widget {
 
	function TS_Twitter() {
        $widget_ops = array('classname' => 'widget_ts_twitter', 'description' => __('Latest tweets in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_twitter', __(TS_THEME .'  Twitter',TS_DOMAIN), $widget_ops);
    
    }
 
    function widget($args, $instance) {        
        extract( $args );
        
        $title	= empty($instance['title']) ? __('Latest Tweets',TS_DOMAIN) : $instance['title'];
        $user	= empty($instance['user']) ? ts_get_option('ts_twitter') : $instance['user'];
        $link	= $instance['twitter_link'] ? '1' : '0';
        $label	= empty($instance['twitter_label']) ? __('More updates on Twitter',TS_DOMAIN) : $instance['twitter_label'];
        if ( !$nr = (int) $instance['twitter_nr'] )
			$nr = 5;
		else if ( $nr < 1 )
			$nr = 1;
		else if ( $nr > 15 )
			$nr = 15;
 
        ?>
			<?php echo $before_widget; ?>
				<?php echo $before_title . $title . $after_title; ?>
				
				<div id="twitter_div">
    				<ul id="twitter_update_list"><li></li></ul>
    			</div>
                  
                <script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>
    			<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/<?php echo $user; ?>.json?callback=twitterCallback2&amp;count=<?php echo $nr; ?>"></script>
                  
                <?php if($link) : ?>
                <p><a href="http://twitter.com/<?php echo $user; ?>" /><?php echo $label; ?></a></p>
                <?php endif; ?>
 
			<?php echo $after_widget; ?>
        <?php
    }

    function update($new_instance, $old_instance) {  
    
    	$instance['title'] = strip_tags($new_instance['title']);
    	$instance['user'] = strip_tags($new_instance['user']);
    	$instance['twitter_link'] = $new_instance['twitter_link'] ? 1 : 0;
    	$instance['twitter_label'] = strip_tags($new_instance['twitter_label']);
    	$instance['twitter_nr'] = (int) $new_instance['twitter_nr'];
                  
        return $new_instance;
    }
 
    function form($instance) {
        
		$instance	= wp_parse_args( (array) $instance, array( 'title' => '', 'user' => '', 'twitter_link' => '', 'twitter_label' => '', 'twitter_nr' => '') );
		$title 		= strip_tags($instance['title']);
		$user		= empty($instance['user']) ? ts_get_option('ts_twitter') : $instance['user'];
		$link 		= strip_tags($instance['twitter_link']);
		$label 		= strip_tags($instance['twitter_label']);
		if (!$nr = (int) $instance['twitter_nr']) $nr = 5;
?>

		<p>
			<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo attribute_escape($title); ?>" />
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('user'); ?>"><?php _e('User'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('user'); ?>" name="<?php echo $this->get_field_name('user'); ?>" type="text" value="<?php echo attribute_escape($user); ?>" />
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('twitter_nr'); ?>"><?php _e('Number of tweets to show',TS_DOMAIN); ?>:</label>
			<input id="<?php echo $this->get_field_id('twitter_nr'); ?>" name="<?php echo $this->get_field_name('twitter_nr'); ?>" type="text" value="<?php echo $nr; ?>" size="3" /><br />
			<small><?php _e('(at most 15)'); ?></small>
		</p>
		
		<p>
			<input type="checkbox" class="checkbox" id="<?php echo $this->get_field_id('twitter_link'); ?>" name="<?php echo $this->get_field_name('twitter_link'); ?>"<?php checked( $link ); ?> />
			<label for="<?php echo $this->get_field_id('twitter_link'); ?>"><?php _e('Show link to Twitter',TS_DOMAIN); ?></label>		
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('twitter_label'); ?>"><?php _e('Link label',TS_DOMAIN); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('twitter_label'); ?>" name="<?php echo $this->get_field_name('twitter_label'); ?>" type="text" value="<?php echo attribute_escape($label); ?>" />
			</label>
		</p>
		
<?php
	}

}
 
register_widget('TS_Twitter');


/*	##################################
	FLICKR WIDGET
	################################## */

class TS_Flickr extends WP_Widget {
 
	function TS_Flickr() {
        $widget_ops = array('classname' => 'widget_ts_flickr', 'description' => __('Flickr badge in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_flickr', __(TS_THEME .'  Flickr',TS_DOMAIN), $widget_ops);
    
    }
 
    function widget($args, $instance) {        
        extract( $args );
        
        $title	= empty($instance['title']) ? __('<strong style="color:#3993ff">flick<span style="color:#ff1c92">r</span></strong> Fotos',TS_DOMAIN) : apply_filters('widget_title', $instance['title']);
        $user	= empty($instance['user']) ? ts_get_option('ts_flickr_id') : $instance['user'];
        
        if ( !$nr = (int) $instance['flickr_nr'] )
			$nr = 6;
		else if ( $nr < 1 )
			$nr = 3;
		else if ( $nr > 15 )
			$nr = 15;
 
        ?>
			<?php echo $before_widget; ?>
				<?php echo $before_title . $title . $after_title; ?>
				
    			<div id="flickr_badge_wrapper" class="clearfix">

    			<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=<?php echo $nr; ?>&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=<?php echo $user; ?>"></script>
    		
    			</div>
 
			<?php echo $after_widget; ?>
        <?php
    }

    function update($new_instance, $old_instance) {  
    
    	$instance['title'] = strip_tags($new_instance['title']);
    	$instance['user'] = strip_tags($new_instance['user']);
    	$instance['flickr_nr'] = (int) $new_instance['flickr_nr'];
                  
        return $new_instance;
    }
 
    function form($instance) {
        
		$instance = wp_parse_args( (array) $instance, array( 'title' => '', 'user' => '', 'flickr_nr' => '') );
		$title = strip_tags($instance['title']);
		$user = empty($instance['user']) ? ts_get_option('ts_flickr_id') : $instance['user'];
		if (!$nr = (int) $instance['flickr_nr']) $nr = 6;
?>

		<p>
			<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo attribute_escape($title); ?>" />
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('user'); ?>"><?php _e('User'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('user'); ?>" name="<?php echo $this->get_field_name('user'); ?>" type="text" value="<?php echo attribute_escape($user); ?>" />
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('flickr_nr'); ?>"><?php _e('Number of fotos to show',TS_DOMAIN); ?>:</label>
			<input id="<?php echo $this->get_field_id('flickr_nr'); ?>" name="<?php echo $this->get_field_name('flickr_nr'); ?>" type="text" value="<?php echo $nr; ?>" size="3" /><br />
			<small><?php _e('(at most 15)'); ?></small>
		</p>
		
<?php
	}

}
 
register_widget('TS_Flickr');


/*	##################################
   	RECENT COMMENTS WIDGET
	################################## */ 
	
class TS_Comments extends WP_Widget {
 
	function TS_Comments() {
        $widget_ops = array('classname' => 'widget_ts_comments', 'description' => __('Recent comments in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_comments', __(TS_THEME .'  Comments',TS_DOMAIN), $widget_ops);
    
    }
 
    function widget($args, $instance) {        
        extract( $args );
        
        $title	= empty($instance['title']) ? __('Recent Comments',TS_DOMAIN) : apply_filters('widget_title', $instance['title']);
        
        if ( !$nr = (int) $instance['comments_nr'] )
			$nr = 5;
		else if ( $nr < 1 )
			$nr = 1;
		else if ( $nr > 15 )
			$nr = 15;
			
		if ( !$exc = (int) $instance['comments_exc'] ) $exc = 75;
 
        ?>
			<?php echo $before_widget; ?>
				<?php echo $before_title . $title . $after_title; ?>
				
				<?php ts_recent_comments($nr,$exc); ?>
 
			<?php echo $after_widget; ?>
        <?php
    }

    function update($new_instance, $old_instance) {  
    
    	$instance['title'] = strip_tags($new_instance['title']);
    	$instance['comments_nr'] = (int) $new_instance['comments_nr'];
    	$instance['comments_exc'] = (int) $new_instance['comments_exc'];
                  
        return $new_instance;
    }
 
    function form($instance) {
        
		$instance = wp_parse_args( (array) $instance, array( 'title' => '', 'comments_nr' => '') );
		$title = strip_tags($instance['title']);
		if (!$nr = (int) $instance['comments_nr']) $nr = 5;
		if (!$exc = (int) $instance['comments_exc']) $exc = 75;
?>

		<p>
			<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo attribute_escape($title); ?>" />
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('comments_nr'); ?>"><?php _e('Number of comments',TS_DOMAIN); ?>:</label>
			<input id="<?php echo $this->get_field_id('comments_nr'); ?>" name="<?php echo $this->get_field_name('comments_nr'); ?>" type="text" value="<?php echo $nr; ?>" size="3" /><br />
			<small><?php _e('(at most 15)'); ?></small>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('comments_exc'); ?>"><?php _e('Length of comment excerpt',TS_DOMAIN); ?>:</label>
			<input id="<?php echo $this->get_field_id('comments_exc'); ?>" name="<?php echo $this->get_field_name('comments_exc'); ?>" type="text" value="<?php echo $exc; ?>" size="3" />
		</p>
		
<?php
	}

}

function ts_recent_comments($rc_count=5, $rc_length=75, $rc_pre='<ul>', $rc_post='</ul>') {

global $wpdb;

$sql = "SELECT DISTINCT ID,
		post_title, post_password, comment_ID, comment_post_ID, comment_author, comment_date_gmt, comment_approved, comment_type, 
		SUBSTRING(comment_content,1,$rc_length) AS com_excerpt 
		FROM $wpdb->comments 
		LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID = $wpdb->posts.ID) 
		WHERE comment_approved = '1' AND comment_type = '' AND post_password = '' 
		ORDER BY comment_date_gmt DESC 
		LIMIT $rc_count";
		
$comments = $wpdb->get_results($sql);

$output = $rc_pre;
foreach ($comments as $comment) {
    $com_length = strlen($comment->com_excerpt);
    if ($com_length < $rc_length) : $rc_dots = ""; else : $rc_dots = "&hellip;"; endif;
    $output .= "\n\t<li class=\"recent-comment\">" . $comment->comment_author . " ".__('on', TS_DOMAIN)." <a href=\"" . get_permalink($comment->ID) . "#comment-" . $comment->comment_ID  . "\" title=\"" . $comment->post_title . "\">" . $comment->post_title . "</a>:<br />" . strip_tags($comment->com_excerpt) . $rc_dots . "</li>";
}
$output .= $rc_post;
    
echo $output;

}

register_widget('TS_Comments');


/*	##################################
	ABOUT WIDGET
	################################## */

class TS_About extends WP_Widget {
 
	function TS_About() {
        $widget_ops = array('classname' => 'widget_ts_about', 'description' => __('About section in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_about', __(TS_THEME .'  About',TS_DOMAIN), $widget_ops);
    
    }
 
    function widget($args, $instance) {        
        extract( $args );
        
        $title	= empty($instance['title']) ? __('About this Site',TS_DOMAIN) : $instance['title'];
        $avatar	= $instance['about_avatar'] ? '1' : '0';
        $text	= empty($instance['about_text']) ? __('Your text about you.',TS_DOMAIN) : $instance['about_text'];
        $link 	= (int) $instance['about_link'];
        $label	= empty($instance['about_label']) ? __('More about us',TS_DOMAIN) : $instance['about_label'];
 
        ?>
			<?php echo $before_widget; ?>
				<?php echo $before_title . $title . $after_title; ?>
				
				<?php if($avatar) : ?>
				<?php echo get_avatar(get_bloginfo('admin_email'),'80', TS_IMG .'default-avatar.png'); ?>
				<?php endif; ?>
				
				<p><?php echo nl2br($text); ?></p>
                  
                <?php if($link) : ?>
                <p><a href="<?php echo get_permalink($link); ?>"><?php echo $label; ?></a></p>
                <?php endif; ?>
 
			<?php echo $after_widget; ?>
        <?php
    }

    function update($new_instance, $old_instance) {  
    
    	$instance['title'] = strip_tags($new_instance['title']);
    	$instance['about_avatar'] = $new_instance['about_avatar'] ? 1 : 0;
    	$instance['about_text'] = strip_tags($new_instance['about_text']);
    	$instance['about_link'] = (int) $new_instance['about_link'];
    	$instance['about_label'] = strip_tags($new_instance['about_label']);
                  
        return $new_instance;
    }
 
    function form($instance) {
        
		$instance	= wp_parse_args( (array) $instance, array( 'title' => '', 'about_avatar' => '', 'about_text' => '', 'about_link' => '', 'about_label' => '') );
		$title 		= strip_tags($instance['title']);
		$avatar 	= (bool) $instance['about_avatar'];
		$text 		= strip_tags($instance['about_text']);
		if (!$link 	= (int) $instance['about_link']) $link = '';
		$label 		= strip_tags($instance['about_label']);
?>

		<p>
			<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title'); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo attribute_escape($title); ?>" />
			</label>
		</p>
		
		<p>
			<input type="checkbox" class="checkbox" id="<?php echo $this->get_field_id('about_avatar'); ?>" name="<?php echo $this->get_field_name('about_avatar'); ?>"<?php checked( $avatar ); ?> />
			<label for="<?php echo $this->get_field_id('about_avatar'); ?>"><?php _e('Show admin\'s avatar',TS_DOMAIN); ?></label>		
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('about_text'); ?>"><?php _e('Text',TS_DOMAIN); ?>:
			<textarea class="widefat" rows="5" cols="20" id="<?php echo $this->get_field_id('about_text'); ?>" name="<?php echo $this->get_field_name('about_text'); ?>"><?php echo attribute_escape($text); ?></textarea>
			</label>
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('about_link'); ?>"><?php _e('Page ID of about link',TS_DOMAIN); ?>:</label>
			<input id="<?php echo $this->get_field_id('about_link'); ?>" name="<?php echo $this->get_field_name('about_link'); ?>" type="text" value="<?php echo $link; ?>" size="3" />
		</p>
		
		<p>
			<label for="<?php echo $this->get_field_id('about_label'); ?>"><?php _e('Link label',TS_DOMAIN); ?>:
			<input class="widefat" id="<?php echo $this->get_field_id('about_label'); ?>" name="<?php echo $this->get_field_name('about_label'); ?>" type="text" value="<?php echo attribute_escape($label); ?>" />
			</label>
		</p>
		
<?php
	}

}
 
register_widget('TS_About');


/*	##################################
	ADS WIDGET
	################################## */

class TS_Ads extends WP_Widget {
 
	function TS_Ads() {
        $widget_ops = array('classname' => 'widget_ts_ads', 'description' => __('Sidebar ads in '. TS_THEME,TS_DOMAIN) );
		$this->WP_Widget('ts_ads', __(TS_THEME .'  Ads',TS_DOMAIN), $widget_ops);
    
    }
 
    function widget($args, $instance) {        
        extract( $args );
 		include( TEMPLATEPATH . '/lib/inc/sidebar-ads.php');        
    }

    function update($new_instance, $old_instance) {       
        return $new_instance;
    }
 
    function form($instance) {
    
?>
		<p><?php _e('There are no options for this widget. Please go to <code>WP-Admin > deStyle > Sidebar Ads</code> for more options.',TS_DOMAIN); ?></p>
		
<?php
	}

}
 
register_widget('TS_Ads');


/*	##################################
	UNREGISTER WIDGETS
	################################## */
	
function unregister_default_wp_widgets() {

    // unregister_widget('WP_Widget_Recent_Posts');
}

add_action('widgets_init', 'unregister_default_wp_widgets', 1);


?>