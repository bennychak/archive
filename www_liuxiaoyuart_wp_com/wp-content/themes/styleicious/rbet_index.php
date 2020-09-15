<?php if (have_posts()) : ?>

	<?php while (have_posts()) : the_post(); ?>
	
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

			<div class="postmetadata">
				<?php the_tags('<div class="post_tags">Thread Tags: ', ', ', '</div>'); ?>
				<div class="post_comments"><?php comments_popup_link('<object><div class="post_com_text">comments</div><div class="post_com_no">0</div></object>', '<object><div class="post_com_text">comment</div><div class="post_com_no">1</div></object>', '<object><div class="post_com_text">comments</div><div class="post_com_no">%</div></object>'); ?></div>
			</div>

		</div>
		
	<?php endwhile; ?>

	<div class="navigation">
		<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
		<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
	</div>

<?php else : ?>

	<h2 class="center">Not Found</h2>
	<p class="center">Sorry, but you are looking for something that isn't here.</p>
	<?php include (TEMPLATEPATH . "/searchform.php"); ?>

<?php endif; ?>