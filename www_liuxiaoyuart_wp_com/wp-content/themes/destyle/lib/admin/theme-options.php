<?php

/*	##################################
	TS ADMIN THEME SETTINGS
	################################## */

require_once( TEMPLATEPATH . '/lib/admin/theme-admin.php');

add_action( 'admin_init', 'register_ts_options' );

function register_ts_options() {
	register_setting( 'ts-options-group', 'ts_options' );
}

function ts_settings_page() {

	global $ts_options;
	
/*	##################################
	TS ADMIN THEME OPTIONS
	################################## */
	
?>
<div class="wrap">

	<div id="ts-wrap">
		
		<div id="ts-options-header">
		
			<a href="http://themeshift.com" target="_blank"><img src="<?php echo TS_ADMIN . 'img/logo-options.png'; ?>" alt="ThemeShift" width="300" height="30" /></a>
			
			<h2><?php echo TS_THEME; ?> <small><?php echo TS_VERSION; ?></small></h2>
		
		</div>
		
		<div id="ts-options-subheader" class="clearfix">
		
			<ul>
				<li><a class="ts-options-info" href="http://themeshift.com/<?php echo TS_DOMAIN; ?>" target="_blank"><?php _e('Theme Page', TS_DOMAIN); ?></a></li>
				<li><a class="ts-options-help" href="http://themeshift.com/<?php echo TS_DOMAIN; ?>/help" target="_blank"><?php _e('Help Center', TS_DOMAIN); ?></a></li>
				<li><a class="ts-options-forums" href="http://themeshift.com/support" target="_blank"><?php _e('Support Forum', TS_DOMAIN); ?></a></li>
			</ul>
			
			<?php if($_REQUEST['updated'] || $_REQUEST['reset']) echo '<div id="ts-message">'.TS_THEME.' '.__('Settings updated', TS_DOMAIN).'</div>'; ?>
		
		</div>
		
		<form id="ts-form" method="post" action="options.php">
		
		    <?php settings_fields( 'ts-options-group' ); ?>
		    <?php $ts_options = get_option('ts_options'); ?>
		    
		    <div id="ts-options-wrap">
		    
		    	<div id="ts-1" class="ts-section ts-toggle">
		    		<div class="ts-section-inner">	
		    		
		    		<div class="ts-submit"><input type="submit" class="button" value="<?php _e('Save Changes', TS_DOMAIN); ?>" /></div>
		    	
		    		<h3 class="ts-section-logo"><span><?php _e('General', TS_DOMAIN); ?></span></h3>
		    		
		    		<div class="ts-totoggle clear">
		    		
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Logo', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    				
		    					<?php $logo = $ts_options['ts_logo'] ? $ts_options['ts_logo'] : TS_IMG . 'logo.png'; ?>
								<p class="ts-bg-logo-img"><img id="ts-logo-img" src="<?php echo $logo; ?>" /></p>
                
                    			<p><input name="ts_options[ts_logo]" id="ts-logo" class="ts-text ts-upload" type="text" value="<?php if ($ts_options['ts_logo']) { echo $ts_options['ts_logo']; } else { echo $logo; } ?>" /><input id="ts-upload-button" type="button" class="button" value="<?php _e('Upload Image', TS_DOMAIN); ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter an URL or upload your custom logo.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->		    			
		    			
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('RSS URL', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
                
                    			<p><input name="ts_options[ts_rss]" class="ts-text" type="text" value="<?php echo $ts_options['ts_rss']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter your custom RSS URL (e.g. Feedburner).', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Twitter', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
                
                    			<p><input name="ts_options[ts_twitter]" class="ts-text" type="text" value="<?php echo $ts_options['ts_twitter']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter your Twitter user (e.g. <code>themeshift</code>).', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Custom CSS', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    		
		    					<p><textarea name="ts_options[ts_css]" class="ts-text ts-textarea" cols="" rows=""><?php echo $ts_options['ts_css']; ?></textarea></p>
		    			
		    					<p class="ts-description"><?php _e('Easily add some custom css to the head of your theme.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-last clearfix">		    			
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Tracking Code', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    		
		    					<p><textarea name="ts_options[ts_tracking]" class="ts-text ts-textarea" cols="" rows=""><?php echo $ts_options['ts_tracking']; ?></textarea></p>
		    			
		    					<p class="ts-description"><?php _e('Insert your tracking code here (e.g. Google Analytics). This code will be added to the footer of the theme.', TS_DOMAIN); ?></p>
		    			
		    				</div>		    				
		    			
		    			</div><!-- end ts-option -->
		    		
		    		</div>
		    	
		    		</div><!-- end ts-section-inner -->
		    	</div><!-- end ts-section -->
		    	
		    	<div id="ts-2" class="ts-section ts-toggle">
		    		<div class="ts-section-inner">   		
		    		
		    		<span class="ts-submit"><input type="submit" class="button" value="<?php _e('Save Changes', TS_DOMAIN); ?>" /></span>
		    	
		    		<h3 class="ts-section-logo"><span><?php _e('Layout', TS_DOMAIN); ?></span></h3>
		    		
		    		<div class="ts-totoggle">
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Color Scheme', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    		
		    					<p>
		    					
		    						<select name="ts_options[ts_color]" class="ts-select">
										<option<?php if($ts_options['ts_color']=='blue') echo ' selected="selected"'; ?> value="blue">Blue</option>
										<option<?php if($ts_options['ts_color']=='red') echo ' selected="selected"'; ?> value="red">Red</option>
										<option<?php if($ts_options['ts_color']=='green') echo ' selected="selected"'; ?> value="green">Green</option>
										<option<?php if($ts_options['ts_color']=='grey') echo ' selected="selected"'; ?> value="grey">Grey</option>
									</select>
									
								</p>
		    			
		    					<p class="ts-description"><?php _e('Please select your preferred color scheme.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_color_switch]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_color_switch']); ?> /> <?php _e('Display color switcher?', TS_DOMAIN); ?></p>
		    			
		    					<p class="ts-description"><?php _e('Tick the box to display a jQuery color switcher.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt ts-option-last clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Background', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    		
		    					<p>
		    					
		    						<select name="ts_options[ts_bg]" class="ts-select">
		    							<option<?php if($ts_options['ts_bg']=='noise') echo ' selected="selected"'; ?> value="noise">Noise</option>
										<option<?php if($ts_options['ts_bg']=='damask') echo ' selected="selected"'; ?> value="damask">Damask</option>
										<option<?php if($ts_options['ts_bg']=='carbon') echo ' selected="selected"'; ?> value="carbon">Carbon</option>
										<option<?php if($ts_options['ts_bg']=='squares') echo ' selected="selected"'; ?> value="squares">Squares</option>
										<option<?php if($ts_options['ts_bg']=='none') echo ' selected="selected"'; ?> value="none">None</option>
									</select>
									
								</p>
		    			
		    					<p class="ts-description"><?php _e('Please select your preferred background pattern for header and footer.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    		
		    		</div>
		    	
		    		</div><!-- end ts-section-inner -->
		    	</div><!-- end ts-section -->
		    	
		    	<div id="ts-3" class="ts-section ts-toggle">
		    		<div class="ts-section-inner">   		
		    		
		    		<span class="ts-submit"><input type="submit" class="button" value="<?php _e('Save Changes', TS_DOMAIN); ?>" /></span>
		    	
		    		<h3 class="ts-section-logo"><span><?php _e('Menu', TS_DOMAIN); ?></span></h3>
		    		
		    		<div class="ts-totoggle">
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Home', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_ex_home]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_ex_home']); ?> /> <?php _e('Exclude home link from menu?', TS_DOMAIN); ?></p>
		    			
		    					<p class="ts-description"><?php _e('Exclude the home link from the menu. The logo will also be linked to the home page.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    		
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Categories'); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    				
		    					<p><input name="ts_options[ts_ex_cats]" class="ts-text" type="text" value="<?php echo $ts_options['ts_ex_cats']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter the category IDs you want to exlcude from the menu (e.g. 2,5,9).', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Pages'); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_ex_pages]" class="ts-text" type="text" value="<?php echo $ts_options['ts_ex_pages']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter the page IDs you want to exlcude from the menu (e.g. 3,65,71).', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt ts-option-last clearfix">
		    					
		    				<p class="ts-description"><?php _e('Please note that the menu options will only work if you do NOT use the new WordPress 3.0 custom menu.', TS_DOMAIN); ?></p>
		    			
		    			</div><!-- end ts-option -->
		    		
		    		</div>
		    	
		    		</div><!-- end ts-section-inner -->
		    	</div><!-- end ts-section -->
		    	
		    	<div id="ts-4" class="ts-section ts-toggle">
		    		<div class="ts-section-inner">   		
		    		
		    		<span class="ts-submit"><input type="submit" class="button" value="<?php _e('Save Changes', TS_DOMAIN); ?>" /></span>
		    	
		    		<h3 class="ts-section-logo"><span><?php _e('Sidebar Ads', TS_DOMAIN); ?></span></h3>
		    		
		    		<div class="ts-totoggle">
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4><?php _e('Display', TS_DOMAIN); ?>:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_ads_dsp]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_ads_dsp']); ?> /> <?php _e('Hide Ads?', TS_DOMAIN); ?></p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to hide the follwing ads from the sidebar.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #1:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_1_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_1_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_1_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_1_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_1_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_1_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #2:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_2_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_2_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_2_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_2_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_2_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_2_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #3:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_3_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_3_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_3_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_3_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_3_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_3_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #4:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_4_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_4_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_4_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_4_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_4_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_4_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-alt clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #5:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_5_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_5_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_5_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_5_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_5_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_5_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    			
		    			<div class="ts-option ts-option-last clearfix">
		    			
		    				<div class="ts-option-left">
		    				
		    					<h4>Ad #6:</h4>
		    				
		    				</div>
		    				
		    				<div class="ts-option-right">
		    					
		    					<p><input name="ts_options[ts_sb_ad_6_img]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_6_img']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter image url of a square button (125x125px).', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_6_url]" class="ts-text" type="text" value="<?php echo $ts_options['ts_sb_ad_6_url']; ?>" /></p>
		    			
		    					<p class="ts-description"><?php _e('Please enter link url of this ad.', TS_DOMAIN); ?></p>
		    					
		    					<p><input name="ts_options[ts_sb_ad_6_rel]" type="checkbox" value="1" <?php checked('1', $ts_options['ts_sb_ad_6_rel']); ?> /> Nofollow?</p>
		    			
		    					<p class="ts-description"><?php _e('Check the box to remove nofollow of this ad.', TS_DOMAIN); ?></p>
		    			
		    				</div>
		    			
		    			</div><!-- end ts-option -->
		    		
		    		</div>
		    	
		    		</div><!-- end ts-section-inner -->
		    	</div><!-- end ts-section -->
		    
		    </div>
		
		</form>
	
	</div><!-- end ts-wrap -->
	
</div>
<?php } 

require_once( TEMPLATEPATH . '/lib/admin/theme-pages.php');

?>