<?php

/** inove options */
class iNoveOptions {

	function getOptions() {
		$options = get_option('inove_options');
		if (!is_array($options)) {
			$options['description'] = '';
			$options['keywords'] = '';
			$options['google_cse'] = false;
			$options['google_cse_cx'] = '';
			$options['menu_type'] = 'pages';
			$options['notice'] = false;
			$options['notice_content'] = '';
			$options['showcase_registered'] = false;
			$options['showcase_commentator'] = false;
			$options['showcase_visitor'] = false;
			$options['showcase_caption'] = false;
			$options['showcase_title'] = '';
			$options['showcase_content'] = '';
			$options['author'] = true;
			$options['categories'] = true;
			$options['tags'] = true;
			$options['feed'] = false;
			$options['feed_url'] = '';
			$options['feed_email'] = false;
			$options['feed_url_email'] = '';
			update_option('inove_options', $options);
		}
		return $options;
	}

	function add() {
		if(isset($_POST['inove_save'])) {
			$options = iNoveOptions::getOptions();

			// meta
			$options['description'] = stripslashes($_POST['description']);
			$options['keywords'] = stripslashes($_POST['keywords']);

			// google custom search engine
			if ($_POST['google_cse']) {
				$options['google_cse'] = (bool)true;
			} else {
				$options['google_cse'] = (bool)false;
			}
			$options['google_cse_cx'] = stripslashes($_POST['google_cse_cx']);

			// menu
			$options['menu_type'] = stripslashes($_POST['menu_type']);

			// notice
			if ($_POST['notice']) {
				$options['notice'] = (bool)true;
			} else {
				$options['notice'] = (bool)false;
			}
			$options['notice_content'] = stripslashes($_POST['notice_content']);

			// showcase
			if (!$_POST['showcase_registered']) {
				$options['showcase_registered'] = (bool)false;
			} else {
				$options['showcase_registered'] = (bool)true;
			}
			if (!$_POST['showcase_commentator']) {
				$options['showcase_commentator'] = (bool)false;
			} else {
				$options['showcase_commentator'] = (bool)true;
			}
			if (!$_POST['showcase_visitor']) {
				$options['showcase_visitor'] = (bool)false;
			} else {
				$options['showcase_visitor'] = (bool)true;
			}
			if ($_POST['showcase_caption']) {
				$options['showcase_caption'] = (bool)true;
			} else {
				$options['showcase_caption'] = (bool)false;
			}
			$options['showcase_title'] = stripslashes($_POST['showcase_title']);
			$options['showcase_content'] = stripslashes($_POST['showcase_content']);

			// author & categories & tags
			if ($_POST['author']) {
				$options['author'] = (bool)true;
			} else {
				$options['author'] = (bool)false;
			}
			if ($_POST['categories']) {
				$options['categories'] = (bool)true;
			} else {
				$options['categories'] = (bool)false;
			}
			if (!$_POST['tags']) {
				$options['tags'] = (bool)false;
			} else {
				$options['tags'] = (bool)true;
			}

			// feed
			if ($_POST['feed']) {
				$options['feed'] = (bool)true;
			} else {
				$options['feed'] = (bool)false;
			}

			// feed
			if ($_POST['feed']) {
				$options['feed'] = (bool)true;
			} else {
				$options['feed'] = (bool)false;
			}
			$options['feed_url'] = stripslashes($_POST['feed_url']);
			if ($_POST['feed_email']) {
				$options['feed_email'] = (bool)true;
			} else {
				$options['feed_email'] = (bool)false;
			}
			$options['feed_url_email'] = stripslashes($_POST['feed_url_email']);

			update_option('inove_options', $options);

		} else {
			iNoveOptions::getOptions();
		}

		add_theme_page(__('Current Theme Options', 'inove'), __('Current Theme Options', 'inove'), 'edit_themes', basename(__FILE__), array('iNoveOptions', 'display'));
	}

