		<?php get_header();?>
		
		<?php get_sidebar();?>
		
		<div id="articleBar" class="alignleft">
		
		<?php if(have_posts()): while(have_posts()): the_post();?>
		
			<div class="postArticle content newLine">
			
				<span class="date"><?php the_time("M d");?></span>
				
				<div class="postTitleLabel roundedCorner">
				
					<h2 class="postTitle"><a href="<?php the_permalink();?>"><?php the_title();?></a></h2>
					<span class="byAuthor">By <span><?php the_author();?></span></span>
					
				</div><!-- postTitleLabel -->
				<div class="newLine"></div>
				<span class="iconPost newLine"></span>
				<span class="categories ">Categories: <?php the_category(", ");?></span>
				<span class="tags">Tags: <?php the_tags(" ");?></span>
					
				<div class="postContent">
				
					<?php the_content("<br/><br/>read more");?>
				
				</div><!-- postConteont -->
				
				
				<div class="pagedPost aligncenter"><?php wp_link_pages('before=<p>Page&after=</p>&next_or_number=number&pagelink=%'); ?></div>
			</div><!-- postArticle -->
		
		<?php endwhile;?>
		<?php else:?>
		
			<div class="postArticle">
			
				<h2>Ups! Nothing was found here...</h2>
				
				<p> We are sorry. Could you try searching for something else?</p>
				
			
			</div><!-- postArticle -->
		
		<?php endif;?>
		<div style="text-align:center; font-size:1.2em; font-weight:bold;">
<?php posts_nav_link(' &#183; ', 'previous page', 'next page'); ?>
</div>	
		<div class="commentArea newLine content">
		
			<?php comments_template();?>
		
		</div><!-- commentArea -->


		</div><!-- articleBar -->
		
	<?php include (TEMPLATEPATH."/right_sidebar.php");?>
		
		<div id="footer" class="newLine">
			
			<ul id="footerNav">
			
				<li <?php if(is_home()):?> class="current_page_item" <?php endif;?>><a href="<?php bloginfo("url");?>">Home</a></li>
				<?php wp_list_pages("title_li=&depth=1");?>

			</ul><!-- footerNav -->
			
			<p class="lastLine newLine aligncenter">Copyright &copy; 2009 <a href="<?php bloginfo("url"); ?>"><?php bloginfo("title");?></a> | Designed By <a href="#">Bingo</a>. | 
			Powered By <a href="www.wordpress.org">Wordpress</a></p>
			
		</div><!-- footer -->
	
	</div><!-- webPage -->
	<?php wp_footer();?>
</body>
</html>
