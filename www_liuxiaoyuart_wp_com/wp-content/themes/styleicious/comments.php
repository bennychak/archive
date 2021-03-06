<?php // Do not delete these lines
	if ('comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

	if (!empty($post->post_password)) { // if there's a password
		if ($_COOKIE['wp-postpass_' . COOKIEHASH] != $post->post_password) {  // and it doesn't match the cookie
			?><h1>This post is password protected. Enter the password to view comments.</h1><?php
			return;
		}
	}
if ($comments) : ?>

<a name="comments"></a>
<ul class="commentlist"><?php $i=0; foreach ($comments as $comment) : $i++; ?>
	<li id="comment-<?php comment_ID() ?>">
		<div class="post_number">#<?php  echo $i ?></div>
		<div class="comment_meta">Posted by <?php comment_author_link()  ?> on <?php comment_date('F jS, Y') ?> at <?php comment_time() ?> <?php edit_comment_link(' | edit','&nbsp;&nbsp;',''); ?></div>
		<div class="comment_text">
			<div class="comment_c"><div class="comment_c1"></div><div class="comment_c2"></div></div>
			<div class="comment_text_h">
			<div class="alignright">
				<?php echo get_avatar( $comment, 32 ); ?>
			</div>
			<div class="clear"></div>
			<?php comment_text() ?>
			
			</div>
			<div class="comment_c"><div class="comment_c3"></div><div class="comment_c4"></div></div>
		</div>
	</li>
<?php endforeach; /* end for each comment */ ?></ul>

 <?php 
 else :
	if ('open' == $post->comment_status) : else : // comments are closed ?><h2>Comments are closed.</h2><?php endif; endif;
 
 if ('open' == $post->comment_status) :
	if ( get_option('comment_registration') && !$user_ID ) : ?><h2>You must be <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?redirect_to=<?php echo urlencode(get_permalink()); ?>">logged in</a> to post a comment.</h2><?php 
	else : ?>
<a name="respond"></a>
<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform">
	<div class="comment_form_h1">
		<div class="comment_form_c"><div class="comment_form_c1"></div><div class="comment_form_c2"></div></div>
		<div class="comment_form_h2">	
		<?php if ( $user_ID ) : ?><div id="loged_in">Logged in as <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a>. <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?action=logout" title="Log out of this account">Logout &raquo;</a></div><?php else : ?>
		<?php $t='Name'.($req?' (required)':''); ?><input onblur="ch_bg_in(this,false)" style="background:#FFF url(<?php echo get_bloginfo('template_directory'); ?>/images/user2.jpg) 8px no-repeat;" value="<?php echo $t ?>" onfocus="ch_bg_in(this,true);if(this.value=='<?php echo $t ?>')this.value=''" class="comment_form_input" type="text" name="author" id="author" tabindex="1" />
		<?php $t='Mail (will not be published)'.($req?' (required)':''); ?><input onblur="ch_bg_in(this,false)" style="background:#FFF url(<?php echo get_bloginfo('template_directory'); ?>/images/mail.jpg) 8px no-repeat;" value="<?php echo $t ?>" onfocus="ch_bg_in(this,true);if(this.value=='<?php echo $t ?>')this.value=''"class="comment_form_input" type="text" name="email" id="email" tabindex="1" />
		<?php $t='Website Address (Optional)'; ?><input onblur="ch_bg_in(this,false)" style="background:#FFF url(<?php echo get_bloginfo('template_directory'); ?>/images/website.jpg) 8px no-repeat;" value="<?php echo $t; ?>" onfocus="ch_bg_in(this,true);if(this.value=='<?php echo $t; ?>')this.value=''" class="comment_form_input" type="text" name="url" id="url" tabindex="1" /><?php endif; ?>
		<textarea name="comment" id="comment" cols="10" rows="10" class="comment_form_textarea"></textarea>
		<div class="comment_form_submit_h"><input name="submit" type="submit" id="submit" class="comment_form_submit" value=" " /> Share your opinion! Post your thoughts.</div>
		<input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
	</div>
	<div class="comment_form_h3"><div class="comment_form_c3"></div><div class="comment_form_c4"></div></div><?php do_action('comment_form', $post->ID); ?>
	</div>
</form><?php endif; // If registration required and not logged in 
endif; // if you delete this the sky will fall on your head ?>