	function display() {
		$options = iNoveOptions::getOptions();
?>

<form action="#" method="post" enctype="multipart/form-data" name="inove_form" id="inove_form">
	<div class="wrap">
		<h2><?php _e('Current Theme Options', 'inove'); ?></h2>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e('Meta', 'inove'); ?></th>
					<td>
						<?php _e('Description:', 'inove'); ?>
						<br/>
						<input type="text" name="description" id="description" class="code" style="width:98%;" value="<?php echo($options['description']); ?>">
						<br/>
						<?php _e('Keywords:', 'inove'); ?> <small><?php _e('( Separate keywords with commas )', 'inove'); ?></small>
						<br/>
						<input type="text" name="keywords" id="keywords" class="code" style="width:98%;" value="<?php echo($options['keywords']); ?>">
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e('Search', 'inove'); ?></th>
					<td>
						<label>
							<input name="google_cse" type="checkbox" value="checkbox" <?php if($options['google_cse']) echo "checked='checked'"; ?> />
							 <?php _e('Using google custom search engine.', 'inove'); ?>
						</label>
						<br/>
						<?php _e('CX:', 'inove'); ?>
						 <input type="text" name="google_cse_cx" id="google_cse_cx" class="code" size="40" value="<?php echo($options['google_cse_cx']); ?>">
						<br/>
						<?php _e('Find <code>name="cx"</code> in the <strong>Search box code</strong> of <a href="http://www.google.com/coop/cse/">Google Custom Search Engine</a>, and type the <code>value</code> here.<br/>For example: <code>014782006753236413342:1ltfrybsbz4</code>', 'inove'); ?>
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e('Menubar', 'inove'); ?></th>
					<td>
						<label style="margin-right:20px;">
							<input name="menu_type" type="radio" value="pages" <?php if($options['menu_type'] != 'categories') echo "checked='checked'"; ?> />
							 <?php _e('Show pages as menu.', 'inove'); ?>
						</label>
						<label>
							<input name="menu_type" type="radio" value="categories" <?php if($options['menu_type'] == 'categories') echo "checked='checked'"; ?> />
							 <?php _e('Show categories as menu.', 'inove'); ?>
						</label>
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row">
						<?php _e('Notice', 'inove'); ?>
						<br/>
						<small style="font-weight:normal;"><?php _e('HTML enabled', 'inove'); ?></small>
					</th>
					<td>
						<!-- notice START -->
						<label>
							<input name="notice" type="checkbox" value="checkbox" <?php if($options['notice']) echo "checked='checked'"; ?> />
							 <?php _e('This notice bar will display at the top of posts on homepage.', 'inove'); ?>
						</label>
						<br />
						<label>
							<textarea name="notice_content" id="notice_content" cols="50" rows="10" style="width:98%;font-size:12px;" class="code"><?php echo($options['notice_content']); ?></textarea>
						</label>
						<!-- notice END -->
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row">
						<?php _e('Showcase', 'inove'); ?>
						<br/>
						<small style="font-weight:normal;"><?php _e('HTML enabled', 'inove'); ?></small>
					</th>
					<td>
						<!-- showcase START -->
						<label><?php _e('This showcase will display at the top of sidebar.', 'inove'); ?></label>
						<br/>
						<label><?php _e('Who can see?', 'inove'); ?></label>
						<label style="margin-left:10px;">
							<input name="showcase_registered" type="checkbox" value="checkbox" <?php if($options['showcase_registered']) echo "checked='checked'"; ?> />
							 <?php _e('Registered Users', 'inove'); ?>
						</label>
						<label style="margin-left:10px;">
							<input name="showcase_commentator" type="checkbox" value="checkbox" <?php if($options['showcase_commentator']) echo "checked='checked'"; ?> />
							 <?php _e('Commentator', 'inove'); ?>
						</label>
						<label style="margin-left:10px;">
							<input name="showcase_visitor" type="checkbox" value="checkbox" <?php if($options['showcase_visitor']) echo "checked='checked'"; ?> />
							 <?php _e('Visitors', 'inove'); ?>
						</label>
						<br/>
						<label>
							<input name="showcase_caption" type="checkbox" value="checkbox" <?php if($options['showcase_caption']) echo "checked='checked'"; ?> />
							 <?php _e('Title:', 'inove'); ?>
						</label>
						 <input type="text" name="showcase_title" id="showcase_title" class="code" size="40" value="<?php echo($options['showcase_title']); ?>">
						<br/>
						<label>
							<textarea name="showcase_content" id="showcase_content" cols="50" rows="10" style="width:98%;font-size:12px;" class="code"><?php echo($options['showcase_content']); ?></textarea>
						</label>
						<!-- showcase END -->
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e('Posts'); ?></th>
					<td>
						<label style="margin-right:20px;">
							<input name="author" type="checkbox" value="checkbox" <?php if($options['author']) echo "checked='checked'"; ?> />
							 <?php _e('Show author on posts.', 'inove'); ?>
						</label>
						<label style="margin-right:20px;">
							<input name="categories" type="checkbox" value="checkbox" <?php if($options['categories']) echo "checked='checked'"; ?> />
							 <?php _e('Show categories on posts.', 'inove'); ?>
						</label>
						<label>
							<input name="tags" type="checkbox" value="checkbox" <?php if($options['tags']) echo "checked='checked'"; ?> />
							 <?php _e('Show tags on posts.', 'inove'); ?>
						</label>
					</td>
				</tr>
			</tbody>
		</table>

		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e('Feed', 'inove'); ?></th>
					<td>
						<label>
							<input name="feed" type="checkbox" value="checkbox" <?php if($options['feed']) echo "checked='checked'"; ?> />
							 <?php _e('Custom feed.', 'inove'); ?>
						</label>
						<br/>
						<?php _e('URL:', 'inove'); ?> <input type="text" name="feed_url" id="feed_url" class="code" size="60" value="<?php echo($options['feed_url']); ?>">
						<br/>
						<label>
							<input name="feed_email" type="checkbox" value="checkbox" <?php if($options['feed_email']) echo "checked='checked'"; ?> />
							 <?php _e('Email feed.', 'inove'); ?>
						</label>
						<br/>
						<?php _e('URL:', 'inove'); ?> <input type="text" name="feed_url_email" id="feed_url_email" class="code" size="60" value="<?php echo($options['feed_url_email']); ?>">
					</td>
				</tr>
			</tbody>
		</table>

		<p class="submit">
			<input class="button-primary" type="submit" name="inove_save" value="<?php _e('Save Changes', 'inove'); ?>" />
		</p>
	</div>

</form>

<?php
	}
}

