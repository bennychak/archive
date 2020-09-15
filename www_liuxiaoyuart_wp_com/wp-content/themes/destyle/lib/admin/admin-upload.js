jQuery(document).ready(function() {

	jQuery('#ts-upload-button').click(function() {
 		formfield = jQuery('#ts-logo').attr('name');
 		tb_show('', 'media-upload.php?type=image&amp;TB_iframe=true');
 		return false;
	});

	window.send_to_editor = function(html) {
 		imgurl = jQuery('img',html).attr('src');
 		jQuery('#ts-logo').val(imgurl);
 		jQuery('#ts-logo-img').attr('src',imgurl);
 		tb_remove();
	}

});