jQuery(document).ready(function($){
	
	$('#ts-styleswitcher .color').bind('click', function(){
		$('body').removeClass('blue red green grey');
		$('#ts-styleswitcher .color').removeClass('selected');
		$(this).addClass('selected');
		switch(this.id){
			case 'blue':
				$('body').addClass('blue');
				$.cookie('ts-style', 'blue',{ path: '/' });
				break;
			case 'red':
				$('body').addClass('red');
				$.cookie('ts-style', 'red',{ path: '/' });
				break;
			case 'green':
				$('body').addClass('green');
				$.cookie('ts-style', 'green',{ path: '/' });
				break;
			case 'grey':
				$('body').addClass('grey');
				$.cookie('ts-style', 'grey',{ path: '/' });
				break;
		}
		return false;
	});

});