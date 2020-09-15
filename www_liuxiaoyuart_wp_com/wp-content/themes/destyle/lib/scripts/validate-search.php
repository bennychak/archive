<?php $errormsg = __('What exactly are you searching for?', TS_DOMAIN); ?>

<script type="text/javascript">

jQuery(document).ready(function($) {

	$('#searchform input').each(function () {
		if ($(this).val() == '') {
			$(this).val($(this).attr('defaultvalue'));
		}
	}).focus(function () {
		$(this).removeClass('fielderror');
		if ($(this).val() == $(this).attr('defaultvalue')) {
			$(this).val('');
		}
	}).blur(function () {
		if ($(this).val() == '') {
			$(this).val($(this).attr('defaultvalue'));
		}
	});
	$('#searchform form').submit(function () {
		$('#searcherror').remove();
		var errors = 0;
		$(this).find('input').each(function () {
			if ($(this).val() == $(this).attr('defaultvalue')) {
				$(this).val('');
			}
			if ($(this).hasClass('required') && $(this).val() == '') {
				$(this).addClass('fielderror');
				errors++;
			}
		});
		
		if (errors > 0) {
			$(this).find('input').each(function () {
				if ($(this).val() == '') {
					$(this).val($(this).attr('defaultvalue'));
				}
			});
			$('#searchform').prepend('<div id="searcherror"><?php echo $errormsg; ?></div>');
			return false;
		}
		return true;
		
	});
	
});

</script>
