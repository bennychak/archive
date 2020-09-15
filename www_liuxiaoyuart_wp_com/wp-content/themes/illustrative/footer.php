</div>
<!--CONTAINER ENDS HERE-->
<div id="footer">
  <!--FOOTER STARTS HERE-->
  <div id="footer-content">
    <!--FOOTER CONTENT STARTS-->
    <p>
    	<?php
			global $wpdb;
			$post_datetimes = $wpdb->get_results("SELECT YEAR(min(post_date_gmt)) AS firstyear, YEAR(max(post_date_gmt)) AS lastyear FROM $wpdb->posts WHERE post_date_gmt > 1970");
			if ($post_datetimes) {
				$firstpost_year = $post_datetimes[0]->firstyear;
				$lastpost_year = $post_datetimes[0]->lastyear;

				$copyright = __('Copyright &copy; ', 'illustrative') . $firstpost_year;
				if($firstpost_year != $lastpost_year) {
					$copyright .= '-'. $lastpost_year;
				}
				$copyright .= ' ';

				echo $copyright;
				bloginfo('name');
			}
		?> | <?php _e('Powered by <a href="http://wordpress.org/">WordPress</a> | Theme by <a href="http://patembe.com/">4MB</a>. Valid <a href="http://validator.w3.org/check?uri=referer">XHTML 1.0</a> and <a href="http://jigsaw.w3.org/css-validator/check/referer?profile=css3">CSS 3</a>', 'illustrative'); ?>
    </p>
  </div>
  <!--FOOTER CONTENT ENDS-->
</div>
<!--FOOTER ENDS HERE-->
<?php wp_footer(); ?>
</body>
</html>