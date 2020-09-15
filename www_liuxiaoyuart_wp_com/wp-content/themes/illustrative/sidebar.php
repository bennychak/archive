  <div id="sidebar">
    <!--CONTENT RIGHT STARTS HERE-->
<?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('sidebar') ) : ?>
	<?php
		if (is_single()) {
			$posts_widget_title = 'Recent Posts';
			$posts_widget_title2 = 'Archives';
		} else {
			$posts_widget_title = 'Random Posts';
			$posts_widget_title2 = 'Categories';
		}
	?>
    <div class="widget-title">
      <!--POST TITLE-->
      <h3><?php echo $posts_widget_title; ?></h3>
    </div>
    <!--POST TITLE ENDS-->
    <div class="widget">
      <!--POST CONTENT STARTS-->
		<ul>
			<?php
				if (is_single()) {
					$posts = get_posts('numberposts=10&orderby=post_date');
				} else {
					$posts = get_posts('numberposts=5&orderby=rand');
				}
				foreach($posts as $post) {
					setup_postdata($post);
					echo '<li><a href="' . get_permalink() . '">' . get_the_title() . '</a></li>';
				}
				$post = $posts[0];
			?>
		</ul>
    </div>
    <!--POST CONTENT ENDS-->
    <div class="widget-bottom">
      <!--SIDEBAR BOTTOM STARTS-->
    </div>
    <!--SIDEBAR BOTTOM ENDS-->
<?php if (!is_single()) : ?>
    <div id="tag_cloud"><div class="widget-title">
      <!--TAG TITLE STARTS-->
      <h3>Tag Cloud</h3>
    </div>
    <!--TAG TITLE ENDS-->
    <div class="widget">
      <!--TAG CONTENT STARTS-->
		<?php wp_tag_cloud('smallest=8&largest=16'); ?>
    </div>
    <!--TAG CONTENTS ENDS-->
    <div class="widget-bottom">
      <!--SIDEBAR BOTTOM STARTS-->
    </div></div>
<?php endif; ?>
    <!--SIDEBAR BOTTOM ENDS-->
    <div class="widget-title">
      <!--ARCHIVE TITLE STARTS-->
      <h3><?php echo $posts_widget_title2; ?></h3>
    </div>
    <!--ARCHIVE TITLE ENDS-->
    <div class="widget">
      <!--ARCHIVE CONTENT STARTS-->
		<ul>
			<?php
				if (is_single()) {
					wp_get_archives('type=monthly');
				} else {
					wp_list_cats('sort_column=name&optioncount=0&depth=1');
				}
			?>
		</ul>
    </div>
    <!--ARCHIVE CONTENT ENDS-->
    <div class="widget-bottom">
      <!--SIDEBAR BOTTOM STARTS-->
    </div>
    <!--SIDEBAR BOTTOM ENDS-->
    <div class="widget-title">
      <!--BLOGROLL TITLE STARTS-->
      <h3>Blogroll</h3>
    </div>
    <!--BLOGROLL TITLE ENDS-->
    <div class="widget">
      <!--BLOGROLL CONTENT STARTS-->
			<ul>
				<?php wp_list_bookmarks('title_li=&categorize=0'); ?>
			</ul>
    </div>
    <!--BLOGROLL CONTENT ENDS-->
    <div class="widget-bottom">
      <!--SIDEBAR BOTTOM STARTS-->
    </div>
    <!--SIDEBAR BOTTOM ENDS-->
    <div class="widget-title">
      <!--META TITLE STARTS-->
      <h3>Meta</h3>
    </div>
    <!--META TITLE ENDS-->
    <div class="widget">
      <!--META CONTENT STARTS-->
		<ul>
			<?php wp_register(); ?>
			<li><?php wp_loginout(); ?></li>
		</ul>
    </div>
    <!--META CONTENT ENDS-->
    <div class="widget-bottom">
      <!--SIDEBAR BOTTOM STARTS-->
    </div>
    <!--SIDEBAR BOTTOM ENDS-->
<?php endif; ?>
  </div>
  <!--CONTENT RIGHT ENDS HERE-->