// register functions
add_action('admin_menu', array('iNoveOptions', 'add'));


/** l10n */
function theme_init(){
	load_theme_textdomain('inove', get_template_directory() . '/languages');
}
add_action ('init', 'theme_init');

/** widgets */
if( function_exists('register_sidebar') ) {
	register_sidebar(array(
		'name' => 'sidebar',
		'before_widget' => '<div id="%1$s" class="widget %2$s">',
		'after_widget' => '</div>',
		'before_title' => '<h3>',
		'after_title' => '</h3>'
	));	
}

/** Comments */
if (function_exists('wp_list_comments')) {
	// comment count
	add_filter('get_comments_number', 'comment_count', 0);
	function comment_count( $commentcount ) {
		global $id;
		$_commnets = get_comments('post_id=' . $id);
		$comments_by_type = &separate_comments($_commnets);
		return count($comments_by_type['comment']);
	}
}

// custom comments
function custom_comments($comment, $args, $depth) {
	$GLOBALS['comment'] = $comment;
	global $commentcount;
	if(!$commentcount) {
		$commentcount = 0;
	}
?>
	<li class="comment <?php if($comment->comment_author_email == get_the_author_email()) {echo 'admincomment';} else {echo 'regularcomment';} ?>" id="comment-<?php comment_ID() ?>">
		<div class="author">
			<div class="pic">
				<?php if (function_exists('get_avatar') && get_option('show_avatars')) { echo get_avatar($comment, 32); } ?>
			</div>
			<div class="name">
				<?php if (get_comment_author_url()) : ?>
					<a id="commentauthor-<?php comment_ID() ?>" class="url" href="<?php comment_author_url() ?>" rel="external nofollow">
				<?php else : ?>
					<span id="commentauthor-<?php comment_ID() ?>">
				<?php endif; ?>

				<?php comment_author(); ?>

				<?php if(get_comment_author_url()) : ?>
					</a>
				<?php else : ?>
					</span>
				<?php endif; ?>
			</div>
		</div>

		<div class="info">
			<div class="date">
				<? printf( __('%1$s at %2$s', 'inove'), get_comment_time(__('F jS, Y', 'inove')), get_comment_time(__('H:i', 'inove')) ); ?>
					 | <a href="#comment-<?php comment_ID() ?>"><?php printf('#%1$s', ++$commentcount); ?></a>
			</div>
			<div class="act">
				<a href="javascript:void(0);" onclick="MGJS_CMT.reply('commentauthor-<?php comment_ID() ?>', 'comment-<?php comment_ID() ?>', 'comment');"><?php _e('Reply', 'inove'); ?></a> | 
				<a href="javascript:void(0);" onclick="MGJS_CMT.quote('commentauthor-<?php comment_ID() ?>', 'comment-<?php comment_ID() ?>', 'commentbody-<?php comment_ID() ?>', 'comment');"><?php _e('Quote', 'inove'); ?></a>
				<?php
					if (function_exists("qc_comment_edit_link")) {
						qc_comment_edit_link('', ' | ', '', __('Edit', 'inove'));
					}
					edit_comment_link(__('Advanced edit', 'inove'), ' | ', '');
				?>
			</div>
			<div class="fixed"></div>
			<div class="content">
				<?php if ($comment->comment_approved == '0') : ?>
					<p><small><?php _e('Your comment is awaiting moderation.', 'inove'); ?></small></p>
				<?php endif; ?>

				<div id="commentbody-<?php comment_ID() ?>">
					<?php comment_text(); ?>
				</div>
			</div>
		</div>
		<div class="fixed"></div>
	</li>
<?php
}
?>
