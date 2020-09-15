<?php

/*	##################################
   	GET SIDEBAR ADS
	################################## */
	
?>

<?php

	$ads_dsp = ts_get_option('ts_ads_dsp');

	$ad_1_img = ts_get_option('ts_sb_ad_1_img');
	$ad_1_url = ts_get_option('ts_sb_ad_1_url');
	$ad_1_rel = ts_get_option('ts_sb_ad_1_rel');
	
	$ad_2_img = ts_get_option('ts_sb_ad_2_img');
	$ad_2_url = ts_get_option('ts_sb_ad_2_url');
	$ad_2_rel = ts_get_option('ts_sb_ad_2_rel');
	
	$ad_3_img = ts_get_option('ts_sb_ad_3_img');
	$ad_3_url = ts_get_option('ts_sb_ad_3_url');
	$ad_3_rel = ts_get_option('ts_sb_ad_3_rel');
	
	$ad_4_img = ts_get_option('ts_sb_ad_4_img');
	$ad_4_url = ts_get_option('ts_sb_ad_4_url');
	$ad_4_rel = ts_get_option('ts_sb_ad_4_rel');
	
	$ad_5_img = ts_get_option('ts_sb_ad_5_img');
	$ad_5_url = ts_get_option('ts_sb_ad_5_url');
	$ad_5_rel = ts_get_option('ts_sb_ad_5_rel');
	
	$ad_6_img = ts_get_option('ts_sb_ad_6_img');
	$ad_6_url = ts_get_option('ts_sb_ad_6_url');
	$ad_6_rel = ts_get_option('ts_sb_ad_6_rel');
	
?>

<?php if(!$ads_dsp && $ad_1_img) : ?>

<div id="sidebar-ads" class="box-right clearfix">
				
	<a href="<?php echo $ad_1_url; ?>"<?php if(!$ad_1_rel) echo ' rel="nofollow"'; ?>>
		<img src="<?php echo $ad_1_img; ?>" class="ad-left" alt="" width="125" height="125"/>
	</a>
	
	<?php if($ad_2_img) : ?>
	
		<a href="<?php echo $ad_2_url; ?>"<?php if(!$ad_2_rel) echo ' rel="nofollow"'; ?>>
			<img src="<?php echo $ad_2_img; ?>" class="ad-right" alt="" width="125" height="125"/>
		</a>
	
	<?php endif; ?>
	
	<?php if($ad_3_img) : ?>
	
		<a href="<?php echo $ad_3_url; ?>"<?php if(!$ad_3_rel) echo ' rel="nofollow"'; ?>>
			<img src="<?php echo $ad_3_img; ?>" class="ad-left" alt="" width="125" height="125"/>
		</a>
	
	<?php endif; ?>
	
	<?php if($ad_4_img) : ?>
    
   		<a href="<?php echo $ad_4_url; ?>"<?php if(!$ad_4_rel) echo ' rel="nofollow"'; ?>>
			<img src="<?php echo $ad_4_img; ?>" class="ad-right" alt="" width="125" height="125"/>
		</a>
	
	<?php endif; ?>
	
	<?php if($ad_5_img) : ?>
    
   		<a href="<?php echo $ad_5_url; ?>"<?php if(!$ad_5_rel) echo ' rel="nofollow"'; ?>>
			<img src="<?php echo $ad_5_img; ?>" class="ad-left" alt="" width="125" height="125"/>
		</a>
	
	<?php endif; ?>
	
	<?php if($ad_6_img) : ?>
    
   		<a href="<?php echo $ad_6_url; ?>"<?php if(!$ad_6_rel) echo ' rel="nofollow"'; ?>>
			<img src="<?php echo $ad_6_img; ?>" class="ad-right" alt="" width="125" height="125"/>
		</a>
	
	<?php endif; ?>
    
</div><!-- end box-right -->

<?php endif; ?>