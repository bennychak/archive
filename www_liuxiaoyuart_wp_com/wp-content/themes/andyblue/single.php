<?php get_header(); ?>
<?php include (TEMPLATEPATH . '/left-sidebar.php'); ?>
<?php include (TEMPLATEPATH . '/right-sidebar.php'); ?>
<div class="main">
<?php if (have_posts()) : ?><?php while (have_posts()) : the_post(); ?>
<div class="post-navigation">
			<div class="alignleft"><?php previous_post_link('&laquo; %link') ?></div>
			<div class="alignright"><?php next_post_link('%link &raquo;') ?></div>
</div>	
	<h4><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a> 
	<?php edit_post_link('<img src="'.get_bloginfo(template_directory).'/images/pencil.png" alt="Edit Link" />','<span class="editlink">','</span>'); ?></h4>
	<div class="info-post">By <b><?php the_author () ?></b> - <b>Last updated:</b> <?php the_time('l, F j, Y') ?> - <a class="a2a_dd" style="font-size: 10px;font-weight:bold;" href="http://www.addtoany.com/share_save">Save & Share</a><script type="text/javascript">a2a_linkname=document.title;a2a_linkurl=location.href;</script><script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script> - <a style="font-size: 10px;font-weight:bold;" href="#respond"><?php comments_number(__('Leave a Comment','arthemia'), __('One Comment','arthemia'), __('% Comments','arthemia') );?></a></div>
	<?php the_content('Read the rest of this entry &raquo;'); ?>
	<?php wp_link_pages(array('before' => __('<p><strong>Pages:</strong>','arthemia'), 'after' => '</p>', 'next_or_number' => 'number')); ?>
		<div class="small box">
	Posted in <?php the_category(', ') ?> &bull; <?php the_tags('Tags: ',', ',''); ?> &bull; <a href="#" title="Top Of Page"/>Top Of Page</a> 
    </div>

	<p><?php comments_template(); ?></p>
	<?php endwhile; ?>

	<?php else : ?>

	<h2 class="center">Not Found</h2>
	<p class="center">Sorry, but you are looking for something that isn't here.</p>

	<?php endif; ?>
</div>

<?php get_footer(); ?>

