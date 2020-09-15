<?php 

/*	##################################
	TS ADMIN THEMES PAGE
	################################## */
	
	function ts_themes_page() {

	global $options;
	
?>

	<div class="wrap">

	<div id="ts-wrap">
		
		<div id="ts-options-header">
		
			<a href="http://themeshift.com" target="_blank"><img src="<?php echo TS_ADMIN . 'img/logo-options.png'; ?>" alt="ThemeShift" width="300" height="30" /></a>
			
			<h2><?php _e('More ThemeShift Themes', TS_DOMAIN); ?></small></h2>
		
		</div>
		
		<div id="ts-options-subheader" class="clearfix">
		
			<ul>
				<li><a class="ts-options-info" href="http://themeshift.com/themes" target="_blank"><?php _e('Themes Index', TS_DOMAIN); ?></a></li>
				<li><a class="ts-options-forums" href="http://themeshift.com/support" target="_blank"><?php _e('Support Forum', TS_DOMAIN); ?></a></li>
			</ul>
		
		</div>
		    
		<div id="ts-themes-wrap">
		
			<?php
            include_once(ABSPATH . WPINC . '/feed.php');
            $rss = fetch_feed('http://themeshift.com/?feed=themesfeed');
            $maxitems = $rss->get_item_quantity(10); 
            $items = $rss->get_items(0, $maxitems);
            global $post;
            ?>
            
            <?php $i=1; foreach ( $items as $item ) : ?>
		
		    <div id="ts-themes-<?php echo $i; ?>" class="ts-section ts-toggle">
		    	<div class="ts-section-inner">
		    	
		    	<div class="ts-info">
					<a href="<?php $ts_link = $item->get_permalink(); echo str_replace('http://','http://demo.',$ts_link);  ?>" class="button" target="_blank"><?php _e('Theme Demo', TS_DOMAIN); ?></a>
		    	</div>
		    
		    	<h3 class="ts-section-logo"><span><?php echo $item->get_title();?></span></h3>
		    	
		    	<div class="ts-totoggle">
		    	
		    		<div class="ts-option ts-option-last clearfix">
		    			
		    			<?php echo $item->get_description(); ?>
		    			
		    			<p style="padding-bottom:20px"><a href="<?php echo $item->get_permalink(); ?>" class="button ts-btn-info" target="_blank"><?php _e('Theme Info', TS_DOMAIN); ?></a></p>
		    		
		    		</div><!-- end ts-option -->
		    	
		    	</div>
		    
		    	</div><!-- end ts-section-inner -->
		    </div><!-- end ts-section -->
		    
		    <?php $i++; endforeach; ?>
		
		</div>
	
	</div><!-- end ts-wrap -->
	
</div>

<?php }


/*	##################################
	TS ADMIN NEWS PAGE
	################################## */

function ts_news_page() {

	global $options;
	
?>

	<div class="wrap">

	<div id="ts-wrap">
		
		<div id="ts-options-header">
		
			<a href="http://themeshift.com" target="_blank"><img src="<?php echo TS_ADMIN . 'img/logo-options.png'; ?>" alt="ThemeShift" width="300" height="30" /></a>
			
			<h2><?php _e('Latest ThemeShift News', TS_DOMAIN); ?></small></h2>
		
		</div>
		
		<div id="ts-options-subheader" class="clearfix">
		
			<ul>
				<li><a class="ts-options-info" href="http://themeshift.com/blog" target="_blank"><?php _e('Blog', TS_DOMAIN); ?></a></li>
				<li><a class="ts-options-forums" href="http://themeshift.com/support" target="_blank"><?php _e('Support Forum', TS_DOMAIN); ?></a></li>
			</ul>
		
		</div>
		    
		<div id="ts-news-wrap">
		
			<?php
            include_once(ABSPATH . WPINC . '/feed.php');
            $rss = fetch_feed('http://themeshift.com/feed/');
            $maxitems = $rss->get_item_quantity(8); 
            $items = $rss->get_items(0, 8);			
            ?>
            
            <?php $i=1; foreach ( $items as $item ) : ?>
		
		    <div id="ts-news-<?php echo $i; ?>" class="ts-section ts-toggle">
		    	<div class="ts-section-inner">
		    	
		    	<div class="ts-news-date"><?php echo $item->get_date(get_option('date_format')); ?></div>
		    
		    	<h3 class="ts-section-logo"><span><?php echo $item->get_title();?></span></h3>
		    	
		    	<div class="ts-totoggle">
		    	
		    		<div class="ts-option ts-option-last clearfix">
		    			
		    			<p style="margin-bottom:20px"><?php echo $item->get_description();?></p>
		    			
		    			<p><a href="<?php echo $item->get_permalink(); ?>" class="button" target="_blank"><?php _e('Continue Reading', TS_DOMAIN); ?></a></p>
		    		
		    		</div><!-- end ts-option -->
		    	
		    	</div>
		    
		    	</div><!-- end ts-section-inner -->
		    </div><!-- end ts-section -->
		    
		    <?php $i++; endforeach; ?>
		
		</div>
	
	</div><!-- end ts-wrap -->
	
</div>

<?php } ?>