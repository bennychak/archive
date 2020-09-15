<?php // Do not delete these lines
	if (isset($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

	if (!empty($post->post_password)) { // if there's a password
		if ($_COOKIE['wp-postpass_' . COOKIEHASH] != $post->post_password) {  // and it doesn't match the cookie
			?>

			<p class="nocomments"><?php _e('Enter your password to view comments.',TS_DOMAIN); ?></p>

			<?php
			return;
		}
	}

	/* This variable is for alternating comment background */
	$oddcomment = ' alt';
?>

<!-- You can start editing here. -->

<?php if(have_comments()) : ?>

<?php $comments_count = count($comments_by_type['comment']); ?>
<?php $trackbacks_count = count($comments_by_type['pings']); ?>

<div class="box-left box-comments clearfix">

	<h3 class="content-title" id="comments"><?php comments_number(__('No Comments',TS_DOMAIN), __('1 Comment',TS_DOMAIN), $comments_count.' '.__('Comments',TS_DOMAIN)); ?> <small>&rsaquo; <a href="#respond"><?php _e('Leave yours',TS_DOMAIN); ?></a></small></h3>
	
	<div class="comments-paging"><?php paginate_comments_links(); ?></div>

	<?php if(!empty($comments_by_type['comment'])) : ?>
	<div class="commentlist">
		<ol>
			<?php wp_list_comments('type=comment&callback=destyle_comments'); ?>
		</ol>
	</div>
	<?php endif; ?>
	
	<?php if(!empty($comments_by_type['pings'])) : ?>
	<div class="trackbacklist">
		<h3 class="content-title"><?php echo $trackbacks_count; ?> <?php _e('Trackbacks',TS_DOMAIN); ?></h3>
		<ul>
			<?php wp_list_comments('type=pings&callback=destyle_pings'); ?>
		</ul>
	</div>
	<?php endif; ?>
	
</div><!-- end box-left -->

<?php else : // this is displayed if there are no comments so far ?>

	<?php if ('open' == $post->comment_status) : ?>
	
		<!-- No comments yet -->
		
	<?php endif; ?>

<?php endif; // endif comments ?>

<?php if ('open' == $post->comment_status) : ?>

<div id="respond" class="box-left">

<h3 class="content-title"><?php comment_form_title(__('留下一个回复',TS_DOMAIN), __('留下一个回复 to %s',TS_DOMAIN)); ?></h3>

<?php if ( get_option('comment_registration') && !$user_ID ) : ?>
<div class="info">
	<?php _e('Users must be registered and logged in to comment.',TS_DOMAIN); ?><br />
	<?php printf(__('<a href="%s">Log in to Reply</a>',TS_DOMAIN), get_option('siteurl')."/wp-login.php?redirect_to=".urlencode(get_permalink()));?>
</div>
<?php else : ?>

<div id="cancel-comment-reply">
	<?php cancel_comment_reply_link(__('Cancel reply',TS_DOMAIN)) ?>
</div>

<div id="commentform">

<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post">

<?php if ( $user_ID ) : ?>
<p><?php printf(__('Logged in as %s',TS_DOMAIN), '<a href="'.get_option('siteurl').'/wp-admin/profile.php">'.$user_identity.'</a>'); ?> <a href="<?php echo wp_logout_url(get_permalink()); ?>" title="<?php _e('Log out',TS_DOMAIN); ?> &raquo;"><?php _e('Log out',TS_DOMAIN); ?> &raquo;</a></p>

<?php else : ?>

<p>
	<label for="name"><?php _e('名字',TS_DOMAIN); ?> <?php if ($req) _e('(必需)',TS_DOMAIN); ?></label><br />
	<input type="text" name="author" id="name" class="text required" value="<?php echo $comment_author; ?>" size="22" tabindex="1" defaultvalue="<?php _e('名字', TS_DOMAIN); ?>..." />
</p>

<p>
	<label for="email"><?php _e('E-mail地址(不会被公开)',TS_DOMAIN);?> <?php if ($req) _e('(必需)',TS_DOMAIN); ?></label><br />
	<input type="text" name="email" id="email" class="text required" value="<?php echo $comment_author_email; ?>" size="22" tabindex="2" defaultvalue="<?php _e('您的邮箱', TS_DOMAIN); ?>..." />
</p>

<p>
	<label for="website"><?php _e('您的网站地址',TS_DOMAIN); ?></label><br />
	<input type="text" name="url" id="website" class="text" value="<?php echo $comment_author_url; ?>" size="22" tabindex="3" defaultvalue="<?php _e('您的网站', TS_DOMAIN); ?>..." />
</p>

<?php endif; ?>

<p>
	<label for="message"><?php _e('留言',TS_DOMAIN); ?></label><br />
	<textarea name="comment" id="message" class="required" tabindex="4" cols="4" rows="10" defaultvalue="<?php _e('您的留言', TS_DOMAIN); ?>..."></textarea>
</p>

<p><input name="submit" type="submit" class="button" tabindex="5" value="<?php echo attribute_escape(__('提交评论',TS_DOMAIN)); ?>" /></p>

<?php comment_id_fields(); ?>

<?php do_action('comment_form', $post->ID); ?>

</form>

</div><!-- end commentform -->

<?php endif; // If registration required and not logged in ?>

</div><!-- end respond -->

<?php endif; // if you delete this the sky will fall on your head ?>