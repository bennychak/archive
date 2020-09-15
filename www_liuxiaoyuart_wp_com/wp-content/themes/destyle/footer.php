		<div class="clear"></div>
	
		</div><!-- end content -->
	
	</div>
	
	<div id="content-bottom"></div>
	
	<div id="footer">
		Copyright &copy; 2010 <?php bloginfo('name'); ?> - <?php _e('All rights reserved',TS_DOMAIN); ?><br />
		Powered by <a href="http://wordpress.org" title="WordPress">WordPress</a> -
		Blog Magazine Theme by <a href="http://themeshift.com" title="ThemeShift.com">ThemeShift.com</a>
	</div>
	
	<?php if(ts_get_option('ts_color_switch')) include( TEMPLATEPATH . '/lib/inc/styleswitcher.php'); ?>

</div><!-- end main -->

<?php wp_footer(); ?>

</body>
</html>