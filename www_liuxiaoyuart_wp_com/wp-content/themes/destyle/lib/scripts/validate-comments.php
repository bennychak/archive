<?php $errormsg = __('Please complete required fields!', TS_DOMAIN); ?>

<script type="text/javascript">

jQuery(document).ready(function($) {

	$('#commentform input, #commentform textarea').focus(function () {
		$(this).removeClass('fielderror');
		if ($(this).val() == $(this).attr('defaultvalue')) {
			$(this).val('');
		}
	}).blur(function () {
		if ($(this).val() == '') {
			$(this).val($(this).attr('defaultvalue'));
		}
	});
	$('#commentform form').submit(function () {
		$('#commenterror').remove();
		var errors = 0;
		$(this).find('textarea, input').each(function () {
			if ($(this).val() == $(this).attr('defaultvalue')) {
				if ($(this).attr('name') != 'comment_post_ID') {
					$(this).val('');
				}
			}
			if ($(this).hasClass('required') && $(this).val() == '') {
				$(this).addClass('fielderror');
				errors++;
			}
		});
		
		if (errors > 0) {
			$(this).find('textarea, input').each(function () {
				if ($(this).val() == '') {
					$(this).val($(this).attr('defaultvalue'));
				}
			});
			$(this).prepend('<div id="commenterror"><?php echo $errormsg; ?></div>');
			return false;
		}
		return true;
		
	});
	
});

</script>
