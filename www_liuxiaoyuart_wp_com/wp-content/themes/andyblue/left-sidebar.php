<div class="navboxwrapleft">
<div class="navboxleft">

	<?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('left_sidebar') ) : ?>


<h5><?php _e('Categories'); ?></h5>
<ul>
<?php wp_list_cats('sort_column=name&children=1'); ?>
</ul>

<?php if ( is_home() | is_archive() | is_single() ) : ?> 
	<h5>Subscribe</h5>
    <ul>
	<li><a href="http://www.bloglines.com/sub/<?php bloginfo('rss2_url') ?>" title="Add this site to Bloglines" rel="syndication">[+] Bloglines</a></li>
	<li><a href="http://www.feedster.com/myfeedster.php?action=addrss&amp;rssurl=<?php echo urlencode(get_bloginfo('rss2_url')) ?>&amp;confirm=no" title="Add this site to Feedster" rel="syndication">[+] Feedster</a></li>
	<li><a href="http://www.google.com/reader/preview/*/feed/<?php bloginfo('rss2_url') ?>" title="Add this site to Google" rel="syndication">[+] Google Reader</a></li>
	<li><a href="http://feeds.my.aol.com/add.jsp?url=<?php echo urlencode(get_bloginfo('rss2_url')) ?>" title="Add this site to My AOL" rel="syndication">[+] My AOL</a></li>
	<li><a href="http://my.msn.com/addtomymsn.armx?id=rss&amp;ut=<?php echo urlencode(get_bloginfo('rss2_url')) ?>&amp;ru=http://my.msn.com" title="Add this site to My MSN" rel="syndication">[+] My MSN</a></li>
	<li><a href="http://add.my.yahoo.com/rss?url=<?php echo urlencode(get_bloginfo('rss2_url')) ?>" title="Add this site to My Yahoo" rel="syndication">[+] My Yahoo</a></li>
	<li><a href="http://www.newsgator.com/ngs/subscriber/subext.aspx?url=<?php echo urlencode(get_bloginfo('rss2_url')) ?>" title="Add this site to Newsgator" rel="syndication">[+] Newsgator</a></li>
	<li><a href="http://client.pluck.com/pluckit/prompt.aspx?a=<?php echo urlencode(get_bloginfo('rss2_url')) ?>&amp;t=<?php echo urlencode(get_option('blogname')) ?>" title="Add this site to Pluckit" rel="syndication">[+] Pluckit</a></li>
	<li><a href="http://www.rojo.com/add-subscription?resource=<?php echo urlencode(get_bloginfo('rss2_url')) ?>" title="Add this site to Rojo" rel="syndication">[+] Rojo</a></li>
    </ul>
<?php endif // is_home()  | is_archive() ?>

	<?php endif; ?>

</div>
</div>
</div>
</div>
