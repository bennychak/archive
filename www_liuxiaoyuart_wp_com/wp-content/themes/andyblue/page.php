<?php get_header(); ?>

<?php include (TEMPLATEPATH . '/left-sidebar.php'); ?>
<?php include (TEMPLATEPATH . '/right-sidebar.php'); ?>

<div class="main">

	<?php if (have_posts()) : ?><?php while (have_posts()) : the_post(); ?>

	<h4><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a>
	<?php edit_post_link('<img src="'.get_bloginfo(template_directory).'/images/pencil.png" alt="Edit Link" />','<span class="editlink">','</span>'); ?></h4><br/> 
	<?php the_content('Read the rest of this entry &raquo;'); ?>

	<?php endwhile; endif; ?>
	
</div>

<?php get_footer(); ?>
