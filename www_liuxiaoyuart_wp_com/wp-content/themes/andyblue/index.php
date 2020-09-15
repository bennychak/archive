<?php get_header(); ?>
                           
<?php include (TEMPLATEPATH . '/left-sidebar.php'); ?>
<?php include (TEMPLATEPATH . '/right-sidebar.php'); ?>

<div class="main">
                        
  <?php if (have_posts()) : ?><?php while (have_posts()) : the_post(); ?>

	<h4><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a>	<?php edit_post_link('<img src="'.get_bloginfo(template_directory).'/images/pencil.png" alt="Edit Link" />','<span class="editlink">','</span>'); ?></h4>
<div class="info-post">By <b><?php the_author () ?></b> - <b>Last updated:</b> <?php the_time('l, F j, Y') ?></div>
	<?php the_content('Read the rest of this entry &raquo;'); ?>
   <div class="small box">Filed in <?php the_category(', ') ?> &bull; <?php the_tags('Tags: ',', ',''); ?></div>


	<?php endwhile; ?>

<?php include (TEMPLATEPATH . '/navigation.php'); ?>


	<?php else : ?>



		<h2 class="center">Not Found</h2>

		<p class="center">Sorry, but you are looking for something that isn't here.</p>

	<?php endif; ?>



</div>


<?php get_footer(); ?>

