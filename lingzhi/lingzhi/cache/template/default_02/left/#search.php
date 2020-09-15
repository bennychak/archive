<?php defined('ROOT') or exit('Can\'t Access !'); ?>
<div class="t_1 mb10"><div><h3>搜索</h3></div></div>
<div id="search" style="padding-left:20px;">
<form name='search' action="<?php echo url('archive/search');?>" onsubmit="search_check();" method="post">
<input  id="inputsearch" name="keyword" type="text" align="absmiple" />&nbsp; 
<input type="submit" class="s_btn" align="absmiple" name='submit' value=" " />
</form>
</div>