		<div id="rightSidebar" class="alignleft">
		
			<?php include(TEMPLATEPATH."/search_form.php");?>
		
			<div class="rightWidget">
				<span class="widgetIcon"></span>
				<h3 class="roundedCorner">Recent Posts</h3>
				<?php query_posts("posts_per_page=5");?>
				<?php if(have_posts()): while(have_posts()): the_post();?>
				
					<h4><a href="<?php the_permalink();?>"><?php the_title();?></a></h4>
					<span class="categories newLine">Categories: <?php the_category(", ");?></span>
					<span class="tags">Tags: <?php the_tags(" ");?></span>
			
				<?php endwhile;?>
				<?php endif;?>
			</div><!-- rightWidget -->
		<div class="rightWidget">
				<span class="widgetIcon"></span>
				<h3 class="roundedCorner">Recent Comments</h3>
			<?php
global $wpdb;
$sql = "SELECT DISTINCT ID, post_title, post_password, comment_ID,
comment_post_ID, comment_author, comment_date_gmt, comment_approved,
comment_type,comment_author_url,
SUBSTRING(comment_content,1,30) AS com_excerpt
FROM $wpdb->comments
LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID =
$wpdb->posts.ID)
WHERE comment_approved = '1' AND comment_type = '' AND
post_password = ''
ORDER BY comment_date_gmt DESC
LIMIT 5";
$comments = $wpdb->get_results($sql);
$output = $pre_HTML;
$output .= "\n<ul>";
foreach ($comments as $comment) {
$output .= "\n<li class='recentcomments'>".strip_tags($comment->comment_author)
. " on:<br/><span class=\"rec-com-post\"> <a href=\"" . get_permalink($comment->comment_post_ID) .
 "\" title=\"on " . $comment->post_title . "\">" . $comment->post_title . "</a></span><br/>Said: <a href=\"" . get_permalink($comment->ID) .
"#comment-" . $comment->comment_ID . "\" title=\"on " . $comment->post_title . "\">" . strip_tags($comment->com_excerpt)
."</a></li>";
}
$output .= "\n</ul>";
$output .= $post_HTML;
echo $output;?>
		
		</div><!-- rightWidget -->
		</div><!-- rightSidebar -->