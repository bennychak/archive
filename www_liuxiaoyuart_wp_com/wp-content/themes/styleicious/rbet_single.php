<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

	<div class="post" id="post-<?php the_ID(); ?>">
		<div class="post_rank"><?php if(function_exists('the_ratings')) { the_ratings(); } ?></div>
		<h2 class="post_title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
		
		<div class="post_meta">
			<div class="post_author_date">Published by <b><?php the_author() ?></b> on <b><?php the_time('jS F Y') ?></b></div>
			<div class="post_cat">Filed Under <b><?php the_category(', ') ?></b> <?php edit_post_link(' | Edit', '', ''); ?>	 </div>
		</div>

		<div class="post_entry">
			<?php the_content('Read the rest of this entry &raquo;'); ?>
		</div>

		<?php the_tags('<div class="postmetadata"><div class="post_tags">Thread Tags: ', ', ', '</div></div>'); ?>
		
		<div class="postmetadata2">
					This entry was posted
					<?php /* This is commented, because it requires a little adjusting sometimes.
						You'll need to download this plugin, and follow the instructions:
						http://binarybonsai.com/archives/2004/08/17/time-since-plugin/ */
						/* $entry_datetime = abs(strtotime($post->post_date) - (60*120)); echo time_since($entry_datetime); echo ' ago'; */ ?>
					on <?php the_time('l, F jS, Y') ?> at <?php the_time() ?>
					and is filed under <?php the_category(', ') ?>.
					You can follow any responses to this entry through the <?php comments_rss_link('RSS 2.0'); ?> feed.

					<?php if (('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
						// Both Comments and Pings are open ?>
						You can <a href="#respond">leave a response</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.

					<?php } elseif (!('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
						// Only Pings are Open ?>
						Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.

					<?php } elseif (('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
						// Comments are open, Pings are not ?>
						You can skip to the end and leave a response. Pinging is currently not allowed.

					<?php } elseif (!('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
						// Neither Comments, nor Pings are open ?>
						Both comments and pings are currently closed.

					<?php } edit_post_link('Edit this entry.','',''); ?>
		</div>
	</div>
	

<?php comments_template(); ?>

<?php endwhile; else: ?>
	<div class="error_msg">
		<h1>404 error</h1>
		<h3>Ooopsie! You just encountered a page that doesn't exist. Click <a href="<?php echo get_option('home'); ?>/">here</a> to return to the blog's main page.</h3>
	</div>
<?php endif; ?>

