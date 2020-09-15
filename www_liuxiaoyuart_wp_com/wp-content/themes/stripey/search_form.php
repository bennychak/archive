<form action="<?php bloginfo("url");?>" id="searchform" method="get" role="search">
	<div>
	<input type="text" id="s" name="s" onfocus="if (this.value == 'search here...') { this.value = ''; }" value="search here..."/>
	<input type="submit" value="Search" id="searchsubmit"/>
	</div>
	</form>