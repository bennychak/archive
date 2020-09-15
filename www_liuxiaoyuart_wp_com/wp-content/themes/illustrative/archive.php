<?php get_header(); ?>
<?php
	if (function_exists('wp_list_comments')) {
		add_filter('get_comments_number', 'comment_count', 0);
	}
?>
  <div id="content">
<?php if (is_search()) : ?>
	<div class="post-title"><h2><?php _e('Search Results', 'illustrative'); ?></h2></div>
	<div class="post"><?php printf( __('Keyword: &#8216;%1$s&#8217;', 'illustrative'), wp_specialchars($s, 1) ); ?></div>
    <div class="post-bottom"></div>

<?php else : ?>
	<div class="post-title"><h2><?php _e('Archive', 'illustrative'); ?></h2></div>
	<div class="post">
		<?php
		// If this is a category archive
		if (is_category()) {
			printf( __('Archive for the &#8216;%1$s&#8217; Category', 'illustrative'), single_cat_title('', false) );
		// If this is a tag archive
		} elseif (is_tag()) {
			printf( __('Posts Tagged &#8216;%1$s&#8217;', 'illustrative'), single_tag_title('', false) );
		// If this is a daily archive
		} elseif (is_day()) {
			printf( __('Archive for %1$s', 'illustrative'), get_the_time(__('F jS, Y', 'illustrative')) );
		// If this is a monthly archive
		} elseif (is_month()) {
			printf( __('Archive for %1$s', 'illustrative'), get_the_time(__('F, Y', 'illustrative')) );
		// If this is a yearly archive
		} elseif (is_year()) {
			printf( __('Archive for %1$s', 'illustrative'), get_the_time(__('Y', 'illustrative')) );
		// If this is an author archive
		} elseif (is_author()) {
			_e('Author Archive', 'illustrative');
		// If this is a paged archive
		} elseif (isset($_GET['paged']) && !empty($_GET['paged'])) {
			_e('Blog Archives', 'illustrative');
		}
		?>
	</div><div class="post-bottom"></div>
<?php endif; ?>

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
		<?php the_excerpt(); ?>
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
		<span class="newer"><?php previous_posts_link(__('Newer Entries', 'illustrative')); ?></span>
		<span class="older"><?php next_posts_link(__('Older Entries', 'illustrative')); ?></span>
	<?php endif; ?>
	<div class="fixed"></div>
</div>
  </div>
  <!--LEFT CONTENT ENDS HERE-->
<?php get_sidebar(); ?>
<?php get_footer(); ?>