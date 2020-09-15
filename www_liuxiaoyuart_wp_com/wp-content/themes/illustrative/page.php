<?php get_header(); ?>
  <div id="content">
    <!--LEFT CONTENT STARTS HERE-->
<?php if (have_posts()) : the_post(); update_post_caches($posts); ?>
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
			<?php if ($comments || comments_open()) : ?>
				<span class="addcomment"><a href="#respond"><?php _e('Leave a comment', 'illustrative'); ?></a></span>
				<span class="comments"><a href="#commentlist"><?php _e('Go to comments', 'illustrative'); ?></a></span>
			<?php endif; ?>
			<div class="fixed"></div>
		</div>
      <!--CONTENT MIDDLE STARTS-->
		<?php the_content(); ?>
    </div>
    <!--CONTENT MIDDLE ENDS-->
    <div class="post-bottom">
      <!--CONTENT BOTTOM STARTS-->
    </div>
    <!--CONTENT BOTTOM ENDS-->
<?php
	if (function_exists('wp_list_comments')) {
		comments_template('', true);
	} else {
		comments_template();
	}
?>
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
  </div>
  <!--LEFT CONTENT ENDS HERE-->
<?php get_sidebar(); ?>
<?php get_footer(); ?>