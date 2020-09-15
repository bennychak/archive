<?php $attachments = get_children( array('post_parent' => $post->ID, 'post_type' => 'attachment', 'post_mime_type' => 'image', 'order' => 'ASC', 'orderby' => 'menu_order ID') ); ?>
<?php $gallery = get_post_meta($post->ID, "gallery", true); ?>
<?php $gallery_title = get_post_meta($post->ID, "gallery_title", true) ? get_post_meta($post->ID, "gallery_title", true) : __('Gallery', TS_DOMAIN); ?>

<?php // photo gallery with custom field 'gallery' (comma-separated media file IDs => 12,34,69)
	if($gallery) : $images = explode(',',$gallery); ?>

<div id="gallery" class="box-left clearfix clear">

    <h2><?php echo $gallery_title; ?></h2>

    <?php foreach ($images as $image_id) : $src = wp_get_attachment_image_src($image_id, 'full'); $image_post = get_post($image_id); ?>
        
	<div class="img"><a href="<?php echo $src[0]; ?>" title="<?php echo $image_post->post_content; ?>" rel="prettyPhoto[gallery]"><?php echo wp_get_attachment_image($image_id, 'thumbnail'); ?></a></div>
        
	<?php endforeach; ?>

</div><!-- end gallery -->

<?php // photo gallery with attachments
	elseif($attachments && get_post_meta($post->ID, "attachments", true)) : ?>
            
<div id="gallery" class="box-left clearfix clear">

    <h2><?php echo $gallery_title; ?></h2>
        
    <?php foreach($attachments as $attachment_id => $attachment) : $src = wp_get_attachment_image_src($attachment_id, 'full'); ?>
    
    <div class="img"><a href="<?php echo $src[0]; ?>" title="<?php echo $attachment->post_content; ?>" rel="prettyPhoto[gallery]"><?php echo wp_get_attachment_image($attachment_id, 'thumbnail'); ?></a></div>
    
    <?php endforeach; ?>

</div><!-- end attachments -->

<?php endif; // endif gallery ?>