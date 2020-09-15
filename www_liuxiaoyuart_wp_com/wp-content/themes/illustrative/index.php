<?php get_header(); ?>
<?php
	if (function_exists('wp_list_comments')) {
		add_filter('get_comments_number', 'comment_count', 0);
	}
?>
  <div id="content">
    <!--LEFT CONTENT STARTS HERE-->
<?php if (have_posts()) : ?>
	<?php while (have_posts()) : the_post(); update_post_caches($posts); ?>
    <div class="post-title">
      <!--CONTENT TOP STARTS-->
      <h2><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>
    </div>
    <!--CONTENT TOP ENDS-->
    <div class="post" id="post-<?php the_ID(); ?>">
			<div class="info">
				<span class="date"><?php the_time(__('F jS, Y', 'illustrative')) ?></span>
				<span class="author"><?php the_author_posts_link(); ?></span>
				<?php edit_post_link(__('Edit', 'illustrative'), '<span class="editpost">', '</span>'); ?>
				<span class="comments"><?php comments_popup_link(__('No comments', 'illustrative'), __('1 comment', 'illustrative'), __('% comments', 'illustrative'), '', __('Comments off', 'illustrative')); ?></span>
				<div class="fixed"></div>
			</div>
      <!--CONTENT MIDDLE STARTS-->
		<?php the_content(__('Read more...', 'illustrative')); ?>
        <div class="fixed"></div>
			<div class="under">
				<span class="categories"><?php _e('Categories: ', 'illustrative'); ?></span><span><?php the_category(', '); ?></span>
				<span class="tags"><?php _e('Tags: ', 'illustrative'); ?></span><span><?php the_tags('', ', ', ''); ?></span>
			</div>
    </div>
    <!--CONTENT MIDDLE ENDS-->
    <div class="post-bottom">
      <!--CONTENT BOTTOM STARTS-->
    </div>
    <!--CONTENT BOTTOM ENDS-->
	<?php endwhile; ?>

<?php else : ?>
    <div class="post-title">
      <!--CONTENT TOP STARTS-->
      <h2><?php _e('Oops, This is error box', 'illustrative'); ?></h2>
    </div>
    <!--CONTENT TOP ENDS-->
    <div class="post">
      <!--CONTENT MIDDLE STARTS-->
		<p><?php _e('Sorry, no posts matched your criteria.', 'illustrative'); ?></p>
    </div>
    <!--CONTENT MIDDLE ENDS-->
    <div class="post-bottom">
      <!--CONTENT BOTTOM STARTS-->
    </div>
    <!--CONTENT BOTTOM ENDS-->
<?php endif; ?>
<div id="pagenavi">
	<?php if(function_exists('wp_pagenavi')) : ?>
		<?php wp_pagenavi() ?>
	<?php else : ?>
		<span class="newer"><?php previous_posts_link(__('Newer Entries', 'inove')); ?></span>
		<span class="older"><?php next_posts_link(__('Older Entries', 'inove')); ?></span>
	<?php endif; ?>
	<div class="fixed"></div>
</div>
  </div>
  <!--LEFT CONTENT ENDS HERE-->
<?php get_sidebar(); ?>
<?php get_footer(); ?>
