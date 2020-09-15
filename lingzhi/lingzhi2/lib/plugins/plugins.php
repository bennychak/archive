<?php
class plugins{
	/*
	 *plugins ID:1
	 *
	 *函数功能:指定栏目信息调用
	 *调用方法:
			 {loop plugins::categoryinfo(栏目ID) $c}
			 {$c[catname]} //栏目名称
			 {$c[栏目字段]} //
			 {/loop}
	 */
	static function categoryinfo($id){
		$category=category::getInstance();
		$catinfo[] = $category->category[$id];
		$catinfo[0]['url'] = category::url($id);
		return $catinfo;
	}			
}
?>