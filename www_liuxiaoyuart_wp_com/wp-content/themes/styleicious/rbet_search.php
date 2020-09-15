<?php if (have_posts()) : ?>

	<h2 class="pagetitle">Search Results</h2>

	<div class="navigation">
		<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
		<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
	</div>


	<?php while (have_posts()) : the_post(); ?>
		
		<div class="post" id="post-<?php the_ID(); ?>">
			<h2 class="post_title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
			
			<div class="post_meta">
				<div class="post_author_date">Published by <b><?php the_author() ?></b> on <b><?php the_time('jS F Y') ?></b></div>
				<div class="post_cat">Filed Under <b><?php the_category(', ') ?></b> <?php edit_post_link(' | Edit', '', ''); ?>	 </div>
			</div>
		</div>
		
	<?php endwhile; ?>

	<div class="navigation">
		<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
		<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
	</div>

<?php else : ?>

	<h2 class="margin_5px">No posts found. Try a different search?</h2>
	<?php include (TEMPLATEPATH . '/searchform.php'); ?>

<?php endif; ?>