<div class="navboxwrapright">
<div class="navboxright">

	<?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('right_sidebar') ) : ?>

<h5>Recent Entries</h5>
<ul>
<?php wp_get_archives('type=postbypost&limit=05'); ?>			
</ul>

<h5>Monthly Archives</h5>
<ul>
<?php wp_get_archives('type=monthly&limit=5'); ?>
</ul>	

<?php if ( is_home() | is_archive()) : ?> 
<h5>Favorite Links</h5>
<ul>
<?php wp_list_bookmarks('title_li=&categorize=0'); ?>
</ul>
<?php endif // is_home()  | is_archive() ?>


	<?php endif; ?>

</div>
</div>

