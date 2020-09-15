		<div id="leftSidebar" class="alignleft">
		
			<?php if(!function_exists("dynamic_sidebar") || !dynamic_sidebar("Left_Sidebar")):?>
			
				<div class="leftSbTop"></div>
				<div class="leftWidget">
					<h3>Pages</h3>
					<div class="newLine"></div>
					<ul><?php wp_list_pages("title_li=");?></ul>
				</div><!-- leftWidget -->
				<div class="leftSbBottom"></div>
				
				<div class="leftSbTop"></div>
				<div class="leftWidget">
					<h3>Categories</h3>
					<div class="newLine"></div>
					<ul><?php wp_list_categories("title_li=");?></ul>
				</div><!-- leftWidget -->
				<div class="leftSbBottom"></div>
			
			<?php endif;?>
		
		</div><!-- leftSidebar -->