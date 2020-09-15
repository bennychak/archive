<?php get_header(); ?>


<div id="left_side">


<?php if (have_posts()) : ?>
<?php while (have_posts()) : the_post(); ?>

<div class="post">


<div class="mpart">


<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a> </h2>




<div class="entry">
<?php the_content('Read the rest of this entry &raquo;'); ?>	
</div>

 <div class="info"> <span class="time"> <?php the_time('F jS, Y') ?>  </span> <span class="category">  <?php the_category(', ') ?>  <?php the_tags(); ?> </span> <span class="comments">   <?php comments_popup_link('0 Comment', '1 Comment', '% Comments'); ?> </span> 
</div>

</div>
</div>

	<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Next Entries &raquo;') ?></div>
		</div>
		

<?php else : ?>
<div class="mpart">
		<h2>Not Found</h2>
		<p>Sorry, but you are looking for something that isn't here.</p>
		<?php include (TEMPLATEPATH . "/searchform.php"); ?>
</div>
<?php endif; ?>


</div>

<?php get_footer(); ?>