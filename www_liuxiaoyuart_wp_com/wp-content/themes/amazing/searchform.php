<form method="get" action="<?php bloginfo('url'); ?>/" class="searchformI">
<fieldset>
<input type="text" value="<?php the_search_query(); ?>" name="s" class="searchterm" />
<input type="submit" value="Search" class="searchbutton" />
</fieldset>
</form>