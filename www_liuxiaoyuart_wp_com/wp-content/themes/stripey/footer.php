		<div id="footer" class="newLine">
			
			<ul id="footerNav">
			
				<li <?php if(is_home()):?> class="current_page_item" <?php endif;?>><a href="<?php bloginfo("url");?>">Home</a></li>
				<?php wp_list_pages("title_li=&depth=1");?>

			</ul><!-- footerNav -->
			
			<p class="lastLine newLine aligncenter">Copyright &copy; 2009 <a href="<?php bloginfo("url"); ?>"><?php bloginfo("title");?></a> | Designed By <a href="http://www.bingowebdesign.info">Bingo</a> - The Web Design Masters | 
			Powered By <a href="www.wordpress.org">Wordpress</a></p>
			
		</div><!-- footer -->
	
	</div><!-- webPage -->
	<?php wp_footer();?>
</body>
</html>