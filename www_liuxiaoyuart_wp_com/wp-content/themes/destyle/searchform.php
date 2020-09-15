<div id="searchform">
	<form method="get" action="<?php bloginfo('url'); ?>/"  class="clearfix">
	    <input type="text" name="s" id="search-text" class="text required" value="<?php echo $s; ?>" defaultvalue="<?php _e('Enter keyword', TS_DOMAIN); ?>..." />
	    <input type="submit" id="search-submit" name="submit" value="<?php _e('Ok',TS_DOMAIN); ?>" />
	</form>
</div>