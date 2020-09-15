<?php


if(!empty($_GET['in_element']))
{
$_GET['in_element']=str_replace(array('\'','"'),'',$_GET['in_element']);
$_GET['goto_html_a']=!empty($_GET['goto_html_a'])?str_replace(array('\'','"'),'',$_GET['goto_html_a']):'';

define('WP_USE_THEMES', true);

if (! isset($wp_did_header)):


$relative_path_to_wp='../../../';

$wp_did_header = true;

require_once( $relative_path_to_wp. '/wp-config.php');

wp();
gzip_compression();



$rbet_id='rbet_response_'.md5(time());
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" dir="ltr"><meta HTTP-EQUIV="Pragma" content="no-cache"/><meta HTTP-EQUIV="Expires" conetnt="-1"/><head></head><body><div id="'.$rbet_id.'">';



	if ( is_404() && $template = get_404_template() ) {
		include('404.php');
		
	} else if ( is_search() && $template = get_search_template() ) {
		include('rbet_search.php');
		
	} else if ( is_home() && $template = get_home_template() ) {
		include('rbet_index.php');
		
	} else if ( is_attachment() && $template = get_attachment_template() ) {
		include($template);
		
	} else if ( is_single() && $template = get_single_template() ) {
		if ( is_attachment() )
			add_filter('the_content', 'prepend_attachment');
		include('rbet_single.php');
		
	} else if ( is_page() && $template = get_page_template() ) {
		if ( is_attachment() )
			add_filter('the_content', 'prepend_attachment');
		include('rbet_page.php');
		
	} else if ( is_category() && $template = get_category_template()) {
		include($template);
		
	} else if ( is_tag() && $template = get_tag_template()) {
		include($template);
		
	} else if ( is_author() && $template = get_author_template() ) {
		include($template);
		
	} else if ( is_date() && $template = get_date_template() ) {
		include($template);
		
	} else if ( is_archive() && $template = get_archive_template() ) {
		include('rbet_archive.php');
		
	} else if ( is_comments_popup() && $template = get_comments_popup_template() ) {
		include($template);
		
	} else if ( is_paged() && $template = get_paged_template() ) {
		include($template);
		
	} else if ( file_exists(TEMPLATEPATH . "/index.php") ) {
		if ( is_attachment() )
			add_filter('the_content', 'prepend_attachment');
		include(TEMPLATEPATH . "/index.php");
		
	}
echo '</div>';
?>
<script type="text/javascript">
window.onload=function(ev)
	{ev=ev||window.event;
	var w=parent.$('<?php echo $_GET['in_element']; ?>');
	w.innerHTML=document.getElementById('<?php echo $rbet_id ?>').innerHTML;
	w.style.marginRight='400px';
	
	
	parent.registerLinks(w);
	//w.style.height=w.offsetHeight+"px";
	<?php if(!empty($_GET['goto_html_a'])) { ?>
	var x=parent.document.getElementsByName('<?php echo $_GET['goto_html_a'] ?>').item(0);
	if(!x)
		var x=parent.document.getElementsByName('top').item(0);
	if(x)
		parent.window.scroll(0,x.offsetTop+parent.$('page').offsetTop);
	<?php } ?>
	
	parent.alpha_elem(w,100);
	parent.rbet_session=0;
	
	}
</script>

<?php
endif;

}
?>