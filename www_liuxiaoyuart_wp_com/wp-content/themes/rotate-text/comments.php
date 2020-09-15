<?php // Do not delete these lines
	if ('comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

        if (!empty($post->post_password)) { // if there's a password
            if ($_COOKIE['wp-postpass_' . COOKIEHASH] != $post->post_password) {  // and it doesn't match the cookie
				?>
				
				<p class="nocomments">This post is password protected. Enter the password to view comments.<p>
				
				<?php
				return;
            }
        }

		/* This variable is for alternating comment background */
		$oddcomment = 'alt';
?>

<!-- You can start editing here. -->

<br/>

	<h2 id="comments"><?php comments_number('No Responses', 'One Response', '% Responses' );?> to &#8220;<?php the_title(); ?>&#8221;</h2> 

<ul id="commentlist">
	<?php if ($comments) : ?>
	<?php foreach ($comments as $comment) : ?>

		<li class="<?php echo $oddcomment; ?> comment" id="comment-<?php comment_ID() ?>">
		<strong><?php comment_author_link() ?> <span>[ <?php comment_date('dMy') ?>]</span></strong>


			<?php if ($comment->comment_approved == '0') : ?>
			<em>Your comment is awaiting moderation.</em>
			<?php endif; ?>
			<br/>
		<?php echo get_avatar( $comment, 32 ); ?> 	
			<div class="commentdata"><?php comment_text() ?></div>
			
			<div style="clear:both;">&nbsp; </div>
			
			

		</li>
		
	<?php /* Changes every other comment to a different class */	
		if ('alt' == $oddcomment) $oddcomment = '';
		else $oddcomment = 'alt';
	?>

	<?php endforeach; /* end for each comment */ ?>

	</ul>

<?php else : // this is displayed if there are no comments so far ?>
<?php if ('open' == $post->comment_status) : ?>
<!-- If comments are open, but there are no comments. -->
<div id="hidelist" style="display:none"></div>
</ul>
<p id="nocomment">No comments yet</p>
<?php else : // comments are closed ?>
<!-- If comments are closed. -->
<div style="display:none"></div>
</ul>
<p>Comments are closed.</p>
<?php endif; ?>
<?php endif; ?>


<?php if ('open' == $post->comment_status) : ?>
<div id="loading" style="display: none;">Posting your comment.</div>
<div id="errors"></div>

<br/>

<h2 id="respond">留下一个回复</h2>
<div class="entry">

<?php if ( get_option('comment_registration') && !$user_ID ) : ?>
<p>You must be <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?redirect_to=<?php the_permalink(); ?>">logged in</a> to post a comment.</p>
<?php else : ?>

<form id="commentform" action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" onsubmit="new Ajax.Updater({success: 'commentlist'}, '<?php bloginfo('stylesheet_directory') ?>/comments-ajax.php', {asynchronous: true, evalScripts: true, insertion: Insertion.Bottom, onComplete: function(request){complete(request)}, onFailure: function(request){failure(request)}, onLoading: function(request){loading()}, parameters: Form.serialize(this)}); return false;">

<?php if ( $user_ID ) : ?>

<p>Logged in as <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a>. <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?action=logout" title="Log out of this account">Logout &raquo;</a></p>

<?php else : ?>

<input type="text" name="author" class="input1" id="author" value="<?php echo $comment_author; ?>" size="22" tabindex="1" />
<label for="author"><small>Name <?php if ($req) echo "(required)"; ?></small></label><br/><br/>

<input type="text" name="email" class="input1" id="email" value="<?php echo $comment_author_email; ?>" size="22" tabindex="2" />
<label for="email"><small>Mail (will not be published) <?php if ($req) echo "(required)"; ?></small></label><br/><br/>

<input type="text" name="url" class="input1" id="url" value="<?php echo $comment_author_url; ?>" size="22" tabindex="3" />
<label for="url"><small>Website</small></label><br/><br/>

<?php endif; ?>

<small><strong>XHTML:</strong> You can use these tags: <?php echo allowed_tags(); ?></small><br/><br/>

<textarea name="comment" id="comment" class="input1" cols="75" rows="10" tabindex="4"></textarea><br/><br/>

<input name="submit" type="submit" id="submit" class="button" tabindex="5" value="提交评论" />
<input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
<br/><br/>
<?php do_action('comment_form', $post->ID); ?>

</form>


<?php endif; // If registration required and not logged in ?>

<?php endif; // if you delete this the sky will fall on your head ?>
</div>