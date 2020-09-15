<?php get_header(); ?>

<div id="mainpage">



<?php get_sidebar(); ?>



<div id="contentpage">

<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

<div class="postpage" id="post-<?php the_ID(); ?>">

<h2 class="storytitle"><?php the_title(); ?></h2>

<div class="storycontent"><?php the_content(__('(more...)')); ?></div>

</div>

<?php endwhile; else: ?>
<p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
<?php endif; ?>

<?php posts_nav_link(' &#8212; ', __('&laquo; Newer Posts'), __('Older Posts &raquo;')); ?>

</div>



</div>


<?php get_footer(); ?>
